Imports System.Data.SqlClient
Partial Class ctt_items_operacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            binddata()
        End If
    End Sub

    Sub binddata()
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(0)
        prm(0) = New SqlParameter("@idda", Data.SqlDbType.Int, 8, Data.ParameterDirection.Input)
        prm(0).Value = Request.QueryString("psp")
        occ.consultaSP("a_getDocumentos", prm, "documentos")
        gvDocumentos.DataSource = occ.oDS.Tables("documentos")
        occ.consultaSP("a_getInformacion_Complementarias", prm, "informacion_complementarias")
        gv_Informacion_Complementarias.DataSource = occ.oDS.Tables("informacion_complementarias")
        occ.consultaSP("a_getSubitems", prm, "subitems")
        gvSubItems.DataSource = occ.oDS.Tables("subitems")
        occ.consultaSP("a_getVentajas", prm, "ventajas")
        gvVentajas.DataSource = occ.oDS.Tables("ventajas")
        occ.consultaSP("a_getLiquidacion_Item", prm, "liquidacion_item")
        gvLiquidacion_Item.DataSource = occ.oDS.Tables("liquidacion_item")
        gv_Informacion_Complementarias.DataBind()
        occ.consultaSP("a_getBeneficios", prm, "beneficios")
        gvBeneficios.DataSource = occ.oDS.Tables("beneficios")
        occ.consultaSP("a_getDespacho_Articulos", prm, "detalle")
        bindcontrol(occ.oDS.Tables("detalle"))
        gvBeneficios.DataBind()
        gvDocumentos.DataBind()
        gvLiquidacion_Item.DataBind()
        gvVentajas.DataBind()
        gvSubItems.DataBind()
    End Sub

    Sub bindcontrol(ByVal dt As Data.DataTable)
        If Not dt Is Nothing Then
            If dt.Rows.Count > 0 Then

                Try
                    lblNItem.Text = dt.Rows(0).Item("nro_item")
                Catch ex As Exception

                End Try
                Try
                    lblTItem.Text = dt.Rows(0).Item("tipo_item")
                Catch ex As Exception

                End Try
                Try
                    lblPA.Text = dt.Rows(0).Item("posicion_arancelaria")
                Catch ex As Exception

                End Try
                Try
                    lblFI.Text = dt.Rows(0).Item("fecha_imponible")
                Catch ex As Exception

                End Try
                Try
                    lblES.Text = dt.Rows(0).Item("existencia_subitem")
                Catch ex As Exception

                End Try
                Try
                    lblEM.Text = dt.Rows(0).Item("estado_mercaderia")
                Catch ex As Exception

                End Try
                Try
                    lblPN.Text = dt.Rows(0).Item("peso_neto_kgr")
                Catch ex As Exception

                End Try
                Try
                    lblDespacho.Text = dt.Rows(0).Item("despacho")
                Catch ex As Exception

                End Try
                Try
                    lblPO.Text = dt.Rows(0).Item("origen")
                Catch ex As Exception

                End Try
                Try
                    lblPP.Text = dt.Rows(0).Item("procedencia")
                Catch ex As Exception

                End Try
                Try
                    lblUD.Text = dt.Rows(0).Item("udeclarada")
                Catch ex As Exception

                End Try
                Try
                    lblCnD.Text = dt.Rows(0).Item("cantidad_declarada")
                Catch ex As Exception

                End Try
                Try
                    lblUE.Text = dt.Rows(0).Item("uestadistica")
                Catch ex As Exception

                End Try
                Try
                    lblCE.Text = dt.Rows(0).Item("cantidad_estadistica")
                Catch ex As Exception

                End Try
                Try
                    lblCEsp.Text = dt.Rows(0).Item("cantidad_especifica")
                Catch ex As Exception

                End Try
                Try
                    lblVE.Text = dt.Rows(0).Item("valor_derecho_especifico")
                Catch ex As Exception

                End Try
                Try
                    lblMFD.Text = dt.Rows(0).Item("monto_fob_div")
                Catch ex As Exception

                End Try
                Try
                    lblMFDol.Text = dt.Rows(0).Item("monto_fob_dol")
                Catch ex As Exception

                End Try
                Try
                    lblMS.Text = dt.Rows(0).Item("monto_seguro")
                Catch ex As Exception

                End Try
                Try
                    lblMF.Text = dt.Rows(0).Item("monto_flete")
                Catch ex As Exception

                End Try
                Try
                    lblAD.Text = dt.Rows(0).Item("ajuste_a_deducir")
                Catch ex As Exception

                End Try
                Try
                    lblAI.Text = dt.Rows(0).Item("ajuste_a_incluir")
                Catch ex As Exception

                End Try
                Try
                    lblBI.Text = dt.Rows(0).Item("base_imponible_div")
                Catch ex As Exception

                End Try
                Try
                    lblBID.Text = dt.Rows(0).Item("base_imponible_dol")
                Catch ex As Exception

                End Try
                Try
                    lblPU.Text = dt.Rows(0).Item("precio_unitario")
                Catch ex As Exception

                End Try
                Try
                    lblCD.Text = dt.Rows(0).Item("coeficiente_derecho_inc")
                Catch ex As Exception

                End Try
                Try
                    lblIIT.Text = dt.Rows(0).Item("insumos_importados_temporarios")
                Catch ex As Exception

                End Try
                Try
                    lblIIC.Text = dt.Rows(0).Item("insumos_importados_a_consumo")
                Catch ex As Exception

                End Try
                Try
                    lblCDS.Text = dt.Rows(0).Item("calidad_distinta_standar")
                Catch ex As Exception

                End Try
                Try
                    lblPG.Text = dt.Rows(0).Item("pago_regalias")
                Catch ex As Exception

                End Try
                Try
                    lblPOD.Text = dt.Rows(0).Item("precio_oficial_dol")
                Catch ex As Exception

                End Try

            End If
        End If
    End Sub
End Class
