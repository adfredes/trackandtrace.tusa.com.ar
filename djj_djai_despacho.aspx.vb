Imports System.Data
Imports System.Data.SqlClient
Partial Class djj_djai_despacho
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "aparece", "function onUpdating(){var updateProgressDiv = $get('updateProgressDiv');updateProgressDiv.style.display = '';}function onUpdated() {var updateProgressDiv = $get('updateProgressDiv');updateProgressDiv.style.display = 'none';}", True)
        If Not Page.IsPostBack Then
            Panel2.Visible = False
            'If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
            'Response.Redirect("denegado.aspx")
            'End If
            Dim Cabecera As Panel = Me.Master.FindControl("Panel4")
            Cabecera.Visible = True
        End If
    End Sub


    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        binddata()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'If (e.Row.RowType = DataControlRowType.DataRow) Then
        'e.Row.Attributes("onmouseover") = "javascript:setMouseOverColor(this);"
        'e.Row.Attributes("onmouseout") = "javascript:setMouseOutColor(this);"
        'e.Row.Attributes("onclick") = "javascript:window.open('ctt_detalle_djai.aspx?psp=" & Trim(e.Row.Cells(1).Text) & "','','scrollbars=1,menubar=0,resizable=1,width=650,height=500,toolbars=0');"
        'e.Row.Attributes("onclick") = "javascript:location.href='detalle_djai.aspx?psp=" & Trim(e.Row.Cells(1).Text) & "';"
        'End If

        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Me.GridView1.PageIndex = 0
        Panel2.Visible = True
        binddata()
    End Sub

    Sub binddata()
        Dim ds As DataSet = getData()
        GridView1.DataSource = ds
        GridView1.DataMember = "Listado"
        Try
            GridView1.DataBind()
            Label1.Text = GridView1.PageSize * GridView1.PageIndex + GridView1.Rows.Count & " de " & ds.Tables("Listado").Rows.Count & " operaciones"
        Catch ex As Exception
            Label1.Text = "0 de 0 operaciones"
        End Try
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim ds As DataSet = getData()
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
            sbr.Append(dc.ColumnName & ";")
        Next
        For Each dr As Data.DataRow In ds.Tables("Listado").Rows
            sbr.AppendLine("")
            For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
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

    End Sub

    Function getData() As DataSet
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ConnectionString)
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter



        If Trim(txtDesde.Text) <> "" Then
            param = New SqlParameter("@desde", Data.SqlDbType.SmallDateTime)
            param.Direction = ParameterDirection.Input
            param.Value = Me.txtDesde.Text
            lisPrm.Add(param)
        Else
            param = New SqlParameter("@desde", Data.SqlDbType.SmallDateTime)
            param.Direction = ParameterDirection.Input
            param.Value = "01/01/1990"
            lisPrm.Add(param)
        End If

        If Trim(txtHasta.Text) <> "" Then
            param = New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime)
            param.Direction = ParameterDirection.Input
            param.Value = Me.txtHasta.Text
            lisPrm.Add(param)
        Else
            param = New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime)
            param.Direction = ParameterDirection.Input
            param.Value = Date.Today.AddDays(1)
            lisPrm.Add(param)
        End If
        param = New SqlParameter("@cliente", Data.SqlDbType.NVarChar, 255)
        param.Direction = ParameterDirection.Input
        Dim lbl As Label = Master.FindControl("lblUser")
        param.Value = Trim(lbl.Text)
        lisPrm.Add(param)
        oCC.consultaSP("listDespDjai", lisPrm.ToArray, "Listado")


        Return oCC.oDS
    End Function

End Class
