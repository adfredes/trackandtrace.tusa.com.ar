Imports System.Data.SqlClient
Partial Class doc_archivos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            buscar()
        End If
    End Sub

    Private Sub buscar()
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("edoc").ConnectionString)
        Dim oComm As New System.Data.SqlClient.SqlCommand
        Dim id_carpeta As Integer
        Try
            id_carpeta = CInt(Request.QueryString("id_archivo"))
        Catch ex As Exception
            Response.Redirect("doc_carpetas.aspx")
        End Try
        oComm.CommandText = "listar_archivos"
        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.Parameters.Add(New SqlParameter("@carpeta", Data.SqlDbType.Int, 2))
        oComm.Parameters("@carpeta").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@carpeta").Value = id_carpeta
        oCC.consultaWPar(oComm, "Carpetas")
        GridView1.DataSource = oCC.oDS
        GridView1.DataMember = "Carpetas"
        GridView1.DataBind()
        GridView1.Columns(0).Visible = False
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        buscar()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes("onmouseover") = "javascript:setMouseOverColor(this);"
            e.Row.Attributes("onmouseout") = "javascript:setMouseOutColor(this);"
            'e.Row.Attributes("onclick") = "javascript:location.href='ctt_detalle.aspx?psp=" & Trim(e.Row.Cells(7).Text) & "';"
            'e.Row.Attributes("onclick") = "javascript:window.open('ctt_detalle.aspx?psp=" & Trim(e.Row.Cells(7).Text) & "');"
            'e.Row.Attributes("onclick") = "javascript:window.open('doc_archivos.aspx?id_archivo=" & Trim(e.Row.Cells(0).Text) & "','Detalle Operación','scrollbars=1,menubar=0,resizable=1,width=650,height=500,toolbars=0');"
            e.Row.Attributes("onclick") = "javascript:var w = window.showModalDialog('" & Trim(e.Row.Cells(0).Text) & "','Download','dialogHeight: 500px; dialogWidth: 650px; edge: sunken; center: Yes; help: No; resizable: No; status: No;');"
        End If

        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
    End Sub
End Class
