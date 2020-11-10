Imports System.Data
Imports System.Data.SqlClient
Partial Class fc_listado
    Inherits System.Web.UI.Page

    Private Function validarfechas() As Boolean
        Dim band As Boolean
        Try
            If (txtDesde.Text <> "" And txtHasta.Text <> "" AndAlso DateDiff(DateInterval.Day, CDate(txtDesde.Text), CDate(txtHasta.Text)) >= 0) Or IsNumeric(Trim(txtNumero.Text)) Or txtNumOper.Text <> "" Then
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
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 3) = False Then
                Response.Redirect("denegado.aspx")
            End If
            txtDesde.Text = DateTime.Now.AddDays(-7).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString
        End If
    End Sub

 

    Sub reflush()
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        'oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.Parameters.Add(New SqlParameter("@user", Data.SqlDbType.NVarChar, 255))
        oComm.Parameters.Add(New SqlParameter("@desde", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@fac_numero", Data.SqlDbType.Float))

        oComm.Parameters("@desde").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@hasta").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@fac_numero").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@user").Direction = Data.ParameterDirection.Input        
        oComm.Parameters("@user").Value = User.Identity.Name


        oComm.Parameters.Add(New SqlParameter("@fac_tipo", SqlDbType.Char, 1))
        If ddlTipo.SelectedValue <> "0" Then
            oComm.Parameters("@fac_tipo").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_tipo").Value = ddlTipo.SelectedValue
        Else
            oComm.Parameters("@fac_tipo").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_tipo").Value = DBNull.Value
        End If

        oComm.Parameters.Add(New SqlParameter("@fac_sucursal", SqlDbType.Int))
        If ddlSucursal.SelectedValue <> "0" Then
            oComm.Parameters("@fac_sucursal").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_sucursal").Value = ddlSucursal.SelectedValue
        Else
            oComm.Parameters("@fac_sucursal").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_sucursal").Value = DBNull.Value
        End If

        oComm.Parameters.Add(New SqlParameter("@fac_comprobante", SqlDbType.Char, 2))
        If ddlComprobante.SelectedValue <> "0" Then
            oComm.Parameters("@fac_comprobante").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_comprobante").Value = ddlComprobante.SelectedValue
        Else
            oComm.Parameters("@fac_comprobante").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_comprobante").Value = DBNull.Value
        End If

        oComm.Parameters.Add(New SqlParameter("@fac_numoper", SqlDbType.Int))
        If txtNumOper.Text <> "" Then
            oComm.Parameters("@fac_numoper").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_numoper").Value = txtNumOper.Text
            oComm.Parameters("@fac_numero").Value = DBNull.Value
            oComm.Parameters("@desde").Value = DBNull.Value
            oComm.Parameters("@hasta").Value = DBNull.Value
        Else
            oComm.Parameters("@fac_numoper").Direction = Data.ParameterDirection.Input
            oComm.Parameters("@fac_numoper").Value = DBNull.Value
        End If

        oComm.CommandText = "af_listadoFDigital"
        

        If IsNumeric(Trim(txtNumero.Text)) Then
            oComm.Parameters("@fac_numero").Value = Trim(txtNumero.Text)
        Else
            oComm.Parameters("@fac_numero").Value = DBNull.Value
        End If

        If txtDesde.Text = "" Then
            oComm.Parameters("@desde").Value = Date.Now.AddDays(-15)
        Else
            oComm.Parameters("@desde").Value = txtDesde.Text
        End If

        If txtHasta.Text = "" Then
            oComm.Parameters("@hasta").Value = Date.Now
        Else
            oComm.Parameters("@hasta").Value = txtHasta.Text
        End If

        If oCC.consultaWPar(oComm, "Listado") = False Then
            Response.Redirect("error-page.aspx")
        End If
        Try
            gvliquidacion.Columns(0).Visible = True
        Catch ex As Exception

        End Try        
        gvliquidacion.DataSource = oCC.oDS
        gvliquidacion.DataMember = "Listado"
        gvliquidacion.DataBind()
        gvliquidacion.Columns(0).Visible = False
    End Sub

    Protected Sub gvliquidacion_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvliquidacion.PageIndexChanging
        gvliquidacion.PageIndex = e.NewPageIndex
        reflush()
    End Sub

    Protected Sub gvliquidacion_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvliquidacion.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then            
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('VisorArchivosModal','" & Trim(e.Row.Cells(0).Text) & "');"            
        End If
    End Sub

    Protected Sub ibBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click
        If validarfechas() Then
            gvliquidacion.PageIndex = 0
            reflush()
        Else
            gvliquidacion.DataSource = Nothing
            gvliquidacion.DataBind()
        End If
    End Sub

    Protected Sub ddlSizeGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSizeGrid.SelectedIndexChanged
        gvliquidacion.PageSize = ddlSizeGrid.SelectedValue
        If validarfechas() Then
            gvliquidacion.PageIndex = 0
            reflush()
        Else
            gvliquidacion.DataSource = Nothing
            gvliquidacion.DataBind()
        End If
    End Sub
End Class
