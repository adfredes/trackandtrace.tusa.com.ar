Imports System.Data.SqlClient
Imports System.Globalization
Partial Class ctt_detalle2
    Inherits System.Web.UI.Page
#Region "Nueva Implementación"
    Sub binddata()
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(0)
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16, Data.ParameterDirection.Input)
        prm(0).Value = Request.QueryString("psp")

        occ.consultaSP("d_getDocumentos", prm, "documentos")
        gvDocumentos.DataSource = occ.oDS.Tables("documentos")
        gvDocumentos.DataBind()

        occ.consultaSP("d_getLiquidaciones", prm, "liquidaciones")
        gvLiquidaciones.DataSource = occ.oDS.Tables("liquidaciones")
        gvLiquidaciones.DataBind()

        occ.consultaSP("d_getInformacion_Complementarias", prm, "informacion_complementarias")
        gv_Informacion_Complementarias.DataSource = occ.oDS.Tables("informacion_complementarias")
        gv_Informacion_Complementarias.DataBind()

        occ.consultaSP("d_getPagos", prm, "pagos")
        gvPagos.DataSource = occ.oDS.Tables("pagos")
        gvPagos.DataBind()

        occ.consultaSP("d_getBultos", prm, "bultos")
        gvBultos.DataSource = occ.oDS.Tables("bultos")
        gvBultos.DataBind()

        occ.consultaSP("d_getLiquidacion_Item", prm, "liquidacion_item")
        gvLiquidacion_Item.DataSource = occ.oDS.Tables("liquidacion_item")
        gvLiquidacion_Item.DataBind()

        occ.consultaSP("d_getDespacho_Articulos", prm, "items")
        gvItems.DataSource = occ.oDS.Tables("items")
        gvItems.DataBind()

        occ.consultaSP("af_CostoEmbarque", prm, "CostoEmbarque")
        gvCostoEmbarque.DataSource = occ.oDS.Tables("CostoEmbarque")
        gvCostoEmbarque.DataBind()

        occ.consultaSP("d_getDetalleOperacion", prm, "detalle")
        bindcontrol(occ.oDS.Tables("detalle"))


        ReDim prm(1)
        prm(0) = New SqlParameter("@numero", Data.SqlDbType.NVarChar, 255)
        Dim interno As String = lblCod.Text
        'parUser.Value = "%/" & Mid(interno, 1, 2) & "/" & Mid(interno, 3, 2) & "-" & Mid(interno, 5, 2) & "/" & Mid(interno, 7, 4)
        prm(0).Value = Trim(interno)
        prm(1) = New SqlParameter("@cliente", Data.SqlDbType.NVarChar, 255)
        prm(1).Value = User.Identity.Name
        If occ.consultaSP("af_listadoieDetFac", prm, "facturas") = False Then
            'Response.Redirect("error-page.aspx")
        Else
            gvFacturas.DataSource = occ.oDS
            gvFacturas.DataMember = "facturas"
            gvFacturas.DataBind()
            gvFacturas.Columns(8).Visible = False
            gvFacturas.Columns(0).Visible = False
        End If

        ReDim prm(0)
        'af_GetArchivos
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16)
        prm(0).Value = lblNumDes.Text
        If occ.consultaSP("af_GetArchivos", prm, "despa_Archivos") Then
            Me.gvArchivos.DataSource = occ.oDS
            Me.gvArchivos.DataMember = "despa_Archivos"
            Me.gvArchivos.DataBind()
            If occ.oDS.Tables("despa_Archivos").Rows.Count > 0 Then
                gvArchivos.Columns(3).Visible = False
                gvArchivos.Columns(2).Visible = False
                Panel1.Visible = True
            Else
                Panel1.Visible = False
            End If
        Else
            Panel1.Visible = False
        End If


        ReDim prm(0)
        'af_GetArchivos
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16)
        prm(0).Value = lblNumDes.Text

        If UCase(lblNumDes.Text).Contains("DJAI") Or UCase(lblNumDes.Text).Contains("SIMI") Then
            Panel2.Visible = True
            prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 50)
            prm(0).Direction = Data.ParameterDirection.Input
            prm(0).Value = Request.QueryString("psp")
            occ.consultaSP("getDjai", prm, "listDjai")
            Me.GridView1.DataSource = occ.oDS
            Me.GridView1.DataMember = "listDjai"
            Me.GridView1.DataBind()
        Else
            Panel2.Visible = False
        End If

    End Sub

    Sub bindcontrol(ByVal dt As Data.DataTable)
        If Not dt Is Nothing Then
            If dt.Rows.Count > 0 Then

                Try
                    lblCod.Text = dt.Rows(0).Item("identificador_propio")
                Catch ex As Exception

                End Try
                Try
                    lblAd.Text = dt.Rows(0).Item("cod_aduana")
                Catch ex As Exception
                    lblAd.Text = ""
                End Try
                Try
                    lblCV.Text = dt.Rows(0).Item("condicion_venta")
                Catch ex As Exception
                    lblCV.Text = ""
                End Try
                Try
                    lblMT.Text = dt.Rows(0).Item("medio_transporte")
                Catch ex As Exception

                End Try
                Try
                    lblGM.Text = dt.Rows(0).Item("gm_nombre")
                Catch ex As Exception

                End Try
                'Try
                '    lblFEA.Text = dt.Rows(0).Item("fecha_estimada_arribo")
                'Catch ex As Exception

                'End Try
                Try
                    lblBultos.Text = dt.Rows(0).Item("cantidad_bultos")
                Catch ex As Exception

                End Try
                Try
                    lblNumDes.Text = dt.Rows(0).Item("despacho")
                Catch ex As Exception

                End Try
                Try
                    lblFO.Text = dt.Rows(0).Item("fecha_oficializacion")
                Catch ex As Exception

                End Try
                Try
                    lblLE.Text = dt.Rows(0).Item("lugar_de_entrega")
                Catch ex As Exception

                End Try
                'Try
                '    lblMerc.Text = dt.Rows(0).Item("mercaderia")
                'Catch ex As Exception

                'End Try
                Try
                    lblFA.Text = dt.Rows(0).Item("fecha_apertura")
                Catch ex As Exception

                End Try
                Try
                    lblTD.Text = dt.Rows(0).Item("destinacion")
                Catch ex As Exception

                End Try
                Try
                    lblRC.Text = dt.Rows(0).Item("ref_cliente")
                Catch ex As Exception

                End Try
                Try
                    lblGC.Text = dt.Rows(0).Item("guia_conocimiento")
                    'lblGC.NavigateUrl = "home.aspx"
                Catch ex As Exception
                    lblGC.Visible = False
                    lblGC.Enabled = False
                End Try
                Try
                    lblFArribo.Text = dt.Rows(0).Item("fecha_arribo")
                Catch ex As Exception

                End Try
                Try
                    lblPB.Text = dt.Rows(0).Item("peso_bruto_bultos")
                Catch ex As Exception

                End Try
                Try
                    lblC.Text = dt.Rows(0).Item("canal")
                Catch ex As Exception

                End Try
                Try
                    lblFE.Text = dt.Rows(0).Item("fecha_entrega")
                Catch ex As Exception

                End Try
                Try
                    lblP.Text = dt.Rows(0).Item("comprador_vendedor")
                Catch ex As Exception

                End Try
                Try
                    lblTB.Text = dt.Rows(0).Item("cantidad_bultos")
                Catch ex As Exception

                End Try
                Try
                    lblPB2.Text = dt.Rows(0).Item("peso_bruto_bultos")
                Catch ex As Exception

                End Try
                Try
                    lblBI.Text = dt.Rows(0).Item("base_imponible")
                Catch ex As Exception

                End Try
                Try
                    lblS.Text = dt.Rows(0).Item("monto_seguro")
                Catch ex As Exception

                End Try
                Try
                    lblPN.Text = dt.Rows(0).Item("peso_guia")
                Catch ex As Exception

                End Try

                Try
                    LblFob.Text = dt.Rows(0).Item("monto_fob")
                Catch ex As Exception

                End Try
                Try
                    lblFlete.Text = dt.Rows(0).Item("monto_flete")
                Catch ex As Exception

                End Try
                Try
                    lblCot.Text = dt.Rows(0).Item("cotizacion_pagos")
                Catch ex As Exception

                End Try
                
            End If
        End If
    End Sub

    Protected Sub gvItems_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvItems.DataBound
        gvItems.Columns(0).Visible = False
    End Sub

    Protected Sub gvItems_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvItems.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes("onmouseover") = "javascript:setMouseOverColor(this);"
            e.Row.Attributes("onmouseout") = "javascript:setMouseOutColor(this);"

            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('DespachoItemModal','" & Trim(e.Row.Cells(0).Text) & "');"

        End If
    End Sub

    Protected Sub gvItems_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvItems.SelectedIndexChanged

    End Sub
