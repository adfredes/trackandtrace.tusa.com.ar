Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class cc_mocimientos
    Inherits System.Web.UI.Page

    Private Function validarfechas() As Boolean
        Dim band As Boolean
        Try
            If txtDesde.Text <> "" And txtHasta.Text <> "" AndAlso DateDiff(DateInterval.Day, CDate(txtDesde.Text), CDate(txtHasta.Text)) >= 0 Then
                band = True
            Else
                band = False
            End If
        Catch ex As Exception
            band = False
        End Try
        Return band
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 3) = False Then
                Response.Redirect("denegado.aspx")
            End If
            txtDesde.Text = DateTime.Now.AddDays(-7).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString
        End If        
    End Sub

    Function getData() As DataSet
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex

        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        oComm.Parameters.Add(New SqlParameter("@desde", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@hasta", Data.SqlDbType.SmallDateTime))
        oComm.Parameters.Add(New SqlParameter("@usuario", Data.SqlDbType.VarChar, 255))
        oComm.Parameters("@desde").Value = txtDesde.Text 'Mid(lblDFecha.Text, 4, 2) & "/" & Mid(lblDFecha.Text, 1, 2) & "/" & Mid(lblDFecha.Text, 7, 4)
        oComm.Parameters("@hasta").Value = txtHasta.Text 'Mid(lblHFecha.Text, 4, 2) & "/" & Mid(lblHFecha.Text, 1, 2) & "/" & Mid(lblHFecha.Text, 7, 4)
        oComm.Parameters("@usuario").Value = User.Identity.Name
        oComm.Parameters("@desde").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@hasta").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@usuario").Direction = Data.ParameterDirection.Input
        If ddlOperacion.Text = "Anticipos" Then
            oComm.CommandText = "af_ctaanticipo"
        Else
            oComm.CommandText = "af_ctacteOTRO"
        End If
        oComm.CommandType = Data.CommandType.StoredProcedure
        If oCC.consultaWPar(oComm, "Listado") = False Then
            Response.Redirect("error-page.aspx")
        Else
            Return oCC.oDS
        End If

    End Function

    Protected Sub cargar()
        Dim oDS As DataSet = getData()
        gvListado.DataSource = oDS
        gvListado.DataMember = "Listado"
        gvListado.DataBind()
        Try
            Label1.Text = gvListado.PageSize * gvListado.PageIndex + gvListado.Rows.Count & " de " & oDS.Tables("Listado").Rows.Count & " resultados"
        Catch ex As Exception
            Label1.Text = "0 de 0 resultados"
        End Try
    End Sub

    Sub bindgrilla(ByVal grilla As GridView)
        Dim oDS As DataSet = getData()

        grilla.DataSource = oDS
        grilla.DataMember = "Listado"        
        grilla.DataBind()


    End Sub

    Protected Sub gvListado_DataBound(sender As Object, e As System.EventArgs) Handles gvListado.DataBound
        Try
            gvListado.HeaderRow.Cells(13).Visible = False
        Catch ex As Exception

        End Try            
    End Sub
    Protected Sub gvListado_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvListado.PageIndexChanging
        gvListado.PageIndex = e.NewPageIndex
        cargar()
    End Sub

    Protected Sub gvListado_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvListado.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then            
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('FacturaReciboModal','" & e.Row.Cells(13).Text & "');"
            e.Row.Cells(13).Visible = False
        End If
    End Sub

    Protected Sub ibBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click                
        If validarfechas() Then
            gvListado.PageIndex = 0
            Label1.Text = ""
            cargar()
        Else
            gvListado.DataSource = Nothing
            gvListado.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        End If
    End Sub

    Protected Sub ibCsv_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibCsv.Click
        If validarfechas() = False Then
            Response.Write("<script language='javascript' type='text/javascript'>")
            Response.Write("alert('Error en las fechas ingresadas');")
            Response.Write("</script>")
            'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "alert('Error en las fechas ingresadas');", True)
        Else
            Dim sbr As New StringBuilder
            Dim targetEncoding As Encoding
            Dim ds As Data.DataSet = getData()


            For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
                If Not (Trim(dc.ColumnName) = "explorar") Then
                    sbr.Append(dc.ColumnName & ";")
                End If
            Next

            For Each dr As Data.DataRow In ds.Tables("Listado").Rows
                sbr.AppendLine("")
                For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
                    If Not (Trim(dc.ColumnName) = "explorar") Then
                        sbr.Append(dr.Item(dc.ColumnName) & ";")
                    End If
                Next
            Next

            targetEncoding = Encoding.GetEncoding(0)
            Dim algo As Byte() = targetEncoding.GetBytes(sbr.ToString)
            Response.ContentType = "application/octet-stream"
            Response.AddHeader("Content-Disposition", "attachment;filename=reporte.csv")
            Response.OutputStream.Write(algo, 0, algo.Length)
            Response.End()
            Response.Flush()
        End If
    End Sub

    Protected Sub ibExcel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibExcel.Click
        If validarfechas() = False Then
            Response.Write("<script language='javascript' type='text/javascript'>")
            Response.Write("alert('Error en las fechas ingresadas');")
            Response.Write("</script>")
            'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "alert('Error en las fechas ingresadas');", True)
        Else
            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim grilla As New GridView
            grilla = gvListado
            grilla.EnableViewState = False
            grilla.AllowPaging = False
            bindgrilla(grilla)
            'grilla.Columns(0).Visible = False
            Dim form = New HtmlForm
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(grilla)
            pagina.RenderControl(htw)
            If grilla.Rows.Count = 0 Then
                sb = New StringBuilder()
                sb.Append("<table>")
                sb.Append("<tr>")
                For Each dc As DataControlField In gvListado.Columns
                    If Not Trim(dc.HeaderText) = "" And Not (dc.HeaderText = "explorar") Then
                        sb.Append("<td>")
                        sb.Append(dc.HeaderText)
                        sb.Append("</td>")
                    End If
                Next
                sb.Append("</tr>")
                sb.Append("</table>")
            End If
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=data.xls")
            ';filename=data.xls
            Response.Charset = "UTF-8"
            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString())
            Response.End()
        End If
    End Sub

    Protected Sub ddlSizeGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSizeGrid.SelectedIndexChanged
        gvListado.PageSize = ddlSizeGrid.SelectedValue
        If validarfechas() Then
            gvListado.PageIndex = 0
            Label1.Text = ""
            cargar()
        Else
            gvListado.DataSource = Nothing
            gvListado.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        End If
    End Sub
End Class
