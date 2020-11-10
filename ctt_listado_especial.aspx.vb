Imports System.Data.SqlClient
Imports System.IO
Partial Class ctt_listado_especial
    Inherits System.Web.UI.Page

    Private Sub bindGrilla(ByVal gv As GridView)
        Dim ds As Data.DataSet = buscar()
        gv.DataSource = ds
        gv.DataMember = "Listado"
        Try
            gv.DataBind()
            Label1.Text = gv.PageSize * GridView1.PageIndex + GridView1.Rows.Count & " de " & ds.Tables("Listado").Rows.Count & " operaciones"
        Catch ex As Exception
            Label1.Text = "No se encontraron operaciones."
        End Try
    End Sub

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
            If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
                Response.Redirect("denegado.aspx")
            End If
            txtDesde.Text = DateTime.Now.AddDays(-7).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString
        End If
    End Sub



    Protected Function buscar() As Data.DataSet
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex

        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.Parameters.Add(New SqlParameter("@cliente", Data.SqlDbType.Char, 255))
        oComm.Parameters.Add(New SqlParameter("@tipo", Data.SqlDbType.Char, 255))
        oComm.Parameters("@tipo").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@cliente").Direction = Data.ParameterDirection.Input
        oComm.Parameters("@tipo").Value = ddlOperacion.SelectedValue  'Mid(ddlOperacion.Text, 1, 1)
        Dim lbl As Label = Master.FindControl("lblUser")
        oComm.Parameters("@cliente").Value = lbl.Text
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        If chkLiq.Checked Then
            oComm.CommandText = "af_listadoEspecialLiq"
        Else
            oComm.CommandText = "af_listadoEspecial"
        End If        
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

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        bindGrilla(GridView1)
    End Sub

    

  

    Protected Sub ibBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click       
        If validarfechas() = False Then
            GridView1.DataSource = Nothing
            GridView1.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        Else
            Label1.Text = ""
            Me.GridView1.PageIndex = 0
            bindGrilla(Me.GridView1)
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
            grilla = GridView1
            grilla.EnableViewState = False
            grilla.AllowPaging = False
            bindGrilla(grilla)
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
                For Each dc As DataControlField In GridView1.Columns
                    If Not Trim(dc.HeaderText) = "" Then
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

    Protected Sub ibCsv_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibCsv.Click
        If validarfechas() = False Then
            Response.Write("<script language='javascript' type='text/javascript'>")
            Response.Write("alert('Error en las fechas ingresadas');")
            Response.Write("</script>")
            'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "alert('Error en las fechas ingresadas');", True)
        Else
            Dim sbr As New StringBuilder
            Dim targetEncoding As Encoding
            Dim ds As Data.DataSet = buscar()


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
            Response.End()
            Response.Flush()
        End If
    End Sub

    Protected Sub ddlSizeGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSizeGrid.SelectedIndexChanged
        GridView1.PageSize = ddlSizeGrid.SelectedValue
        If validarfechas() = False Then
            GridView1.DataSource = Nothing
            GridView1.DataBind()
            Label1.Text = "Error en las fechas ingresadas."
        Else
            Label1.Text = ""
            Me.GridView1.PageIndex = 0
            bindGrilla(Me.GridView1)
        End If
    End Sub
End Class
