Imports System.Data.SqlClient
Partial Class im_detalle
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
                oComm.CommandText = "af_detalleim"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Listado") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                Try
                    lblOP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_numeroint").ToString
                Catch ex As Exception

                End Try
                Try
                    lblHBL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_hbl").ToString
                Catch ex As Exception

                End Try
                Try
                    lblO.Text = oCC.oDS.Tables("Listado").Rows(0).Item("pue_origen").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mmi_fecllega").ToString
                Catch ex As Exception

                End Try
                Try
                    lblA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("age_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_bultos").ToString
                Catch ex As Exception

                End Try
                Try
                    lblPB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_kgbruto").ToString
                Catch ex As Exception

                End Try
                Try
                    lblD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("div_codigo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_tarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblF.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_flete").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGC.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_gtoscarrier").ToString
                Catch ex As Exception

                End Try
                Try
                    lblGA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_gtosagente").ToString
                Catch ex As Exception

                End Try
                Try
                    lblDM.Text = oCC.oDS.Tables("Listado").Rows(0).Item("div_manejo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblM.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_mercaderia").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFC.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_fecretiro").ToString
                Catch ex As Exception

                End Try
                Try
                    lblBL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mmi_bl").ToString
                Catch ex As Exception

                End Try
                Try
                    lblD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("pue_destino").ToString
                Catch ex As Exception

                End Try
                Try
                    lblP.Text = oCC.oDS.Tables("Listado").Rows(0).Item("prx_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblR.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_referencia").ToString
                Catch ex As Exception

                End Try
                Try
                    lblV.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_volumen").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTN.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_tonelada").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_tipotarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblMA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_manejo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblRT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hmi_retiro").ToString
                Catch ex As Exception

                End Try
                Try
                    lblE.Text = oCC.oDS.Tables("Listado").Rows(0).Item("emb_descripcion").ToString
                Catch ex As Exception

                End Try
                oComm.CommandText = "af_detalleimc"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Contenedores") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                If oCC.oDS.Tables("Contenedores").Rows.Count > 0 Then
                    gvListado.DataSource = oCC.oDS
                    gvListado.DataMember = "Contenedores"
                    gvListado.DataBind()
                Else
                    Label30.Visible = True
                End If
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
