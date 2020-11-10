Imports System.Data.SqlClient
Imports System.IO
Partial Class ctt_descargar_archivo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        generarArchivo(Request.QueryString("psp"))
        Dim scriptString As String = "<script language='JavaScript'> " & _
                           "window.close(); </script>"
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", scriptString)
    End Sub

    Protected Sub generarArchivo(ByVal despacho As String)
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding

        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(1)
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16, Data.ParameterDirection.Input)
        prm(0).Value = Request.QueryString("psp")
        prm(1) = New SqlParameter("@usuario", Data.SqlDbType.NVarChar, 50, Data.ParameterDirection.Input)
        prm(1).Value = User.Identity.Name
        occ.consultaSP("valida_despacho_usuario", prm)
        If occ.oDS.Tables.Count > 0 AndAlso occ.oDS.Tables(0).Rows.Count > 0 Then

            ReDim prm(0)
            prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16, Data.ParameterDirection.Input)
            prm(0).Value = Request.QueryString("psp")

            occ.oDS.Tables.Clear()
            sbr.AppendLine("<?xml version=""1.0"" encoding=""iso-8859-1"" ?>")
            sbr.Append("<DESPACHO ")
            occ.consultaSP("d_getDetalleOperacion", prm, "detalle")
            With occ.oDS.Tables("detalle")
                For Each dr As Data.DataRow In .Rows
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine(">")
                Next
            End With

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getDocumentos", prm, "documentos")

            sbr.AppendLine("<DOCUMENTOS>")
            With occ.oDS.Tables("documentos")

                For Each dr As Data.DataRow In .Rows
                    sbr.Append("<DOCUMENTO ")
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine("/>")
                Next
            End With

            sbr.AppendLine("</DOCUMENTOS>")

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getLiquidaciones", prm, "liquidaciones")
            sbr.AppendLine("<LIQUIDACIONES>")
            With occ.oDS.Tables("liquidaciones")
                For Each dr As Data.DataRow In .Rows
                    sbr.Append("<LINEAS_LIQUIDACION ")
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine("/>")
                Next
                sbr.AppendLine("</LIQUIDACIONES>")
            End With

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getInformacion_Complementarias", prm, "informacion_complementarias")
            sbr.AppendLine("<INFORMACION_COMPLEMENTARIAS>")
            With occ.oDS.Tables("informacion_complementarias")
                For Each dr As Data.DataRow In .Rows
                    sbr.Append("<INFORMACION_COMPLEMENTARIA ")
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine("/>")
                Next
                sbr.AppendLine("</INFORMACION_COMPLEMENTARIAS>")
            End With

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getPagos", prm, "pagos")
            sbr.AppendLine("<PAGOS>")
            With occ.oDS.Tables("pagos")
                For Each dr As Data.DataRow In .Rows
                    sbr.Append("<LINEAS_PAGO ")
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine("/>")
                Next
                sbr.AppendLine("</PAGOS>")
            End With

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getBultos", prm, "bultos")
            sbr.AppendLine("<BULTOS>")
            With occ.oDS.Tables("bultos")
                For Each dr As Data.DataRow In .Rows
                    sbr.Append("<BULTO ")
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine("/>")
                Next
                sbr.AppendLine("</BULTOS>")
            End With

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getLiquidacion_Item", prm, "liquidacion_item")
            sbr.AppendLine("<LIQUIDACIONES_ITEMS>")
            With occ.oDS.Tables("liquidacion_item")
                For Each dr As Data.DataRow In .Rows
                    sbr.Append("<LIQUIDACION_ITEM ")
                    For Each dc As Data.DataColumn In .Columns
                        sbr.Append(dc.ColumnName & "=""" & dr.Item(dc.ColumnName) & """ ")
                    Next
                    sbr.AppendLine("/>")
                Next
                sbr.AppendLine("</LIQUIDACIONES_ITEMS>")
            End With

            occ.oDS.Tables.Clear()
            occ.consultaSP("d_getDespacho_Articulos", prm, "litems")
            Dim oDTABLE As Data.DataTable = occ.oDS.Tables("litems")
            sbr.AppendLine("<DESPACHO_ITEMS>")
            For Each dr As Data.DataRow In oDTABLE.Rows
                Dim idda As String = dr.Item("idda").ToString()
                occ.oDS.Tables.Clear()
                prm(0) = New SqlParameter("@idda", Data.SqlDbType.Int, 8, Data.ParameterDirection.Input)
                prm(0).Value = idda


                occ.consultaSP("a_getDespacho_Articulos", prm, "detalle")
                sbr.Append("<DESPACHO_ITEM ")
                With occ.oDS.Tables("detalle")
                    For Each dr1 As Data.DataRow In .Rows
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        Exit For
                    Next
                End With
                sbr.AppendLine(">")

                occ.consultaSP("a_getDocumentos", prm, "documentos")
                sbr.AppendLine("<DOCUMENTOS>")
                With occ.oDS.Tables("documentos")
                    For Each dr1 As Data.DataRow In .Rows
                        sbr.Append("<DOCUMENTO ")
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        sbr.AppendLine("/>")
                    Next
                    sbr.AppendLine("</DOCUMENTOS>")
                End With

                occ.consultaSP("a_getInformacion_Complementarias", prm, "informacion_complementarias")
                sbr.AppendLine("<INFORMACION_COMPLEMENTARIAS>")
                With occ.oDS.Tables("informacion_complementarias")
                    For Each dr1 As Data.DataRow In .Rows
                        sbr.Append("<INFORMACION_COMPLEMENTARIA ")
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        sbr.AppendLine("/>")
                    Next
                    sbr.AppendLine("</INFORMACION_COMPLEMENTARIAS>")
                End With

                occ.consultaSP("a_getSubitems", prm, "subitems")
                sbr.AppendLine("<SUBITEMS>")
                With occ.oDS.Tables("subitems")
                    For Each dr1 As Data.DataRow In .Rows
                        sbr.Append("<SUBITEM ")
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        sbr.AppendLine("/>")
                    Next
                    sbr.AppendLine("</SUBITEMS>")
                End With

                occ.consultaSP("a_getVentajas", prm, "ventajas")
                sbr.AppendLine("<VENTAJAS>")
                With occ.oDS.Tables("ventajas")
                    For Each dr1 As Data.DataRow In .Rows
                        sbr.Append("<VENTAJA ")
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        sbr.AppendLine("/>")
                    Next
                    sbr.AppendLine("</VENTAJAS>")
                End With

                occ.consultaSP("a_getLiquidacion_Item", prm, "liquidacion_item")
                sbr.AppendLine("<LIQUIDACIONES_ITEMS>")
                With occ.oDS.Tables("liquidacion_item")
                    For Each dr1 As Data.DataRow In .Rows
                        sbr.Append("<LIQUIDACIONES_ITEM ")
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        sbr.AppendLine("/>")
                    Next
                    sbr.AppendLine("</LIQUIDACIONES_ITEMS>")
                End With


                occ.consultaSP("a_getBeneficios", prm, "beneficios")
                sbr.AppendLine("<BENEFICIOS>")
                With occ.oDS.Tables("beneficios")
                    For Each dr1 As Data.DataRow In .Rows
                        sbr.Append("<BENEFICIO ")
                        For Each dc1 As Data.DataColumn In .Columns
                            sbr.Append(dc1.ColumnName & "=""" & dr1.Item(dc1.ColumnName) & """ ")
                        Next
                        sbr.AppendLine("/>")
                    Next
                    sbr.AppendLine("</BENEFICIOS>")
                End With

                sbr.AppendLine("</DESPACHO_ITEM>")
            Next


            sbr.AppendLine("</DESPACHO_ITEMS>")
            sbr.AppendLine("</DESPACHO>")

            targetEncoding = Encoding.GetEncoding(0)
            Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
            Response.ContentType = "application/octet-stream"
            Response.AddHeader("Content-Disposition", "attachment;filename=" & despacho & ".xml")
            Response.OutputStream.Write(algo, 0, algo.Length)
            Response.End()
            Response.Flush()
        End If
    End Sub
End Class
