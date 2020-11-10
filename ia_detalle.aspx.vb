Imports System.Data.SqlClient
Partial Class ia_detalle
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
                oComm.CommandText = "af_detalleihb"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Listado") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                Try
                    lblMa.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mai_mawb").ToString
                Catch ex As Exception

                End Try
                Try
                    lblOP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_numeroint").ToString
                Catch ex As Exception

                End Try
                Try
                    lblO.Text = oCC.oDS.Tables("Listado").Rows(0).Item("aer_origen").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFS.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mai_fecsalida").ToString
                Catch ex As Exception

                End Try
                Try
                    lblA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("age_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblKB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_kgbruto").ToString
                Catch ex As Exception

                End Try
                Try
                    lblB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_bultos").ToString
                Catch ex As Exception

                End Try
                Try
                    lblDF.Text = oCC.oDS.Tables("Listado").Rows(0).Item("div_codigo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_tarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblF.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_flete").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGC.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_gtoscarrier").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_gtosagente").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCC.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_ccfee").ToString
                Catch ex As Exception

                End Try
                Try
                    lblDM.Text = oCC.oDS.Tables("Listado").Rows(0).Item("div_manejo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblM.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_mercaderia").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFR.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_fecretiro").ToString
                Catch ex As Exception

                End Try
                Try
                    lblHW.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_hawb").ToString
                Catch ex As Exception

                End Try
                Try
                    lblD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("aer_destino").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mai_fecllega").ToString
                Catch ex As Exception

                End Try
                Try
                    lblP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("prx_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblR.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_referencia").ToString
                Catch ex As Exception

                End Try
                Try
                    lblV.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mai_vuelo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblVL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_volumen").ToString
                Catch ex As Exception

                End Try
                Try
                    lblKA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_kgaforado").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_tipotarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblMJ.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hai_manejo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("cia_descripcion").ToString
                Catch ex As Exception

                End Try
            End If
        End If
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Try
            lblC.Text = CType(Master.FindControl("lblUser"), Label).Text
        Catch ex As Exception

        End Try
    End Sub
End Class
