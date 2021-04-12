Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.DataVisualization.Charting

Partial Class ctt_flow
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load        
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
                Response.Redirect("denegado.aspx")
            End If
            bindcontrol()
            'pGraficos.Visible = False
            pGraficos.Style.Item("display") = "none"
        End If
    End Sub

    Sub bindcontrol()
        For cont As Integer = 2008 To Date.Now.Year
            DropDownList3.Items.Add(cont)
            DropDownList3.Text = cont.ToString
        Next

        Dim oCC As New clsConex
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter

        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        param.Value = User.Identity.Name
        lisPrm.Add(param)

        Dim param1() As Object = {"0", "[DEPOSITO]"}

        Try
            oCC.consultaSP("GetDepositos", lisPrm.ToArray, "listDepositos")
            param1(1) = "[DEPOSITO]"
            oCC.oDS.Tables("listDepositos").Rows.Add(param1)
            ddlDeposito.DataSource = oCC.oDS
            ddlDeposito.DataMember = "listDepositos"
            ddlDeposito.DataValueField = "codigo_deposito"
            ddlDeposito.DataTextField = "descripcion_deposito"
            ddlDeposito.SelectedValue = "0"
            ddlDeposito.DataBind()
        Catch ex As Exception

        End Try

        lisPrm.Clear()

        Try
            oCC.consultaSP("getMediosTransporte", lisPrm.ToArray, "transportes")
            param1(1) = "[VIA]"
            oCC.oDS.Tables("transportes").Rows.Add(param1)
            ddlTransporte.DataSource = oCC.oDS
            ddlTransporte.DataMember = "transportes"
            ddlTransporte.DataValueField = "idmediotransporte"
            ddlTransporte.DataTextField = "nombre"
            ddlTransporte.SelectedValue = "0"
            ddlTransporte.DataBind()
        Catch ex As Exception

        End Try

        Try
            oCC.consultaSP("getAduanas", lisPrm.ToArray, "aduanas")
            param1(1) = "[ADUANA]"
            oCC.oDS.Tables("aduanas").Rows.Add(param1)
            ddlAduana.DataSource = oCC.oDS
            ddlAduana.DataMember = "aduanas"
            ddlAduana.DataValueField = "idaduana"
            ddlAduana.DataTextField = "nombre"
            ddlAduana.SelectedValue = "0"
            ddlAduana.DataBind()
        Catch ex As Exception

        End Try


        oCC.consultaSP("getDestinaciones", , "Destinaciones")
        param1(1) = "[DESTINACION]"
        oCC.oDS.Tables("Destinaciones").Rows.Add(param1)
        ddlDestinacion.DataSource = oCC.oDS.Tables("Destinaciones")
        ddlDestinacion.DataTextField = "destinacion"
        ddlDestinacion.DataValueField = "iddestinacion"
        ddlDestinacion.SelectedValue = "0"
        ddlDestinacion.DataBind()

        oCC.consultaSP("getPaises2", , "Pais")
        param1(1) = "[PROCEDENCIA/DESTINO]"
        oCC.oDS.Tables("Pais").Rows.Add(param1)
        ddlProcedencia.DataSource = oCC.oDS.Tables("pais")
        ddlProcedencia.DataTextField = "nombre"
        ddlProcedencia.DataValueField = "idpais"
        ddlProcedencia.SelectedValue = "0"
        ddlProcedencia.DataBind()

        oCC.consultaSP("getCanales", , "Canal")
        param1(1) = "[CANAL]"
        oCC.oDS.Tables("Canal").Rows.Add(param1)
        ddlCanal.DataSource = oCC.oDS.Tables("Canal")
        ddlCanal.DataTextField = "nombre"
        ddlCanal.DataValueField = "canal"
        ddlCanal.SelectedValue = "0"
        ddlCanal.DataBind()



    End Sub

    Private Sub binddata2()
        'IE_TipoOpe
        Dim oCC As New clsConex
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter

        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        param.Value = User.Identity.Name
        lisPrm.Add(param)


        param = New SqlParameter("@ano", Data.SqlDbType.NVarChar, 20, Data.ParameterDirection.Input)
        param.Value = Me.DropDownList3.SelectedItem.Text
        lisPrm.Add(param)

        param = New SqlParameter("@tipo", Data.SqlDbType.NVarChar, 20, Data.ParameterDirection.Input)
        param.Value = Me.DropDownList4.SelectedValue
        lisPrm.Add(param)

        param = New SqlParameter("@ref", Data.SqlDbType.NVarChar, 100, Data.ParameterDirection.Input)
        param.Value = Me.txtReferencia.Text.Trim()
        lisPrm.Add(param)

        param = New SqlParameter("@deposito", Data.SqlDbType.NVarChar, 100, Data.ParameterDirection.Input)
        param.Value = Me.ddlDeposito.SelectedValue
        lisPrm.Add(param)

        param = New SqlParameter("@destinacion", Data.SqlDbType.Int, Data.ParameterDirection.Input)
        param.Value = Me.ddlDestinacion.SelectedValue
        lisPrm.Add(param)

        param = New SqlParameter("@aduana", Data.SqlDbType.Int, Data.ParameterDirection.Input)
        param.Value = Me.ddlAduana.SelectedValue
        lisPrm.Add(param)

        param = New SqlParameter("@medio_transporte", Data.SqlDbType.Int, Data.ParameterDirection.Input)
        param.Value = Me.ddlTransporte.SelectedValue
        lisPrm.Add(param)

        param = New SqlParameter("@canal", Data.SqlDbType.NVarChar, 20, Data.ParameterDirection.Input)
        param.Value = Me.ddlCanal.SelectedValue
        lisPrm.Add(param)

        param = New SqlParameter("@pais", Data.SqlDbType.Int, Data.ParameterDirection.Input)
        param.Value = Me.ddlProcedencia.SelectedValue
        lisPrm.Add(param)

        Try
            oCC.consultaSP("IA_TipoOpe", lisPrm.ToArray, "impo_expo")
            oCC.oDS.Tables("impo_expo").Columns.RemoveAt(oCC.oDS.Tables("impo_expo").Columns.Count - 1)
            oCC.oDS.Tables("impo_expo").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN"
            GridView6.DataSource = oCC.oDS
            GridView6.DataMember = "impo_expo"
            GridView6.DataBind()
            renderChart(oCC.oDS.Tables("impo_expo"), Chart1)
        Catch ex As Exception

        End Try



        Try
            oCC.consultaSP("IA_TipoTrs", lisPrm.ToArray, "transporte")
            oCC.oDS.Tables("transporte").Columns.RemoveAt(oCC.oDS.Tables("transporte").Columns.Count - 1)
            oCC.oDS.Tables("transporte").Columns("nombre").ColumnName = "TIPO TRANSPORTE"
            If oCC.oDS.Tables("transporte").Rows(0).Item(0) Is Nothing Then
                oCC.oDS.Tables("transporte").Rows(0).Item(0) = "NN"
            End If
            GridView7.DataSource = oCC.oDS
            GridView7.DataMember = "transporte"
            GridView7.DataBind()
            renderChartStacked(oCC.oDS.Tables("transporte"), Chart2)
        Catch ex As Exception

        End Try


        Try
            oCC.consultaSP("IA_Destinacion", lisPrm.ToArray, "destinacion")
            oCC.oDS.Tables("destinacion").Columns.RemoveAt(oCC.oDS.Tables("destinacion").Columns.Count - 1)
            oCC.oDS.Tables("destinacion").Columns("dest").ColumnName = "DESTINACIÓN"
            GridView8.DataSource = oCC.oDS
            GridView8.DataMember = "destinacion"
            GridView8.DataBind()
            renderChartStacked(oCC.oDS.Tables("destinacion"), Chart3)
        Catch ex As Exception

        End Try



        Try
            oCC.consultaSP("IA_Canal", lisPrm.ToArray, "canal")
            oCC.oDS.Tables("canal").Columns.RemoveAt(oCC.oDS.Tables("canal").Columns.Count - 1)
            GridView9.DataSource = oCC.oDS
            GridView9.DataMember = "canal"
            GridView9.DataBind()
            Dim colorLinea() As Drawing.Color = {Drawing.Color.Yellow, Drawing.Color.Green, Drawing.Color.Red}
            renderChartStacked(oCC.oDS.Tables("canal"), Chart4, colorLinea)
        Catch ex As Exception

        End Try

        'oCC.consultaSP("IA_ArriboOfi", lisPrm.ToArray, "aduana")
        Try
            oCC.consultaSP("IA_Aduana", lisPrm.ToArray, "aduana")
            oCC.oDS.Tables("aduana").Columns.RemoveAt(oCC.oDS.Tables("aduana").Columns.Count - 1)
            GridView10.DataSource = oCC.oDS
            GridView10.DataMember = "Aduana"
            GridView10.DataBind()
            renderChartStacked(oCC.oDS.Tables("aduana"), Chart5)
        Catch ex As Exception

        End Try

        Try
            oCC.consultaSP("IA_dEPOSITO", lisPrm.ToArray, "deposito")
            oCC.oDS.Tables("deposito").Columns.RemoveAt(oCC.oDS.Tables("deposito").Columns.Count - 1)
            GridView14.DataSource = oCC.oDS
            GridView14.DataMember = "deposito"
            GridView14.DataBind()
            renderChartStacked(oCC.oDS.Tables("deposito"), Chart14)
        Catch ex As Exception

        End Try


        Try
            oCC.consultaSP("IA_ArriboOfi", lisPrm.ToArray, "ArriboOfi")
            oCC.oDS.Tables("ArriboOfi").Columns.RemoveAt(oCC.oDS.Tables("ArriboOfi").Columns.Count - 1)
            oCC.oDS.Tables("ArriboOfi").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN"
            GridView11.DataSource = oCC.oDS
            GridView11.DataMember = "ArriboOfi"
            GridView11.DataBind()
            renderChart(oCC.oDS.Tables("ArriboOfi"), Chart6)
        Catch ex As Exception

        End Try


        Try
            oCC.consultaSP("IA_OfiEntrega", lisPrm.ToArray, "OfiEntrega")
            oCC.oDS.Tables("OfiEntrega").Columns.RemoveAt(oCC.oDS.Tables("OfiEntrega").Columns.Count - 1)
            oCC.oDS.Tables("OfiEntrega").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN"
            GridView1.DataSource = oCC.oDS
            GridView1.DataMember = "OfiEntrega"
            GridView1.DataBind()
            renderChart(oCC.oDS.Tables("OfiEntrega"), Chart7)
        Catch ex As Exception

        End Try


        Try
            oCC.consultaSP("IA_ArriboEntrega", lisPrm.ToArray, "ArriboEntrega")
            oCC.oDS.Tables("ArriboEntrega").Columns.RemoveAt(oCC.oDS.Tables("ArriboEntrega").Columns.Count - 1)
            oCC.oDS.Tables("ArriboEntrega").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN"
            GridView2.DataSource = oCC.oDS
            GridView2.DataMember = "ArriboEntrega"
            GridView2.DataBind()
            renderChart(oCC.oDS.Tables("ArriboEntrega"), Chart8)
        Catch ex As Exception

        End Try

        Try
            oCC.consultaSP("IA_BaseImponible", lisPrm.ToArray, "BaseImponible")
            oCC.oDS.Tables("BaseImponible").Columns.RemoveAt(oCC.oDS.Tables("BaseImponible").Columns.Count - 1)
            oCC.oDS.Tables("BaseImponible").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN"
            For Each row As DataRow In oCC.oDS.Tables("BaseImponible").Rows
                For x As Integer = 1 To oCC.oDS.Tables("BaseImponible").Columns.Count - 1
                    If (row(x).ToString() = "") Then
                        row(x) = 0
                    Else
                        row(x) = Math.Round(Convert.ToDouble(row(x)), 2)
                    End If
                Next
            Next

            GridView12.DataSource = oCC.oDS
            GridView12.DataMember = "BaseImponible"
            GridView12.DataBind()
            renderChart(oCC.oDS.Tables("BaseImponible"), Chart12)
        Catch ex As Exception

        End Try
        'fob
        Try
            oCC.consultaSP("IA_FOB", lisPrm.ToArray, "FOB")
            oCC.oDS.Tables("FOB").Columns.RemoveAt(oCC.oDS.Tables("FOB").Columns.Count - 1)
            oCC.oDS.Tables("FOB").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN - MONEDA"
            For Each row As DataRow In oCC.oDS.Tables("FOB").Rows
                For x As Integer = 1 To oCC.oDS.Tables("FOB").Columns.Count - 1
                    If (row(x).ToString() = "") Then
                        row(x) = 0
                    Else
                        row(x) = Math.Round(Convert.ToDouble(row(x)), 2)
                    End If
                Next
            Next

            GridView3.DataSource = oCC.oDS
            GridView3.DataMember = "FOB"
            GridView3.DataBind()
            renderChart(oCC.oDS.Tables("FOB"), Chart9)
        Catch ex As Exception

        End Try

        'cif
        Try
            oCC.consultaSP("IA_CIF", lisPrm.ToArray, "CIF")
            oCC.oDS.Tables("CIF").Columns.RemoveAt(oCC.oDS.Tables("CIF").Columns.Count - 1)
            oCC.oDS.Tables("CIF").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN - MONEDA"
            For Each row As DataRow In oCC.oDS.Tables("CIF").Rows
                For x As Integer = 1 To oCC.oDS.Tables("CIF").Columns.Count - 1
                    If (row(x).ToString() = "") Then
                        row(x) = 0
                    Else
                        row(x) = Math.Round(Convert.ToDouble(row(x)), 2)
                    End If
                Next
            Next

            GridView4.DataSource = oCC.oDS
            GridView4.DataMember = "CIF"
            GridView4.DataBind()
            renderChart(oCC.oDS.Tables("CIF"), Chart10)
        Catch ex As Exception

        End Try

        'flete
        Try
            oCC.consultaSP("IA_FLETE", lisPrm.ToArray, "FLETE")
            oCC.oDS.Tables("FLETE").Columns.RemoveAt(oCC.oDS.Tables("FLETE").Columns.Count - 1)
            oCC.oDS.Tables("FLETE").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN - MONEDA"
            For Each row As DataRow In oCC.oDS.Tables("FLETE").Rows
                For x As Integer = 1 To oCC.oDS.Tables("FLETE").Columns.Count - 1
                    If (row(x).ToString() = "") Then
                        row(x) = 0
                    Else
                        row(x) = Math.Round(Convert.ToDouble(row(x)), 2)
                    End If
                Next
            Next

            GridView5.DataSource = oCC.oDS
            GridView5.DataMember = "FLETE"
            GridView5.DataBind()
            renderChart(oCC.oDS.Tables("FLETE"), Chart11)
        Catch ex As Exception

        End Try

        'flete
        Try
            oCC.consultaSP("IA_GASTOS", lisPrm.ToArray, "GASTOS")
            oCC.oDS.Tables("GASTOS").Columns.RemoveAt(oCC.oDS.Tables("GASTOS").Columns.Count - 1)
            For Each row As DataRow In oCC.oDS.Tables("GASTOS").Rows
                For x As Integer = 1 To oCC.oDS.Tables("GASTOS").Columns.Count - 1
                    If (row(x).ToString() = "") Then
                        row(x) = 0
                    Else
                        row(x) = Math.Round(Convert.ToDouble(row(x)), 2)
                    End If
                Next
            Next

            GridView13.DataSource = oCC.oDS
            GridView13.DataMember = "GASTOS"
            GridView13.DataBind()
            renderChart(oCC.oDS.Tables("GASTOS"), Chart13)
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        pGraficos.Style.Item("display") = "block"
        binddata2()
    End Sub


    Private Sub renderChart(ByVal tbl As Data.DataTable, ByVal chr As Chart)        
        chr.Series.Clear()
        For Each dr As DataRow In tbl.Rows
            If dr.Item(0).ToString = "" Or dr.Item(0) Is Nothing Then
                dr.Item(0) = "Sin Especificar"
            End If
            chr.Series.Add(dr.Item(0).ToString)

            For Each dc As Object In dr.ItemArray
                Dim valor As String
                Try
                    valor = CStr(dc)
                Catch ex As Exception
                    valor = "0"
                End Try
                If Not valor = dr.Item(0).ToString Then
                    If Trim(valor) = "" Then
                        valor = "0"
                    End If
                    chr.Series(dr.Item(0).ToString).Points.AddY(CDbl(valor))
                End If
            Next



            chr.Series(dr.Item(0).ToString).Name = dr.Item(0).ToString

            ' show point labels
            chr.Series(dr.Item(0).ToString).IsValueShownAsLabel = False
        Next

        chr.ChartAreas(0).AxisX.IsMarginVisible = True
        chr.Legends.Add("Legenda")
        chr.Legends("Legenda").Enabled = True

        'chr.ChartAreas(0).AxisX.IntervalAutoMode = IntervalAutoMode.FixedCount
        chr.ChartAreas(0).AxisX.Interval = 1

    End Sub

    Private Sub renderChartStacked(ByVal tbl As Data.DataTable, ByVal chr As Chart, Optional colorLinea() As Drawing.Color = Nothing)
        chr.Series.Clear()
        Try
            chr.Legends.Clear()
        Catch ex As Exception

        End Try
        Dim colCount As Integer
        If (Me.DropDownList3.SelectedItem.Text = Convert.ToString(Date.Now.Year)) Then
            colCount = Date.Now.Month
        Else
            colCount = 12
        End If
        For Each dr As DataRow In tbl.Rows
            'If (Not colorLinea Is Nothing) Then

            chr.Series.Add(dr.Item(0).ToString)
            For col As Integer = 1 To colCount
                Dim valor As String
                If (col < dr.ItemArray.Length) Then
                    Try
                        valor = dr(col).ToString
                    Catch ex As Exception
                        valor = "0"
                    End Try
                Else
                    valor = "0"
                End If
                Dim point As New DataPoint()
                point.SetValueY(CDbl(valor))
                point.SetValueXY(DateAndTime.MonthName(col), CDbl(valor))


                chr.Series(dr.Item(0).ToString).Points.Add(point)
                point.BorderWidth = 4
                Select Case dr.Item(0).ToString
                    Case "VERDE"
                        point.Color = Drawing.Color.DarkGreen
                        'point.BorderColor = Drawing.Color.DarkGreen
                        chr.Series(dr.Item(0).ToString).Color = Drawing.Color.DarkGreen
                    Case "ROJO"
                        point.Color = Drawing.Color.Red
                        'point.BorderColor = Drawing.Color.Red
                        chr.Series(dr.Item(0).ToString).Color = Drawing.Color.Red
                    Case "NARANJA"
                        point.Color = Drawing.Color.DarkOrange
                        'point.BorderColor = Drawing.Color.DarkOrange
                        chr.Series(dr.Item(0).ToString).Color = Drawing.Color.DarkOrange
                End Select

                'point.Color = colorLinea(chr.Series.Count - 1)
                'point.BorderColor = colorLinea(chr.Series.Count - 1)



            Next


            'Else

            '    If dr.Item(0).ToString = "" Or dr.Item(0) Is Nothing Then
            '        dr.Item(0) = "Sin Especificar"
            '    End If
            '    chr.Series.Add(dr.Item(0).ToString)

            '    For Each dc As String In dr.ItemArray
            '        If Not dc = dr.Item(0).ToString Then
            '            chr.Series(dr.Item(0).ToString).Points.AddY(CDbl(dc))
            '        End If
            '    Next

            '    ' disable x axis margin
            '    ' Set the first two series to be grouped into Group1
            '    'chr.Series(dr.Item(0).ToString)("StackedGroupName") = "Group1"

            'End If
            chr.Series(dr.Item(0).ToString).ChartType = SeriesChartType.StackedColumn100
            chr.Series(dr.Item(0).ToString).Name = dr.Item(0).ToString
            ' show point labels
            chr.Series(dr.Item(0).ToString).IsValueShownAsLabel = False






        Next

        chr.ChartAreas(0).AxisX.IsMarginVisible = True
        chr.ChartAreas(0).Area3DStyle.Enable3D = True
        chr.ChartAreas(0).AxisX.Interval = 1

        chr.Legends.Add("Legenda")
        chr.Legends("Legenda").Enabled = True

    End Sub


    Sub changeChart(ByVal chr As Chart, ByVal tipo As SeriesChartType)
        For Each iSerie As Series In chr.Series
            iSerie.ChartType = tipo
        Next
    End Sub

    Protected Sub ddlChart_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlChart.SelectedIndexChanged
        Dim tipo As SeriesChartType
        Select Case ddlChart.SelectedValue.ToString
            Case "1"
                tipo = SeriesChartType.Bar                
            Case "2"
                tipo = SeriesChartType.Column
            Case "3"
                tipo = SeriesChartType.Line
            Case "4"
                tipo = SeriesChartType.StackedBar
            Case "5"
                tipo = SeriesChartType.StackedColumn
            Case "6"
                tipo = SeriesChartType.StackedBar100
            Case "7"
                tipo = SeriesChartType.StackedColumn100
        End Select

        changeChart(Chart1, tipo)
        changeChart(Chart2, tipo)
        changeChart(Chart3, tipo)
        changeChart(Chart4, tipo)
        changeChart(Chart5, tipo)
        changeChart(Chart6, tipo)
        changeChart(Chart7, tipo)
        changeChart(Chart8, tipo)
    End Sub

    Protected Sub ddl3d_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl3d.SelectedIndexChanged
        If ddl3d.SelectedValue.ToString = "2" Then
            Chart1.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart2.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart3.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart4.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart5.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart6.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart7.ChartAreas(0).Area3DStyle.Enable3D = True
            Chart8.ChartAreas(0).Area3DStyle.Enable3D = True
        Else
            Chart1.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart2.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart3.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart4.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart5.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart6.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart7.ChartAreas(0).Area3DStyle.Enable3D = False
            Chart8.ChartAreas(0).Area3DStyle.Enable3D = False
        End If
    End Sub

    Protected Sub ddlWidth_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlWidth.SelectedIndexChanged
        Chart1.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart1.Style.Item("height") = "auto"
        Chart2.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart2.Style.Item("height") = "auto"
        Chart3.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart3.Style.Item("height") = "auto"
        Chart4.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart4.Style.Item("height") = "auto"
        Chart5.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart5.Style.Item("height") = "auto"
        Chart6.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart6.Style.Item("height") = "auto"
        Chart7.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart7.Style.Item("height") = "auto"
        Chart8.Style.Item("width") = ddlWidth.SelectedValue.ToString
        Chart8.Style.Item("height") = "auto"
    End Sub
End Class

