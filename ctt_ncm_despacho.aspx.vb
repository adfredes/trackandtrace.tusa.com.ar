Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO
Partial Class ctt_ncm_despacho
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        Dim jScript As New StringBuilder
        jScript.Append("function enable_fecha(){")
        jScript.Append("if (document.getElementById('" & ddlFechas.ClientID & "').selectedIndex == 0){")
        jScript.Append("document.getElementById('" & txtDesde.ClientID & "').disabled=true;")
        jScript.Append("document.getElementById('" & txtHasta.ClientID & "').disabled=true;")
        jScript.Append("}else{")
        jScript.Append("document.getElementById('" & txtDesde.ClientID & "').disabled=false;")
        jScript.Append("document.getElementById('" & txtHasta.ClientID & "').disabled=false;")
        'jScript.Append("txt.disabled = true;")        
        'jScript.Append("document.getElementById('txtDesde').disabled=true;")
        'jScript.Append("document.getElementById('txtHasta').disabled=true;")
        jScript.Append("}}")

        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "enable_fecha", jScript.ToString, True)
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
                Response.Redirect("denegado.aspx")
            End If
            txtDesde.Text = DateTime.Now.AddDays(-7).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString

            'Label1.Text = ""
            'Me.GridView1.PageIndex = 0
            'bindGrilla(Me.GridView1)
        End If
    End Sub



    Private Sub bindGrilla(ByVal gv As GridView)
        Dim ds As Data.DataSet = buscar()
        gv.DataSource = ds
        gv.DataMember = "Listado"
        Try
            gv.DataBind()
            Label1.Text = gv.PageSize * gv.PageIndex + gv.Rows.Count & " de " & ds.Tables("Listado").Rows.Count & " operaciones"
        Catch ex As Exception
            Label1.Text = "No se encontraron operaciones."
        End Try
    End Sub

    Protected Function buscar() As Data.DataSet
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        Dim SP As String

        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        oComm.CommandType = Data.CommandType.StoredProcedure
        Dim lparam As New List(Of SqlParameter)
        Dim param As SqlParameter
        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        Dim lbl As Label = Master.FindControl("lblUser")
        param.Value = lbl.Text
        lparam.Add(param)
        param = (New SqlParameter("@tipo", Data.SqlDbType.Char, 255))
        param.Value = ddlTipo.SelectedValue
        lparam.Add(param)

        param = (New SqlParameter("@desde", SqlDbType.SmallDateTime))
        If Trim(txtDesde.Text) = "" Then
            param.Value = DateTime.Now.AddDays(-365).ToShortDateString
        Else
            param.Value = txtDesde.Text
        End If

        lparam.Add(param)
        param = (New SqlParameter("@hasta", SqlDbType.SmallDateTime))
        If Trim(txtHasta.Text) = "" Then
            param.Value = DateTime.Now.ToShortDateString
        Else
            param.Value = txtHasta.Text
        End If
        lparam.Add(param)

        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString


        SP = "lstNCMDespachoDetallado"


        If oCC.consultaSP(SP, lparam.ToArray, "Listado") = False Then
            Response.Redirect("error-page.aspx")
            Return Nothing
        Else
            Return oCC.oDS
        End If
    End Function

    Protected Sub ibBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click
        Me.GViTEM2.PageIndex = 0
        Me.GViTEM2.Visible = True
        bindGrilla(Me.GViTEM2)
    End Sub
    Protected Sub ddlSizeGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSizeGrid.SelectedIndexChanged
        GViTEM2.PageSize = ddlSizeGrid.SelectedValue
        Me.GViTEM2.PageIndex = 0
        Me.GViTEM2.Visible = True
        bindGrilla(Me.GViTEM2)
    End Sub
    Protected Sub ibExcel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibExcel.Click
        Dim sb As StringBuilder = New StringBuilder()
        Dim sw As StringWriter = New StringWriter(sb)
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim pagina As Page = New Page
        Dim grilla As New GridView

        grilla = GViTEM2


        grilla.EnableViewState = False
        grilla.AllowPaging = False
        bindGrilla(grilla)
        'grilla.Columns(0).Visible = False
        Dim form = New HtmlForm
        pagina.EnableEventValidation = False
        pagina.DesignerInitialize()
        pagina.Controls.Add(form)
        form.Controls.Add(grilla)
        pagina.RenderControl(htw)
        If grilla.Rows.Count = 0 Then
            sb = New StringBuilder()
            sb.Append("<table>")
            sb.Append("<tr>")
            For Each dc As DataControlField In grilla.Columns
                If Not Trim(dc.HeaderText) = "" Then
                    sb.Append("<td>")
                    sb.Append(dc.HeaderText)
                    sb.Append("</td>")
                End If
            Next
            sb.Append("</tr>")
            sb.Append("</table>")
        End If
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("Content-Disposition", "attachment;filename=data.xls")
        ';filename=data.xls
        Response.Charset = "UTF-8"
        Response.ContentEncoding = Encoding.Default
        Response.Write(sb.ToString())
        Response.End()        
    End Sub

    Protected Sub ibCsv_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibCsv.Click
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        Dim ds As Data.DataSet = buscar()

        'For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
        '    sbr.Append(dc.ColumnName & ";")
        'Next
        Dim gv As GridView

        gv = GViTEM2

        For Each dc As DataControlField In gv.Columns
            If Not Trim(dc.HeaderText) = "" Then
                sbr.Append(dc.HeaderText & ";")
            End If
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


    Protected Sub GViTEM2_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GViTEM2.PageIndexChanging
        GViTEM2.PageIndex = e.NewPageIndex
        bindGrilla(GViTEM2)
    End Sub


    
End Class
