
Imports System.Data
Imports System.Web.UI.DataVisualization.Charting
Imports System.Data.SqlClient

Partial Class inf_gastos_despachos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

        End If
    End Sub

    

    Private Sub renderChart(ByVal tbl As Data.DataTable, ByVal chr As Chart)
        For Each dr As DataRow In tbl.Rows
            If Trim(dr.Item(0).ToString) = "" Or dr.Item(0) Is Nothing Then
                dr.Item(0) = "Sin Especificar"
            End If
            chr.Series.Add(dr.Item(0).ToString)

            For Each dc As String In dr.ItemArray
                If Not dc = dr.Item(0).ToString Then
                    chr.Series(dr.Item(0).ToString).Points.AddY(CDbl(dc))
                End If
            Next
            chr.Series(dr.Item(0).ToString).Name = dr.Item(0).ToString
            ' show point labels
            chr.Series(dr.Item(0).ToString).IsValueShownAsLabel = False
        Next
        chr.ChartAreas(0).AxisX.IsMarginVisible = True
        chr.Legends.Add("Legenda")
        chr.Legends("Legenda").Enabled = True
    End Sub

    Private Sub renderChartStacked(ByVal tbl As Data.DataTable, ByVal chr As Chart)

        For Each dr As DataRow In tbl.Rows
           
            chr.Series.Add(dr.Item(0).ToString)

            For Each dc As Object In dr.ItemArray
                If dc Is DBNull.Value Then
                    dc = "0"
                End If
                If Not CStr(dc) = dr.Item(0).ToString Then
                    chr.Series(dr.Item(0).ToString).Points.AddY(CDbl("0" & CStr(dc)))
                End If
            Next
            chr.Series(dr.Item(0).ToString).ChartType = SeriesChartType.StackedColumn100
            chr.Series(dr.Item(0).ToString).Name = dr.Item(0).ToString
            ' show point labels
            chr.Series(dr.Item(0).ToString).IsValueShownAsLabel = False

            ' disable x axis margin
            ' Set the first two series to be grouped into Group1
            'chr.Series(dr.Item(0).ToString)("StackedGroupName") = "Group1"

        Next

        chr.ChartAreas(0).AxisX.IsMarginVisible = True
        chr.ChartAreas(0).Area3DStyle.Enable3D = True
        chr.Legends.Add("Legenda")
        chr.Legends("Legenda").Enabled = True

    End Sub

    Function getData() As DataTable
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        Dim SP As String = "IF_InformeGastosDespachos"
        '@cliente as varchar(255), @tipo nvarchar(20), @tfecha nvarchar(50), @desde smalldatetime,
        '@hasta smalldatetime, @campo nvarchar(50)

        oComm.CommandType = Data.CommandType.StoredProcedure
        Dim lparam As New List(Of SqlParameter)
        Dim param As SqlParameter
        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        Dim lbl As Label = Master.FindControl("lblUser")
        param.Value = lbl.Text
        lparam.Add(param)

        param = (New SqlParameter("@tipo", Data.SqlDbType.Char, 255))       
        param.Value = ddlTipo.SelectedValue
        lparam.Add(param)

        param = (New SqlParameter("@tfecha", SqlDbType.VarChar, 50))
        param.Value = ddlFechas.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@desde", SqlDbType.SmallDateTime))
        If Trim(txtDesde.Text) = "" Then
            param.Value = DateTime.Now.AddDays(-365).ToShortDateString
        Else
            param.Value = txtDesde.Text
        End If

        lparam.Add(param)
        param = (New SqlParameter("@hasta", SqlDbType.SmallDateTime))
        If Trim(txtHasta.Text) = "" Then
            param.Value = DateTime.Now.ToShortDateString
        Else
            param.Value = txtHasta.Text
        End If
        lparam.Add(param)

        param = (New SqlParameter("@campo", Data.SqlDbType.Char, 255))
        param.Value = ddGrafico.SelectedValue.ToString
        lparam.Add(param)

        If oCC.consultaSP(SP, lparam.ToArray, "Listado") = False Then
            Response.Redirect("error-page.aspx")
            Return Nothing
        Else
            Return oCC.oDS.Tables("Listado")
        End If
    End Function

    Protected Sub bVer1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles bVer1.Click
        Dim dt As DataTable = getData()
        If dt.Rows.Count > 0 Then
            Try
                dt.Columns.RemoveAt(dt.Columns.Count - 1)
                gvDp.DataSource = dt
                gvDp.DataBind()
                renderChartStacked(dt, chDP)
            Catch ex As Exception

            End Try
        End If
    End Sub
End Class
