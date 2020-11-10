Imports System.Data.SqlClient
Partial Class cc_factura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then            
            Dim factura As String = ""
            Try
                factura = Request.QueryString("pcp")
            Catch ex As Exception

            End Try
            If Trim(factura) <> "" Then
                Dim fac() As String = factura.Split("-")
                Dim oCC As New clsConex
                Dim lParam As New List(Of SqlParameter)
                Dim param As SqlParameter
                param = New SqlParameter("@fac_tipo", Data.SqlDbType.Char, 2)
                param.Value = fac(0)
                lParam.Add(param)

                param = New SqlParameter("@fac_sucursal", Data.SqlDbType.Int)
                param.Value = fac(1)
                lParam.Add(param)

                param = New SqlParameter("@fac_numero", Data.SqlDbType.Int)
                param.Value = fac(2)
                lParam.Add(param)

                param = New SqlParameter("@fac_comprobante", Data.SqlDbType.Char, 2)
                param.Value = fac(3)
                lParam.Add(param)

                oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString

                If oCC.consultaSP("af_listadoieFactura", lParam.ToArray, "factura") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                If oCC.oDS.Tables("factura").Rows.Count > 0 Then
                    lblFA.Text = factura
                    Try
                        lblTF.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_tipo")
                    Catch ex As Exception

                    End Try
                    Try
                        lblF.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_fecha")
                    Catch ex As Exception
                    End Try
                    Try
                        lblCli.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_cliente")
                    Catch ex As Exception

                    End Try
                    Try
                        lblC.Text = oCC.oDS.Tables("factura").Rows(0).Item("cot_divlocal")
                    Catch ex As Exception

                    End Try
                    Try
                        lblFA.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_numero")
                    Catch ex As Exception

                    End Try
                    Try
                        lblS.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_sucursal")
                    Catch ex As Exception

                    End Try
                    Try
                        lblD.Text = oCC.oDS.Tables("factura").Rows(0).Item("div_codigo")
                    Catch ex As Exception

                    End Try
                    Try
                        lblCV.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_condvta")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRA.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_anticipo")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRD.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_derecho")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRE.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_exento")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRG.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_gravado")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRI.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_iva")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRS.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_subtotal")
                    Catch ex As Exception

                    End Try
                    Try
                        lblRT.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_total")
                    Catch ex As Exception

                    End Try
                    Try
                        lblr1.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_detalle1")
                    Catch ex As Exception

                    End Try
                    Try
                        lblr2.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_detalle2")
                    Catch ex As Exception

                    End Try
                    Try
                        lblr3.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_detalle3")
                    Catch ex As Exception

                    End Try
                    Try
                        lblr4.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_detalle4")
                    Catch ex As Exception

                    End Try
                    Try
                        lblr5.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_detalle5")
                    Catch ex As Exception

                    End Try
                    '                    
                    If oCC.consultaSP("af_listadoieFacturaLiq", lParam.ToArray, "liquidacion") = False Then
                        Response.Redirect("error-page.aspx")
                    End If
                    gvliquidacion.DataSource = oCC.oDS
                    gvliquidacion.DataMember = "liquidacion"
                    gvliquidacion.DataBind()
                End If
            End If
        End If
    End Sub
End Class
