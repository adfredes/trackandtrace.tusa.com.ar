Imports System.Data.SqlClient
Partial Class ea_detalle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim interno As String = ""
            Try
                interno = Request.QueryString("pcp")
                interno = interno.Replace("/", "")
                interno = interno.Replace("-", "")
            Catch ex As Exception

            End Try
            If Trim(interno) <> "" Then
                Dim oCC As New clsConex
                Dim oComm As New SqlCommand
                oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
                oComm.Parameters.Add(New SqlParameter("@usuario", Data.SqlDbType.VarChar, 255))
                oComm.Parameters.Add(New SqlParameter("@operacion", Data.SqlDbType.VarChar, 255))
                oComm.Parameters("@usuario").Value = User.Identity.Name
                oComm.Parameters("@operacion").Value = interno
                oComm.Parameters("@usuario").Direction = Data.ParameterDirection.Input
                oComm.Parameters("@operacion").Direction = Data.ParameterDirection.Input
                oComm.CommandText = "af_detalleehb"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Listado") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                Try
                    lblOP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_numeroint").ToString
                Catch ex As Exception

                End Try
                Try
                    lblHWB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_hawb").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCO.Text = oCC.oDS.Tables("Listado").Rows(0).Item("clx_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFS.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mae_fecha").ToString
                Catch ex As Exception

                End Try
                Try
                    lblKB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_kgbrutos").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_tipotarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_tarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCPP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_cargospp").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGAPP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_agentepp").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGCPP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_carrierpp").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGVPP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_valuepp").ToString
                Catch ex As Exception

                End Try
                Try
                    lblM.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_mercaderia").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFV.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mae_fechavuelo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblMWB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_mawb").ToString
                Catch ex As Exception

                End Try
                Try
                    lblA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("age_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("cia_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblAD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("aer_destino").ToString
                Catch ex As Exception

                End Try
                Try
                    lblKA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_kgaforados").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("div_codigo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblF.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_flete").ToString
                Catch ex As Exception

                End Try
                Try
                    lblC.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_cargoscc").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_agentecc").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGC.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_carriercc").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGV.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hae_valuecc").ToString
                Catch ex As Exception

                End Try

                Try
                    lblV.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mae_vuelo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mae_fecllega").ToString
                Catch ex As Exception

                End Try
                
                oComm.CommandText = "af_detalleehbc"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Contenedores") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                If oCC.oDS.Tables("Contenedores").Rows.Count > 0 Then
                    gvListado.DataSource = oCC.oDS
                    gvListado.DataMember = "Contenedores"
                    gvListado.DataBind()
                Else
                    lblNO.Visible = True
                End If
            End If
        End If
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Try
            lblCli.Text = CType(Master.FindControl("lblUser"), Label).Text
        Catch ex As Exception

        End Try
    End Sub

End Class
