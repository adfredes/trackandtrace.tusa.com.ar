Imports System.Data
Imports System.Data.SqlClient
Partial Class djj_despacho_factura
    Inherits System.Web.UI.Page

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim ds As DataSet = getData()
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
            sbr.Append(dc.ColumnName & ";")
        Next
        For Each dr As Data.DataRow In ds.Tables("Listado").Rows
            sbr.AppendLine("")
            For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
                sbr.Append(dr.Item(dc.ColumnName) & ";")
            Next
        Next
        targetEncoding = Encoding.GetEncoding(0)
        Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
        Response.ContentType = "application/octet-stream"
        Response.AddHeader("Content-Disposition", "attachment;filename=reporte.csv")
        Response.OutputStream.Write(algo, 0, algo.Length)
        Response.Flush()
        Response.End()
    End Sub

    Function getData() As DataSet
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ConnectionString)
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        Dim lisPrm As New Collections.Generic.List(Of SqlParameter)
        Dim param As SqlParameter




        param = New SqlParameter("@desde", Data.SqlDbType.SmallDateTime)
        param.Direction = ParameterDirection.Input
        param.Value = Me.txtDesde.Text
        lisPrm.Add(param)

        param = New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime)
        param.Direction = ParameterDirection.Input
        param.Value = Me.txtHasta.Text
        lisPrm.Add(param)

        param = New SqlParameter("@cliente", Data.SqlDbType.NVarChar, 255)
        param.Direction = ParameterDirection.Input
        Dim lbl As Label = Master.FindControl("lblUser")
        param.Value = Trim(lbl.Text)
        lisPrm.Add(param)
        oCC.consultaSP("Despachos_FacturasGetByDate", lisPrm.ToArray, "Listado")


        Return oCC.oDS
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "aparece", "function onBClick(){alert('Hola');}", True)
        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "aparece", "function onBClick(){var btn = document.getElementById('btnGenerar'); btn.disabled=true; btn.click();}", True)
        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        If Not Page.IsPostBack Then
            'For x As Integer = 2013 To DateAndTime.Now.Year
            '    ddlAno.Items.Add(New ListItem(x, x))
            'Next
        End If
    End Sub
End Class
