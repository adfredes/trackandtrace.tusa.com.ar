
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.DataVisualization.Charting

Partial Class home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Response.Redirect("ctt_busqueda2.aspx")
        LoadData()
    End Sub

    Private Sub LoadData()
        Dim oCC As New clsConex
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter
        Dim tipo = "%%"
        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        param.Value = User.Identity.Name
        lisPrm.Add(param)


        param = New SqlParameter("@ano", Data.SqlDbType.NVarChar, 20, Data.ParameterDirection.Input)
        param.Value = Date.Now.Year.ToString()
        lisPrm.Add(param)

        param = New SqlParameter("@tipo", Data.SqlDbType.NVarChar, 20, Data.ParameterDirection.Input)
        param.Value = tipo
        lisPrm.Add(param)
        oCC.consultaSP("IA_TipoOpe_2", lisPrm.ToArray, "impo_expo")
        Try
            'oCC.oDS.Tables("impo_expo").Columns.RemoveAt(oCC.oDS.Tables("impo_expo").Columns.Count - 1)
            'oCC.oDS.Tables("impo_expo").Columns("tipo_impo_expo").ColumnName = "TIPO OPERACIÓN"
            'renderChart(oCC.oDS.Tables("impo_expo"), ChartImpo)
            Dim colorSelect() As Drawing.Color = {Drawing.Color.Blue, Drawing.Color.Green, Drawing.Color.Red}
            Dim colorImpo() As Drawing.Color = {Drawing.Color.Green}
            Dim colorExpo() As Drawing.Color = {Drawing.Color.Blue}
            Dim colorSimi() As Drawing.Color = {Drawing.Color.Red}
            renderChart(oCC.oDS.Tables("impo_expo").Select("tipo_impo_expo = 'Importación'"), ChartImpo, colorImpo, SeriesChartType.Line)
            renderChart(oCC.oDS.Tables("impo_expo").Select("tipo_impo_expo = 'Exportación'"), ChartExpo, colorExpo, SeriesChartType.Line)
            renderChart(oCC.oDS.Tables("impo_expo").Select("tipo_impo_expo = 'Simi'"), ChartSimis, colorSimi, SeriesChartType.Line)
            'renderChart(oCC.oDS.Tables("impo_expo").Select("tipo_impo_expo in ('Simi','Importación','Exportación')"), ChartComparativa, colorSelect, SeriesChartType.Column)
        Catch ex As Exception

        End Try

        lisPrm.Clear()

        param = New SqlParameter("@usuario", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input)
        param.Value = User.Identity.Name
        lisPrm.Add(param)

        Dim hoy As DateTime = DateAndTime.Now() '.AddDays(-182)
        Select Case hoy.DayOfWeek
            Case DayOfWeek.Saturday
                hoy = hoy.AddDays(-1)

            Case DayOfWeek.Sunday
                hoy = hoy.AddDays(-2)
        End Select

        param = New SqlParameter("@desde", Data.SqlDbType.SmallDateTime)
        param.Value = String.Format("{0}/{1}/{2}", hoy.Day.ToString(), hoy.Month.ToString(), hoy.Year.ToString())
        lisPrm.Add(param)

        param = New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime)
        param.Value = String.Format("{0}/{1}/{2}", hoy.Day.ToString(), hoy.Month.ToString(), hoy.Year.ToString())
        lisPrm.Add(param)


        oCC.consultaSP("GetOperaciones", lisPrm.ToArray, "operaciones")
        bindGrid(GridImpo, oCC.oDS.Tables("operaciones"), "Importación", lblImpo)
        bindGrid(GridExpo, oCC.oDS.Tables("operaciones"), "Exportación", lblExpo)
        bindGrid(GridSimi, oCC.oDS.Tables("operaciones"), "simi", lblSimi)
    End Sub

    Private Sub renderChart(ByVal tbl As DataRow(), ByVal chr As Chart, colorLinea() As Drawing.Color, tipo As SeriesChartType)
        chr.Series.Clear()
        For Each dr As DataRow In tbl
            chr.Series.Add(dr.Item(0).ToString)
            For col As Integer = 1 To Date.Now.Month
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

                point.Color = colorLinea(chr.Series.Count - 1)
                point.BorderColor = colorLinea(chr.Series.Count - 1)


                chr.Series(dr.Item(0).ToString).ChartType = tipo



            Next
            chr.Series(dr.Item(0).ToString).IsValueShownAsLabel = False
        Next


        chr.Legends.Add("Legenda")
        chr.Legends("Legenda").Enabled = False

        chr.ChartAreas(0).AxisX.IntervalAutoMode = IntervalAutoMode.FixedCount
        chr.ChartAreas(0).AxisX.Interval = 1

        chr.ChartAreas(0).AxisX.LineColor = Drawing.Color.Black
        'chr.ChartAreas(0).AxisX.LineWidth = 2
        chr.ChartAreas(0).AxisY.LineColor = Drawing.Color.Black
        'chr.ChartAreas(0).AxisY.LineWidth = 2
        'chr.ChartAreas(0).Area3DStyle.Enable3D = True
        'chr.ChartAreas(0).Area3DStyle.LightStyle = LightStyle.Simplistic
        'chr.Style.Item("height") = "auto"
        'chr.Style.Item("width") = "80%"

        chr.ChartAreas(0).BackColor = Drawing.Color.Transparent

    End Sub

    Sub bindGrid(gv As GridView, dt As DataTable, tipo As String, lbl As Label)
        '.Select("tipo_impo_expo = 'Importación'")    
        Dim dv As DataView = dt.DefaultView
        dv.RowFilter = "tipo_impo_expo = '" & tipo & "'"
        If dv.Count = 0 Then
            lbl.Visible = True
            lbl.Text = "No se encontraron oficializaciones."
        End If
        gv.DataSource = dv
        gv.DataBind()
    End Sub

    Private Sub GridExpo_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridExpo.RowDataBound, GridImpo.RowDataBound, GridSimi.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            For x As Integer = 0 To e.Row.Cells.Count - 1
                e.Row.Cells(x).Attributes("onclick") = "javascript:window.OpenModalAngular('DespachoModal','" & Trim(e.Row.Cells(0).Text) & "');"
            Next
        End If
    End Sub
End Class
