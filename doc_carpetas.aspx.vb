Imports System.Data.SqlClient
Partial Class doc_carpetas
    Inherits System.Web.UI.Page

    Private Function validarfechas() As Boolean
        Dim band As Boolean
        Try
            If txtDesde.Text <> "" And txtHasta.Text <> "" AndAlso DateDiff(DateInterval.Day, CDate(txtDesde.Text), CDate(txtHasta.Text)) >= 0 Then
                band = True
            Else
                band = False
            End If
        Catch ex As Exception
            band = False
        End Try
        Return band
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        If Not Page.IsPostBack Then
            Panel1.Visible = False
            'Dim oCC As New clsConex
            'If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
            '    Response.Redirect("denegado.aspx")
            'End If
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Panel1.Visible = True
        If rbtFecha.Checked = True And validarfechas() = False Then
            GridView1.DataSource = Nothing
            GridView1.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        Else
            Label1.Text = ""
            Me.GridView1.PageIndex = 0
            buscar()
        End If
    End Sub

    Protected Sub buscar()
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("edoc").ConnectionString)
        Dim oCP As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ConnectionString)
        Dim cliente As String
        GridView1.Columns(0).Visible = True
        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.Parameters.Add(New SqlParameter("@cliente", Data.SqlDbType.Char, 255))
        oComm.Parameters("@cliente").Value = User.Identity.Name
        oComm.CommandText = "getUserEdoc"
        cliente = oCP.exSqlEscWPar(oComm)
        If cliente <> "" Then
            oComm = New SqlCommand
            oComm.CommandType = Data.CommandType.StoredProcedure
            oComm.Parameters.Add(New SqlParameter("@cliente", Data.SqlDbType.Char, 255))
            oComm.Parameters("@cliente").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@cliente").Value = cliente
            If rbtFecha.Checked Then
                oComm.CommandText = "carpetasBYFecha"
                oComm.Parameters.Add(New SqlParameter("@desde", Data.SqlDbType.SmallDateTime))
                oComm.Parameters("@desde").Direction = Data.ParameterDirection.Input
                oComm.Parameters("@desde").Value = txtDesde.Text
                oComm.Parameters.Add(New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime))
                oComm.Parameters("@hasta").Direction = Data.ParameterDirection.Input
                oComm.Parameters("@hasta").Value = txtHasta.Text
            Else
                oComm.CommandText = "carpetasBYNumero"
                oComm.Parameters.Add(New SqlParameter("@referencia", Data.SqlDbType.VarChar, 50))
                oComm.Parameters("@referencia").Direction = Data.ParameterDirection.Input
                oComm.Parameters.Add(New SqlParameter("@operacion", Data.SqlDbType.VarChar, 50))
                oComm.Parameters("@operacion").Direction = Data.ParameterDirection.Input
                Select Case ddlNro.SelectedValue
                    Case 1
                        oComm.Parameters("@referencia").Value = "%" & txtnro.Text
                        oComm.Parameters("@operacion").Value = "%%"
                    Case 2
                        oComm.Parameters("@referencia").Value = "%%"
                        oComm.Parameters("@operacion").Value = txtnro.Text & "%"
                End Select
            End If


            If oCC.consultaWPar(oComm, "Listado") = False Then
                Response.Redirect("error-page.aspx")
            End If
            GridView1.DataSource = oCC.oDS
            GridView1.DataMember = "Listado"
            GridView1.DataBind()
            GridView1.Columns(0).Visible = False
            Try
                Label1.Text = GridView1.PageSize * GridView1.PageIndex + GridView1.Rows.Count & " de " & oCC.oDS.Tables("Listado").Rows.Count & " operaciones"
            Catch ex As Exception
                Label1.Text = "No se encontraron operaciones."
            End Try
        Else
            Label1.Text = "No se encontraron operaciones."
        End If
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
            e.Row.Attributes("onclick") = "javascript:window.open('doc_archivos.aspx?id_archivo=" & Trim(e.Row.Cells(0).Text) & "','','scrollbars=1,menubar=0,resizable=1,width=650,height=250,toolbars=0');"
        End If

        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
    End Sub
End Class
