Imports System.Data.SqlClient
Partial Class em_detalle
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
                oComm.CommandText = "af_detalleem"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Listado") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                Try
                    lblO.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_numeroint").ToString
                Catch ex As Exception

                End Try
                Try
                    lblDB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("buq_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblA.Text = oCC.oDS.Tables("Listado").Rows(0).Item("age_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblHBL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_hbl").ToString
                Catch ex As Exception

                End Try
                Try
                    lblKB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_kgbrutos").ToString
                Catch ex As Exception

                End Try
                Try
                    lblB.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_bultos").ToString
                Catch ex As Exception

                End Try
                Try
                    lblETD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_etd").ToString
                Catch ex As Exception

                End Try
                Try
                    lblORG.Text = oCC.oDS.Tables("Listado").Rows(0).Item("pue_origen").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_tipotarifa").ToString
                Catch ex As Exception

                End Try
                Try
                    lblTHBL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_tarifahbl").ToString
                Catch ex As Exception

                End Try
                Try
                    lblD.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_description").ToString
                Catch ex As Exception

                End Try
                Try
                    lblV.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mme_viaje").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCO.Text = oCC.oDS.Tables("Listado").Rows(0).Item("cia_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCGT.Text = oCC.oDS.Tables("Listado").Rows(0).Item("clx_descripcion").ToString
                Catch ex As Exception

                End Try
                Try
                    lblBL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("mme_bl").ToString
                Catch ex As Exception

                End Try
                Try
                    lblCE.Text = oCC.oDS.Tables("Listado").Rows(0).Item("emb_codigo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblVO.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_volumen").ToString
                Catch ex As Exception

                End Try
                Try
                    lblDes.Text = oCC.oDS.Tables("Listado").Rows(0).Item("pue_destino").ToString
                Catch ex As Exception

                End Try
                Try
                    lblDiv.Text = oCC.oDS.Tables("Listado").Rows(0).Item("div_codigo").ToString
                Catch ex As Exception

                End Try
                Try
                    lblFHBL.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_fletehbl").ToString
                Catch ex As Exception

                End Try
                Try
                    lblR.Text = oCC.oDS.Tables("Listado").Rows(0).Item("hme_referencia").ToString
                Catch ex As Exception

                End Try

                oComm.CommandText = "af_detalleemc"
                oComm.CommandType = Data.CommandType.StoredProcedure
                If oCC.consultaWPar(oComm, "Contenedores") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                If oCC.oDS.Tables("Contenedores").Rows.Count > 0 Then
                    gvListado.DataSource = oCC.oDS
                    gvListado.DataMember = "Contenedores"
                    gvListado.DataBind()
                Else
                    lblno.Visible = True
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
