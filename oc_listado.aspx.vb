Imports System
Imports System.Data
Imports System.Data.SqlClient

Partial Class oc_listado
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        bindata()
    End Sub

    Sub bindata()
        Dim lbl As Label = Me.Master.FindControl("lblUser")
        If Trim(lbl.Text) = "UNILEVER DE ARGENTINA S.A." Then
            Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
            Dim lparam As New List(Of SqlParameter)
            Dim param As SqlParameter
            ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
            If Trim(txtDespa.Text) = "" Then
                If txtDesde.Text = "" And txtHasta.Text = "" Then
                    Exit Sub
                End If
                param = New SqlParameter("desde", Data.SqlDbType.SmallDateTime)
                param.Value = txtDesde.Text & " 00:00:00"
                lparam.Add(param)

                param = New SqlParameter("hasta", Data.SqlDbType.SmallDateTime)
                param.Value = CDate(txtHasta.Text).AddDays(1) & " 00:00:00"
                lparam.Add(param)

                occ.consultaSP("OrdenesCompraU_GetByAlta", lparam.ToArray)
            Else
                param = New SqlParameter("oc", Data.SqlDbType.NVarChar, 50)
                param.Value = "%" & Trim(txtDespa.Text) & "%"
                lparam.Add(param)
                occ.consultaSP("OrdenesCompraU_GetByOc", lparam.ToArray)
            End If

            If Not occ.oDS Is Nothing AndAlso occ.oDS.Tables.Count > 0 Then
                gvOc.DataSource = occ.oDS.Tables(0)
                gvOc.DataBind()
            End If
        End If
    End Sub

    Protected Sub gvOc_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvOc.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes("onmouseover") = "javascript:setMouseOverColor(this);"
            e.Row.Attributes("onmouseout") = "javascript:setMouseOutColor(this);"

            For x As Integer = 0 To e.Row.Cells.Count - 1
                e.Row.Cells(x).Attributes("onclick") = "javascript:window.open('oc_alta.aspx?at=View&id=" & Trim(e.Row.Cells(0).Text) & "','','scrollbars=1,menubar=0,resizable=1,width=800,height=500,toolbars=0');"
            Next
        End If
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim lbl As Label = Me.Master.FindControl("lblUser")
        If Trim(lbl.Text) = "UNILEVER DE ARGENTINA S.A." Then
            Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
            Dim lparam As New List(Of SqlParameter)
            Dim param As SqlParameter
            ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
            If Trim(txtDespa.Text) = "" Then
                If txtDesde.Text = "" And txtHasta.Text = "" Then
                    Exit Sub
                End If
                param = New SqlParameter("desde", Data.SqlDbType.SmallDateTime)
                param.Value = txtDesde.Text & " 00:00:00"
                lparam.Add(param)

                param = New SqlParameter("hasta", Data.SqlDbType.SmallDateTime)
                param.Value = CDate(txtHasta.Text).AddDays(1) & " 00:00:00"
                lparam.Add(param)
                occ.consultaSP("OrdenesCompraUExc_GetByAlta", lparam.ToArray)
            Else
                param = New SqlParameter("oc", Data.SqlDbType.NVarChar, 50)
                param.Value = "%" & Trim(txtDespa.Text) & "%"
                lparam.Add(param)
                occ.consultaSP("OrdenesCompraUExc_GetByOc", lparam.ToArray)
            End If

            If Not occ.oDS Is Nothing AndAlso occ.oDS.Tables.Count > 0 Then
                Dim oc As String = ""
                ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
                Dim sbr As New StringBuilder
                Dim targetEncoding As Encoding
                For Each dc As Data.DataColumn In occ.oDS.Tables(0).Columns
                    If Not LCase(dc.ColumnName) = "idoc" And Not LCase(dc.ColumnName) = "nro_linea" Then
                        sbr.Append(UCase(dc.ColumnName) & ";")
                    End If
                Next


                Dim nro_linea As String = ""
                Dim idoc As String = ""

                For Each dr As Data.DataRow In occ.oDS.Tables(0).Rows
                    If dr.Item("idoc").ToString = idoc And dr.Item("nro_linea").ToString = nro_linea Then
                        sbr.Append(dr.Item("DJAI") & ";")
                        sbr.Append(dr.Item("Estado") & ";")
                    Else
                        idoc = dr.Item("idoc").ToString
                        nro_linea = dr.Item("nro_linea").ToString
                        sbr.AppendLine("")
                        For Each dc As Data.DataColumn In occ.oDS.Tables(0).Columns
                            If Not LCase(dc.ColumnName) = "idoc" And Not LCase(dc.ColumnName) = "nro_linea" Then
                                sbr.Append(dr.Item(dc.ColumnName) & ";")
                            End If
                        Next
                    End If
                Next
                targetEncoding = Encoding.GetEncoding(0)
                Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
                Response.ContentType = "application/octet-stream"
                Response.AddHeader("Content-Disposition", "attachment;filename=reporte.csv")
                Response.OutputStream.Write(algo, 0, algo.Length)
                Response.End()
                Response.Flush()


            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor = 'pointer';oldgridSelectedColor = element.style.backgroundColor; element.style.backgroundColor = 'yellow';} function setMouseOverColorBlue(element) {document.body.style.cursor = 'pointer';oldgridSelectedColor = element.style.backgroundColor; element.style.backgroundColor = 'black';} function setMouseOutColor(element) {document.body.style.cursor = 'default';element.style.backgroundColor = oldgridSelectedColor; element.style.textDecoration = 'none';}", True)
        If Not Page.IsPostBack Then
            'Dim oCC As New clsConex

            ''Panel2.Visible = False
            'If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
            '    Response.Redirect("denegado.aspx")
            'End If
            Dim Cabecera As Panel = Me.Master.FindControl("Panel4")
            Cabecera.Visible = True
        End If
    End Sub
End Class