#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        If Not Page.IsPostBack Then
            binddata()
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        'Response.OutputStream.Write(
        'lblCod.Text
        Dim oCC As New clsConex
        Dim oComm As New SqlCommand
        Dim vec(3, 1) As String
        vec(0, 1) = "9"
        vec(1, 1) = "24"
        vec(2, 1) = "5"
        vec(3, 1) = "16"
        oComm.Parameters.Add("@numero", Data.SqlDbType.NVarChar, 255).Value = lblCod.Text
        oComm.CommandText = "af_listadoieDetLiqEdi"
        oComm.CommandType = Data.CommandType.StoredProcedure
        oCC.consultaWPar(oComm, "detalle")
        If Not oCC.oDS Is Nothing Then
            Response.Clear()
            Dim texto As New StringBuilder
            Dim targetEncoding As Encoding
            texto.AppendLine("Nro. de Despacho: " & Trim(lblNumDes.Text))
            texto.AppendLine("Ref. Cliente    : " & Trim(lblRC.Text))
            texto.AppendLine("Proveedor       : " & Trim(lblP.Text))
            texto.AppendLine("Base Imponible  : " & Trim(lblBI.Text))
            texto.AppendLine("Fa. Comercial   : " & Trim(fc.Value.ToString))
            texto.AppendLine("Tasa de cambio  : " & Trim(lblCot.Text))
            texto.AppendLine()
            texto.AppendLine("Código    Conceptos               PCG              Importe")
            texto.AppendLine()
            For x As Integer = 0 To oCC.oDS.Tables(0).Rows.Count - 1
                For y As Integer = 0 To 3
                    vec(y, 0) = Trim(oCC.oDS.Tables(0).Rows(x).Item(y).ToString)
                    If y < 3 Then
                        For p As Integer = Len(vec(y, 0)) To CInt(vec(y, 1))
                            vec(y, 0) &= " "
                        Next
                    Else
                        vec(y, 0) = "$" & vec(y, 0)
                        For p As Integer = Len(vec(y, 0)) To CInt(vec(y, 1))
                            vec(y, 0) = " " & vec(y, 0)
                        Next
                    End If
                    texto.Append(vec(y, 0))
                Next
                texto.AppendLine()
            Next
            targetEncoding = Encoding.GetEncoding(0)
            Dim algo As Byte() = targetEncoding.GetBytes(texto.ToString)
            Response.ContentType = "application/octet-stream"
            Response.AddHeader("Content-Disposition", "attachment;filename=" & lblCod.Text & ".txt")
            Response.OutputStream.Write(algo, 0, algo.Length)
            Response.End()
            Response.Flush()
        End If
    End Sub

    Protected Sub gvFacturas_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvFacturas.RowCommand
        Dim band As Boolean = False
        Dim cli As String = Trim(LCase(get_cliente))
        If cli = LCase("UNILEVER DE ARGENTINA S.A.") Then
            band = True
        End If
        If e.CommandName = "Descargar" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim nFact As String = gvFacturas.Rows(index).Cells(3).Text

            'Trim(cliente)
            If nFact <> "" Then
                Dim oCC As New clsConex
                Dim oComm As New SqlCommand
                Dim parUser As New SqlParameter("@factura", Data.SqlDbType.NVarChar, 255)
                parUser.Value = nFact
                oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
                oComm.CommandType = Data.CommandType.StoredProcedure
                oComm.Parameters.Add(parUser)
                If band = False Then
                    oComm.CommandText = "af_txtbayer_Enc"
                Else
                    oComm.CommandText = "af_txtUni_Enc"
                End If
                If oCC.consultaWPar(oComm, "Facturas") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                If oCC.oDS.Tables.Count > 0 Then
                    Dim x As Integer = 0
                    For x = 0 To oCC.oDS.Tables("Facturas").Rows.Count - 1
                        oComm.CommandText = "af_txtbayer_Det"
                        If oCC.consultaWPar(oComm, "detalle") = False Then
                            Response.Redirect("error-page.aspx")
                        End If
                        If oCC.oDS.Tables.Count > 1 Then
                            Dim STR As String
                            STR = Mid(Date.Now, 7, 4) & Mid(Date.Now, 4, 2) & Mid(Date.Now, 1, 2) & Mid(Now, 11, 100).Replace(":", "").Replace(" ", "")
                            Dim oAr As archivo_detalle
                            If oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_iva") > 0 Then
                                oAr = New archivo_detalle(oCC.oDS.Tables("detalle").Rows.Count + 1, STR, oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_numoper"))
                            Else
                                oAr = New archivo_detalle(oCC.oDS.Tables("detalle").Rows.Count, STR, oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_numoper"))
                            End If
                            If band = False Then
                                oAr.agregar_cabecera(oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(0), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(1), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(2), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(3), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(4), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(5), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(6), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(7), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(8), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(9), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(10), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(11), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(12), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(13), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15))
                            Else
                                Dim hpc As String = ""
                                Dim pais As String = ""
                                For xp As Integer = 0 To 4
                                    Dim lect As String
                                    Try
                                        lect = oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(16 + xp)
                                    Catch ex As Exception
                                        lect = ""
                                    End Try
                                    If LCase(lect).ToString.Contains("hpc") = True Then
                                        hpc = 3000
                                        Try
                                            pais = Mid(lect, lect.IndexOf("-") + 1, Len(lect))
                                        Catch ex As Exception

                                        End Try
                                        Exit For
                                    ElseIf LCase(lect).ToString.Contains("food") = True Then
                                        hpc = 5000
                                        Try
                                            pais = Mid(lect, lect.IndexOf("-") + 1, Len(lect))
                                        Catch ex As Exception

                                        End Try
                                        Exit For
                                    End If
                                Next
                                oAr.agregar_cabecera(oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(0), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(1), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(2), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(3), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(4), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(5), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(6), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(7), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(8), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(9), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(10), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(11), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(12), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(13), oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15), pais, hpc)
                            End If
                            Dim y As Integer
                            For y = 0 To oCC.oDS.Tables("detalle").Rows.Count - 1
                                oAr.agregar_detalle(oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(0), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(1), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(2), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(3), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(4), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(5), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(6), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(7), "", "", oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15))
                            Next
                            y = y - 1
                            If oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_iva") > 0 Then
                                oAr.agregar_detalle(oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(0), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(1), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(2), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(3), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(4), oCC.oDS.Tables("detalle").DefaultView.Item(y).Item(5), "1VA", oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item("fac_iva"), "", "", oCC.oDS.Tables("Facturas").DefaultView.Item(x).Item(15))
                            End If
                            Dim oBJ() As Object
                            oBJ = oAr.guardar()
                            Dim targetEncoding As Encoding
                            Dim sbr As New StringBuilder
                            targetEncoding = Encoding.GetEncoding(0)
                            CType(oBJ(1), StringBuilder).AppendLine("")
                            CType(oBJ(1), StringBuilder).Append(CType(oBJ(3), StringBuilder).ToString)
                            Dim algo As Byte() = targetEncoding.GetBytes(CType(oBJ(1), StringBuilder).ToString)
                            Response.ContentType = "application/octet-stream"
                            Response.AddHeader("Content-Disposition", "attachment;filename=" & CType(oBJ(0), String).ToString)
                            Response.OutputStream.Write(algo, 0, algo.Length)
                            Response.End()
                            Response.Flush()
                        End If
                    Next
                End If
            End If
        End If
    End Sub

    Protected Sub gvFacturas_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvFacturas.RowCreated
        'If e.Row.RowType = DataControlRowType.DataRow Then

        '    ' Retrieve the LinkButton control from the first column.
        '    Dim addButton As LinkButton = CType(e.Row.Cells(1).Controls(0), LinkButton)

        '    ' Set the LinkButton's CommandArgument property with the
        '    ' row's index.
        '    addButton.CommandArgument = e.Row.RowIndex.ToString()

        'End If

    End Sub

    Protected Sub gvArchivos_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvArchivos.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then            
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('VisorArchivosModal','tyt_files/" & e.Row.Cells(2).Text & "/" & e.Row.Cells(3).Text & "');"
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

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then            
            e.Row.Attributes("onclick") = "javascript:location.href='ctt_detalle_djai.aspx?psp=" & Trim(Me.lblNumDes.Text) & "';"            
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim sql As String
        sql = "insert into archivos_reportados (despacho, fecha_reportado, nameid) values ('" & lblNumDes.Text & "', getdate(),'" & User.Identity.Name & "')"
        occ.exSql(sql)
        Panel1.Visible = False
        Dim scriptString As String = "<script language='JavaScript'> " & _
                                       "alert('El archivo fue reportado y volverá a estar disponible en un lapso de 24hs.');</script>"
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", scriptString)
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        Dim ds As Data.DataSet
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(0)
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16, Data.ParameterDirection.Input)
        prm(0).Value = Request.QueryString("psp")
        occ.consultaSP("d_getLiquidaciones", prm, "liquidaciones")
        ds = occ.oDS
        'For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
        '    sbr.Append(dc.ColumnName & ";")
        'Next
        For Each dc As DataControlField In gvLiquidaciones.Columns
            sbr.Append(dc.HeaderText & ";")
        Next

        For Each dR As GridViewRow In gvLiquidaciones.Rows
            For dc As Integer = 0 To gvLiquidaciones.Columns.Count - 1
                sbr.Append(dR.Cells(dc).Text.ToString & ";")
            Next
            sbr.AppendLine("")
        Next
        'For Each dr As Data.DataRow In ds.Tables("liquidaciones").Rows
        '    sbr.AppendLine("")
        '    For Each dc As Data.DataColumn In ds.Tables("liquidaciones").Columns
        '        sbr.Append(dr.Item(dc.ColumnName) & ";")
        '    Next
        'Next




        targetEncoding = Encoding.GetEncoding(0)
        Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
        Response.ContentType = "application/octet-stream"
        Response.AddHeader("Content-Disposition", "attachment;filename=reporte.csv")
        Response.OutputStream.Write(algo, 0, algo.Length)
        Response.End()
        Response.Flush()
    End Sub

    Protected Sub gvFacturas_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvFacturas.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            
            If Not e.Row.Cells(8).Text = "" Then
                'e.Row.Cells(2).Attributes("onclick") = "javascript:window.open('" & e.Row.Cells(8).Text & "','mywindows','scrollbars=1,menubar=0,resizable=0,width=700,height=300,toolbars=0');"
                e.Row.Cells(2).Attributes("onclick") = "javascript:window.OpenModalAngular('VisorArchivosModal','" & e.Row.Cells(8).Text & "');"
            End If

            For x As Integer = 3 To 7
                e.Row.Cells(x).Attributes("onclick") = "javascript:window.OpenModalAngular('FacturaDespachoModal','" & e.Row.Cells(0).Text & "');"
            Next

        End If
    End Sub

    Protected Sub gvFacturas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvFacturas.SelectedIndexChanged

    End Sub
End Class

