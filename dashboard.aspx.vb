
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.DataVisualization.Charting

Partial Class dashboard
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 5) = False Then
                Response.Redirect("denegado.aspx")
            Else
                LoadData()
            End If
        End If

    End Sub

    Private Sub LoadData()
        Dim oCC As New clsConex
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter
        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        param.Value = User.Identity.Name
        lisPrm.Add(param)


        param = New SqlParameter("@ano", Data.SqlDbType.NVarChar, 20, Data.ParameterDirection.Input)
        param.Value = (Date.Now.Year - 4).ToString()
        lisPrm.Add(param)

        param = New SqlParameter("@tipo", Data.SqlDbType.Char, 255)
        param.Value = "Importación"
        lisPrm.Add(param)


        oCC.consultaSP("Dashboard_TotalOperaciones", lisPrm.ToArray, "impo_expo")
        Try
            oCC.oDS.Tables("impo_expo").Columns.RemoveAt(13)
        Catch ex As Exception

        End Try

        Try

            Dim colorSelect() As Drawing.Color = {Drawing.Color.Blue, Drawing.Color.Green, Drawing.Color.Red, Drawing.Color.Yellow}
            renderChart(oCC.oDS.Tables("impo_expo").Select(""), ChartTotalOperaciones, colorSelect, SeriesChartType.Line)
            bindGrid(GridTotalOperaciones, GenerateTransposedTable(oCC.oDS.Tables("impo_expo")))
        Catch ex As Exception

        End Try



        oCC.consultaSP("Dashboard_BaseImponibleOperaciones", lisPrm.ToArray, "imponible")
        Try
            oCC.oDS.Tables("imponible").Columns.RemoveAt(13)
        Catch ex As Exception

        End Try

        Try

            Dim colorSelect() As Drawing.Color = {Drawing.Color.Blue, Drawing.Color.Green, Drawing.Color.Red, Drawing.Color.Yellow}
            renderChart(oCC.oDS.Tables("imponible").Select(""), ChartTotalImponible, colorSelect, SeriesChartType.Line)
            bindGrid(GridTotalImponible, GenerateTransposedTable(oCC.oDS.Tables("imponible")))
        Catch ex As Exception

        End Try

        lisPrm.Clear()

        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        param.Value = User.Identity.Name
        lisPrm.Add(param)


        param = New SqlParameter("@fecha", SqlDbType.SmallDateTime, 20, Data.ParameterDirection.Input)
        param.Value = Date.Now.ToString("dd/MM/yyyy")
        lisPrm.Add(param)

        param = New SqlParameter("@tipo", Data.SqlDbType.Char, 255)
        param.Value = "Importación"
        lisPrm.Add(param)


        oCC.consultaSP("Dashboard_Canales", lisPrm.ToArray, "canales")

        Try

            bindGrid(GridTotalCanales, oCC.oDS.Tables("canales"))
        Catch ex As Exception

        End Try


    End Sub

    Private Sub renderChart(ByVal tbl As DataRow(), ByVal chr As Chart, colorLinea() As Drawing.Color, tipo As SeriesChartType)

        chr.Series.Clear()
        For Each dr As DataRow In tbl

            chr.Series.Add(dr.Item(0).ToString)

            For col As Integer = 1 To 12

                Dim valor As String
                If (col < dr.ItemArray.Length) Then
                    Try
                        valor = dr(col).ToString
                        If Trim(valor) = "" Then
                            valor = "0"
                        End If
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

                'point.Color = colorLinea(chr.Series.Count - 1)
                'point.BorderColor = colorLinea(chr.Series.Count - 1)


                chr.Series(dr.Item(0).ToString).ChartType = tipo



            Next
            chr.Series(dr.Item(0).ToString).IsValueShownAsLabel = False
        Next


        chr.Legends.Add("Legenda")
        chr.Legends("Legenda").Enabled = True

        chr.ChartAreas(0).AxisX.IntervalAutoMode = IntervalAutoMode.FixedCount
        chr.ChartAreas(0).AxisX.Interval = 1

        chr.ChartAreas(0).AxisX.LineColor = Drawing.Color.Black
        'chr.ChartAreas(0).AxisX.LineWidth = 2
        chr.ChartAreas(0).AxisY.LineColor = Drawing.Color.Black
        'chr.ChartAreas(0).AxisY.LineWidth = 2
        'chr.ChartAreas(0).Area3DStyle.Enable3D = True
        'chr.ChartAreas(0).Area3DStyle.LightStyle = LightStyle.Simplistic
        'chr.Style.Item("height") = "auto"
        'chr.Style.Item("width") = "600px"

        chr.ChartAreas(0).BackColor = Drawing.Color.Transparent

    End Sub

    Sub bindGrid(gv As GridView, dt As DataTable)
        gv.DataSource = dt
        gv.DataBind()
        If gv.Columns.Count > 13 Then
            gv.Columns(13).Visible = False
        End If
        'gv.Columns(1).HeaderText = "AÑO"
    End Sub


    Private Function GenerateTransposedTable(inputTable As DataTable) As DataTable

        Dim outputTable As New DataTable()




        outputTable.Columns.Add(inputTable.Columns(0).ColumnName.ToString())

        For Each inRow As DataRow In inputTable.Rows
            Dim newColName As String = inRow(0).ToString()
            outputTable.Columns.Add(newColName)
        Next




        For rCount As Integer = 1 To inputTable.Columns.Count - 1
            Dim newRow As DataRow = outputTable.NewRow()


            newRow(0) = inputTable.Columns(rCount).ColumnName.ToString()
            For cCount As Integer = 0 To inputTable.Rows.Count - 1
                Dim colValue As String = inputTable.Rows(cCount)(rCount).ToString()
                newRow(cCount + 1) = colValue
            Next

            outputTable.Rows.Add(newRow)
        Next


        Return outputTable
End Function
End Class
