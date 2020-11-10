Imports System.Data.SqlClient
Partial Class im_listado
    Inherits System.Web.UI.Page

    Sub cargar()
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        oComm.Parameters.Add(New SqlParameter("@fdesde", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@fhasta", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@usuario", Data.SqlDbType.VarChar, 255))
        oComm.Parameters("@fdesde").Value = txtDesde.Text 'Mid(lblDFecha.Text, 4, 2) & "/" & Mid(lblDFecha.Text, 1, 2) & "/" & Mid(lblDFecha.Text, 7, 4)
        oComm.Parameters("@fhasta").Value = txtHasta.Text 'Mid(lblHFecha.Text, 4, 2) & "/" & Mid(lblHFecha.Text, 1, 2) & "/" & Mid(lblHFecha.Text, 7, 4)
        oComm.Parameters("@usuario").Value = User.Identity.Name
        oComm.Parameters("@fdesde").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@fhasta").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@usuario").Direction = Data.ParameterDirection.Input
        oComm.CommandText = "af_listadoiim"
        oComm.CommandType = Data.CommandType.StoredProcedure
        If oCC.consultaWPar(oComm, "Listado") = False Then
            Response.Redirect("error-page.aspx")
        End If
        gvListado.DataSource = oCC.oDS
        gvListado.DataMember = "Listado"
        gvListado.DataBind()
        Try
            Label1.Text = gvListado.PageSize * gvListado.PageIndex + gvListado.Rows.Count & " de " & oCC.oDS.Tables("Listado").Rows.Count & " operaciones"
        Catch ex As Exception
            Label1.Text = "0 de 0 operaciones"
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 2) = False Then
                Response.Redirect("denegado.aspx")
            End If
            txtDesde.Text = DateTime.Now.AddDays(-7).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString
        End If
    End Sub

    Protected Sub gvListado_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvListado.PageIndexChanging
        gvListado.PageIndex = e.NewPageIndex
        cargar()
    End Sub

    Protected Sub gvListado_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvListado.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then           
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('FFModal',{title:'Importación Marítima' , value:'im_detalle.aspx?pcp=" & Trim(e.Row.Cells(0).Text) & "'});"
        End If
    End Sub

    Protected Sub ibBuscar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click
        If validarfechas() = False Then
            gvListado.DataSource = Nothing
            gvListado.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        Else
            Label1.Text = ""
            gvListado.PageIndex = 0
            cargar()
        End If

    End Sub

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

    Protected Sub ddlSizeGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSizeGrid.SelectedIndexChanged
        gvListado.PageSize = ddlSizeGrid.SelectedValue
        If validarfechas() = False Then
            gvListado.DataSource = Nothing
            gvListado.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        Else
            Label1.Text = ""
            gvListado.PageIndex = 0
            cargar()
        End If
    End Sub

End Class
