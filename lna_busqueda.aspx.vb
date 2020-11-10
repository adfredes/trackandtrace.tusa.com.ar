Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class lna_busqueda
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim jScript As New StringBuilder
        jScript.Append("function enable_fecha(){")
        jScript.Append("if (document.getElementById('" & ddlFechas.ClientID & "').selectedIndex == 0){")
        jScript.Append("document.getElementById('" & txtDesde.ClientID & "').disabled=true;")
        jScript.Append("document.getElementById('" & txtHasta.ClientID & "').disabled=true;")
        jScript.Append("}else{")
        jScript.Append("document.getElementById('" & txtDesde.ClientID & "').disabled=false;")
        jScript.Append("document.getElementById('" & txtHasta.ClientID & "').disabled=false;")
        'jScript.Append("txt.disabled = true;")        
        'jScript.Append("document.getElementById('txtDesde').disabled=true;")
        'jScript.Append("document.getElementById('txtHasta').disabled=true;")
        jScript.Append("}}")

        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "enable_fecha", jScript.ToString, True)
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
                Response.Redirect("denegado.aspx")
            End If
            bindcontrol()
            txtDesde.Text = DateTime.Now.AddDays(-90).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString            
        End If
    End Sub

    Sub bindcontrol()
        Dim oCC As New clsConex
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        oCC.consultaSP("getAduanas", , "Aduanas")
        Dim param1() As Object = {"0", "[ADUANA]"}
        oCC.oDS.Tables("Aduanas").Rows.Add(param1)
        ddlAduana.DataSource = oCC.oDS.Tables("Aduanas")
        ddlAduana.DataTextField = "nombre"
        ddlAduana.DataValueField = "idaduana"
        ddlAduana.SelectedValue = "0"
        ddlAduana.DataBind()

        oCC.consultaSP("getEstadosLNA", , "estado")
        param1(1) = "[ESTADO LNA]"
        oCC.oDS.Tables("estado").Rows.Add(param1)
        ddlEstados.DataSource = oCC.oDS.Tables("estado")
        ddlEstados.DataTextField = "nombre"
        ddlEstados.DataValueField = "estado_declaracion"
        ddlEstados.SelectedValue = "0"
        ddlEstados.DataBind()


    End Sub




    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        binddata()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If (e.Row.RowType = DataControlRowType.DataRow) Then            
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('SimiModal','" & Trim(e.Row.Cells(2).Text) & "');"            
        End If


    End Sub

    Sub binddata()
        Dim ds As DataSet = getData()
        GridView1.DataSource = ds
        GridView1.DataMember = "Listado"
        Try
            GridView1.DataBind()
            Label1.Text = GridView1.PageSize * GridView1.PageIndex + GridView1.Rows.Count & " de " & ds.Tables("Listado").Rows.Count & " operaciones"
        Catch ex As Exception
            Label1.Text = "0 de 0 operaciones"
        End Try
    End Sub

    Protected Sub ibCsv_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibCsv.Click

        Dim ds As DataSet = getData()

        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
            sbr.Append(dc.ColumnName & ";")
        Next
        For Each dr As Data.DataRow In ds.Tables("Listado").Rows
            sbr.AppendLine("")
            For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
                'If dc.ColumnName = "salido" Or dc.ColumnName = "autorizado" Or dc.ColumnName = "anulada" Or dc.ColumnName = "cancelado_vencido" Or dc.ColumnName = "estado_declaracion" Or dc.ColumnName = "descripcion_estado_decla" Then
                '    sbr.Append(";")
                'Else
                sbr.Append(dr.Item(dc.ColumnName) & ";")
                'End If
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

    Function getData() As DataSet
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex


        oComm.CommandType = Data.CommandType.StoredProcedure
        Dim lparam As New List(Of SqlParameter)
        Dim param As SqlParameter
        param = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        Dim lbl As Label = Master.FindControl("lblUser")
        param.Value = lbl.Text
        lparam.Add(param)
        param = (New SqlParameter("@tnumero", SqlDbType.Char, 255))
        param.Value = ddlNumero.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@numero", SqlDbType.Char, 50))
        param.Value = Trim(txtNumero.Text)
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
        param = (New SqlParameter("@aduana", SqlDbType.Int))
        param.Value = ddlAduana.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@estado", SqlDbType.VarChar, 30))
        param.Value = ddlEstados.SelectedValue
        lparam.Add(param)

        param = (New SqlParameter("@canceladas", SqlDbType.Bit))
        param.Value = chkCanceladas.Checked
        lparam.Add(param)

        param = (New SqlParameter("@anuladas", SqlDbType.Bit))
        param.Value = chkAnuladas.Checked
        lparam.Add(param)


        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString


        If oCC.consultaSP("af_BuscadorLNA", lparam.ToArray, "Listado") = False Then
            Response.Redirect("error-page.aspx")
            Return Nothing
        Else
            Return oCC.oDS
        End If
        Return oCC.oDS
    End Function

    Protected Sub ibBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click
        Me.GridView1.PageIndex = 0
        Panel2.Visible = True
        binddata()
    End Sub

    Protected Sub ibExcel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibExcel.Click
        Dim sb As StringBuilder = New StringBuilder()
        Dim sw As StringWriter = New StringWriter(sb)
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim pagina As Page = New Page
        Dim grilla As New GridView
        GridView1.Columns(GridView1.Columns.Count - 1).Visible = False
        grilla = GridView1
        grilla.EnableViewState = False
        grilla.AllowPaging = False
        grilla.DataSource = getData()
        grilla.DataMember = "Listado"
        Try
            grilla.DataBind()
        Catch ex As Exception

        End Try
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
        GridView1.Columns(GridView1.Columns.Count - 1).Visible = True
    End Sub

    Protected Sub ddlSizeGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSizeGrid.SelectedIndexChanged
        GridView1.PageSize = ddlSizeGrid.SelectedValue
        Me.GridView1.PageIndex = 0
        Panel2.Visible = True
        binddata()
    End Sub

End Class
