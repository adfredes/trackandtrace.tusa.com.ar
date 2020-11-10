Imports System.Data.SqlClient
Partial Class factura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim factura As String = ""
            Try
                factura = Request.QueryString("psp")
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
                        lblCta.Text = oCC.oDS.Tables("factura").Rows(0).Item("cli_codigo")
                    Catch ex As Exception

                    End Try
                    Try
                        lblDomi.Text = oCC.oDS.Tables("factura").Rows(0).Item("cli_domicilio1")
                    Catch ex As Exception

                    End Try

                    Try
                        lblDomi2.Text = oCC.oDS.Tables("factura").Rows(0).Item("cli_domicilio2")
                    Catch ex As Exception

                    End Try

                    Try
                        lblCuit.Text = oCC.oDS.Tables("factura").Rows(0).Item("cli_cuit")
                    Catch ex As Exception

                    End Try

                    Try
                        lblTF.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_tipo")
                    Catch ex As Exception

                    End Try
                    Try
                        lblF.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_fecha")
                    Catch ex As Exception
                    End Try
                    Try
                        lblFacVto.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_fecvto")
                    Catch ex As Exception
                    End Try


                    Try
                        lblCli.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_cliente")
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
                        lblRA.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_anticipo")
                    Catch ex As Exception

                    End Try
                    Try
                        lblAFavor.Text = String.Format("{0}", oCC.oDS.Tables("factura").Rows(0).Item("fac_total") - oCC.oDS.Tables("factura").Rows(0).Item("fac_anticipo"))
                        '//.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_total")
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
                        lblLiquidacion.Text = oCC.oDS.Tables("factura").Rows(0).Item("fac_total")
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


                    If oCC.consultaSP("af_listadoieFacturaLiq", lParam.ToArray, "liquidacion") = False Then
                        Response.Redirect("error-page.aspx")
                    End If
                    Repeater1.DataSource = oCC.oDS
                    Repeater1.DataMember = "liquidacion"
                    Repeater1.DataBind()

                End If
            End If
        End If
    End Sub




    Function get_cliente() As String
        Dim oCC As New clsConex
        Dim cliente As String
        Dim oComm As New SqlCommand
        Dim parUser As New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 20)
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.CommandText = "af_cliente"
        parUser.Value = User.Identity.Name.ToString
        oComm.Parameters.Add(parUser)
        cliente = oCC.exSqlEscWPar(oComm)
        oComm.Parameters.Clear()
        Return cliente
    End Function

    'Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
    '    'af_txtbayer_Det

    '    Dim band As Boolean = False
    '    Dim cli As String = Trim(LCase(get_cliente))
    '    If cli = LCase("UNILEVER DE ARGENTINA S.A.") Then
    '        band = True
    '    End If
    '    Dim factura As String
    '    Try
    '        factura = Request.QueryString("pcp")
    '    Catch ex As Exception

    '    End Try
    '    If factura <> "" Then
    '        Dim oCC As New clsConex
    '        Dim oComm As New SqlCommand
    '        Dim parUser As New SqlParameter("@factura", Data.SqlDbType.NVarChar, 255)
    '        parUser.Value = Trim(factura)
    '        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
    '        oComm.CommandType = Data.CommandType.StoredProcedure
    '        oComm.Parameters.Add(parUser)
    '        If band = False Then
    '            oComm.CommandText = "af_txtbayer_Enc"
    '        Else
    '            oComm.CommandText = "af_txtUni_Enc"
    '        End If
    '        If oCC.consultaWPar(oComm, "Facturas") = False Then
    '            Response.Redirect("error-page.aspx")
    '        End If
    '        If oCC.oDS.Tables.Count > 0 Then
    '            Dim x As Integer = 0
    '            For x = 0 To oCC.oDS.Tables("Facturas").Rows.Count - 1
    '                oComm.CommandText = "af_txtbayer_Det"
    '                If oCC.consultaWPar(oComm, "detalle") = False Then
    '                    Response.Redirect("error-page.aspx")
    '                End If
    '                If oCC.oDS.Tables.Count > 1 Then
    '                    Dim STR As String
    '                    STR = Mid(Date.Now, 7, 4) & Mid(Date.Now, 4, 2) & Mid(Date.Now, 1, 2) & Mid(Now, 11, 100).Replace(":", "").Replace(" ", "")
    '                    Dim oAr As archivo_detalle
    '                    If oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_iva") > 0 Then
    '                        oAr = New archivo_detalle(oCC.oDS.Tables("detalle").Rows.Count + 1, STR, oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_numoper"))
    '                    Else
    '                        oAr = New archivo_detalle(oCC.oDS.Tables("detalle").Rows.Count, STR, oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_numoper"))
    '                    End If
    '                    If band = False Then
    '                        oAr.agregar_cabecera(oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(0), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(1), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(2), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(3), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(4), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(5), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(6), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(7), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(8), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(9), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(10), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(11), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(12), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(13), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15))
    '                    Else
    '                        Dim hpc As String = ""
    '                        Dim pais As String = ""
    '                        For xp As Integer = 0 To 4
    '                            Dim lect As String
    '                            Try
    '                                lect = oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(16 + xp)
    '                            Catch ex As Exception
    '                                lect = ""
    '                            End Try
    '                            If LCase(lect).ToString.Contains("hpc") = True Then
    '                                hpc = 3000
    '                                Try
    '                                    pais = Mid(lect, lect.IndexOf("-") + 1, Len(lect))
    '                                Catch ex As Exception

    '                                End Try
    '                                Exit For
    '                            ElseIf LCase(lect).ToString.Contains("food") = True Then
    '                                hpc = 5000
    '                                Try
    '                                    pais = Mid(lect, lect.IndexOf("-") + 1, Len(lect))
    '                                Catch ex As Exception

    '                                End Try
    '                                Exit For
    '                            End If
    '                        Next
    '                        oAr.agregar_cabecera(oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(0), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(1), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(2), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(3), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(4), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(5), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(6), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(7), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(8), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(9), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(10), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(11), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(12), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(13), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15), pais, hpc)
    '                    End If
    '                    Dim y As Integer
    '                    For y = 0 To oCC.oDS.Tables("detalle").Rows.Count - 1
    '                        oAr.agregar_detalle(oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(0), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(1), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(2), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(3), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(4), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(5), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(6), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(7), "", "", oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15))
    '                    Next
    '                    y = y - 1
    '                    If oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_iva") > 0 Then
    '                        oAr.agregar_detalle(oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(0), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(1), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(2), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(3), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(4), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(5), "1VA", oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_iva"), "", "", oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15))
    '                    End If
    '                    Dim oBJ() As Object
    '                    oBJ = oAr.guardar()
    '                    Dim targetEncoding As Encoding
    '                    Dim sbr As New StringBuilder
    '                    targetEncoding = Encoding.GetEncoding(0)
    '                    CType(oBJ(1), StringBuilder).AppendLine("")
    '                    CType(oBJ(1), StringBuilder).Append(CType(oBJ(3), StringBuilder).ToString)
    '                    Dim algo As Byte() = targetEncoding.GetBytes(CType(oBJ(1), StringBuilder).ToString)
    '                    Response.ContentType = "application/octet-stream"
    '                    Response.AddHeader("Content-Disposition", "attachment;filename=" & CType(oBJ(0), String).ToString)
    '                    Response.OutputStream.Write(algo, 0, algo.Length)
    '                    Response.End()
    '                    Response.Flush()
    '                End If
    '            Next
    '        End If
    '    End If
    'End Sub
End Class
