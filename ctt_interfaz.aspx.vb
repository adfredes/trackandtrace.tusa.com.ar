Imports System.Data.SqlClient
Imports System.IO
Partial Class ctt_interfaz
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            'Panel2.Visible = False
            If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
                Response.Redirect("denegado.aspx")
            End If
            Dim Cabecera As Panel = Me.Master.FindControl("Panel4")
            Cabecera.Visible = True
        End If
    End Sub

    Protected Function buscar() As Data.DataSet
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.Parameters.Add(New SqlParameter("@cliente", Data.SqlDbType.Char, 255))
        oComm.Parameters.Add(New SqlParameter("@tipo", Data.SqlDbType.Char, 255))
        oComm.Parameters("@tipo").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@cliente").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@tipo").Value = ddlOperacion.SelectedValue  'Mid(ddlOperacion.Text, 1, 1)
        Dim lbl As Label = Master.FindControl("lblUser")
        oComm.Parameters("@cliente").Value = lbl.Text
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString

        oComm.CommandText = "ws_getDespachosLiquidaciones"
        oComm.Parameters.Add(New SqlParameter("@fdesde", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@fhasta", Data.SqlDbType.SmallDateTime))
        oComm.Parameters("@fdesde").Value = txtDesde.Text 'Mid(lblDFecha.Text, 4, 2) & "/" & Mid(lblDFecha.Text, 1, 2) & "/" & Mid(lblDFecha.Text, 7, 4)
        oComm.Parameters("@fhasta").Value = txtHasta.Text 'Mid(lblHFecha.Text, 4, 2) & "/" & Mid(lblHFecha.Text, 1, 2) & "/" & Mid(lblHFecha.Text, 7, 4)
        oComm.Parameters("@fdesde").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@fhasta").Direction = Data.ParameterDirection.Input

        If oCC.consultaWPar(oComm, "Listado") = False Then
            Response.Redirect("error-page.aspx")
            Return Nothing
        Else
            Return oCC.oDS
        End If
    End Function

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        Dim ds As Data.DataSet
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        ds = buscar()
        
        For Each dc As Data.DataColumn In ds.Tables(0).Columns
            sbr.Append(dc.ColumnName & ";")
        Next

        For Each dR As Data.DataRow In ds.Tables(0).Rows
            sbr.AppendLine("")
            For Each dc As Data.DataColumn In ds.Tables(0).Columns
                sbr.Append(dR.Item(dc.ColumnName).ToString & ";")
            Next
        Next
        targetEncoding = Encoding.GetEncoding(0)
        Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
        Response.ContentType = "application/octet-stream"
        Response.AddHeader("Content-Disposition", "attachment;filename=reporte.csv")
        Response.OutputStream.Write(algo, 0, algo.Length)
        Response.End()
        Response.Flush()
    End Sub
End Class
