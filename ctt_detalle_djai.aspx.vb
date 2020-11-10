
Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class ctt_detalle_djai
    Inherits System.Web.UI.Page

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        bindConsumido(Request.QueryString("psp").ToString, gvItems.SelectedRow.Cells(1).Text)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim despacho As String = Request.QueryString("psp").ToString            
            bindDjai(despacho)
        End If
    End Sub

    Sub bindDjai(ByVal despacho As String)
        'lstDetalleDjai
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter

        param = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 50, Data.ParameterDirection.Input)
        param.Value = despacho
        lisPrm.Add(param)

        occ.consultaSP("lstDetalleDjai", lisPrm.ToArray, "Lista")
        gvItems.DataSource = occ.oDS
        gvItems.DataMember = "Lista"
        gvItems.DataBind()

        occ.consultaSP("SIMI_IntervencionesGet", lisPrm.ToArray, "Lista2")
        gvInterv.DataSource = occ.oDS
        gvInterv.DataMember = "Lista2"
        gvInterv.DataBind()

        occ.consultaSP("SIMI_FechasGet", lisPrm.ToArray, "Lista3")
        gvFechas.DataSource = occ.oDS
        gvFechas.DataMember = "Lista3"
        gvFechas.DataBind()

        occ.consultaSP("ListCambiosDjai", lisPrm.ToArray, "Lista4")
        gvCambios.DataSource = occ.oDS
        gvCambios.DataMember = "Lista4"
        gvCambios.DataBind()

        bindConsumido(despacho, "0001")

        lisPrm.Clear()
        'af_GetArchivos
        param = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16)
        param.Value = despacho
        lisPrm.Add(param)
        If occ.consultaSP("af_GetArchivos", lisPrm.ToArray, "despa_Archivos") Then
            Me.gvArchivos.DataSource = occ.oDS
            Me.gvArchivos.DataMember = "despa_Archivos"
            Me.gvArchivos.DataBind()
            If occ.oDS.Tables("despa_Archivos").Rows.Count > 0 Then
                gvArchivos.Columns(3).Visible = False
                gvArchivos.Columns(2).Visible = False
                Panel1.Visible = True
            Else
                Panel1.Visible = False
            End If
        Else
            Panel1.Visible = False
        End If
    End Sub

    Sub bindConsumido(ByVal despacho As String, ByVal item As String)

        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter

        lblItem.Text = "Detalle consumos del item " & item

        param = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 50, Data.ParameterDirection.Input)
        param.Value = despacho
        lisPrm.Add(param)

        param = New SqlParameter("@item", Data.SqlDbType.NVarChar, 50, Data.ParameterDirection.Input)
        param.Value = item
        lisPrm.Add(param)

        occ.consultaSP("lstConsumoItemDjai", lisPrm.ToArray, "Lista")
        GridView1.DataSource = occ.oDS
        GridView1.DataMember = "Lista"
        GridView1.DataBind()
    End Sub

    Protected Sub gvItems_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles gvItems.SelectedIndexChanging
        bindConsumido(Request.QueryString("psp").ToString, gvItems.Rows(e.NewSelectedIndex).Cells(1).Text)
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim despacho As String = Request.QueryString("psp").ToString
        Dim param As SqlParameter

        param = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 50, Data.ParameterDirection.Input)
        param.Value = despacho
        lisPrm.Add(param)

        occ.consultaSP("lstConsumoDjai", lisPrm.ToArray, "Lista")

        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        sbr.Append("DJAI: " & Request.QueryString("psp").ToString)
        sbr.AppendLine("")
        For Each dc As Data.DataColumn In occ.oDS.Tables("Lista").Columns
            sbr.Append(dc.ColumnName & ";")
        Next
        For Each dr As Data.DataRow In occ.oDS.Tables("Lista").Rows
            sbr.AppendLine("")
            For Each dc As Data.DataColumn In occ.oDS.Tables("Lista").Columns
                sbr.Append(dr.Item(dc.ColumnName) & ";")
            Next
        Next
        targetEncoding = Encoding.GetEncoding(0)
        Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
        Response.ContentType = "application/octet-stream"
        Response.AddHeader("Content-Disposition", "attachment;filename=reporte.csv")
        Response.OutputStream.Write(algo, 0, algo.Length)
        Response.End()
        Response.Flush()
        'GridView1.DataSource = occ.oDS
        'GridView1.DataMember = "Lista"
        'GridView1.DataBind()
    End Sub

    Protected Sub gvArchivos_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvArchivos.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('VisorArchivosModal','tyt_files/" & e.Row.Cells(2).Text & "/" & e.Row.Cells(3).Text & "');"
        End If
    End Sub
End Class
