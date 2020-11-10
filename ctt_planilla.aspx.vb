Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO
Partial Class ctt_planilla
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
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
            'Dim oCC As New clsConex
            Panel1.Visible = False
            'Panel2.Visible = False
            'If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
            '    Response.Redirect("denegado.aspx")
            'End If
            Dim Cabecera As Panel = Me.Master.FindControl("Panel4")
            Cabecera.Visible = True
            txtDesde.Text = DateTime.Now.AddDays(-30).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString
            bindDll()
            'Label1.Text = ""
            'Me.GridView1.PageIndex = 0
            'bindGrilla(Me.GridView1)
        End If
    End Sub

    Private Sub bindDll()
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

        oCC.consultaSP("getDestinaciones", , "Destinaciones")
        param1(1) = "[DESTINACION]"
        oCC.oDS.Tables("Destinaciones").Rows.Add(param1)
        ddlDestinacion.DataSource = oCC.oDS.Tables("Destinaciones")
        ddlDestinacion.DataTextField = "destinacion"
        ddlDestinacion.DataValueField = "iddestinacion"
        ddlDestinacion.SelectedValue = "0"
        ddlDestinacion.DataBind()

        oCC.consultaSP("getMediosTransportes", , "Via")
        param1(1) = "[VIA]"
        oCC.oDS.Tables("Via").Rows.Add(param1)
        ddlVia.DataSource = oCC.oDS.Tables("Via")
        ddlVia.DataTextField = "nombre"
        ddlVia.DataValueField = "idmediotransporte"
        ddlVia.SelectedValue = "0"
        ddlVia.DataBind()

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

        oCC.consultaSP("getEstadosDeclaraciones", , "estado")
        param1(1) = "[ESTADO]"
        oCC.oDS.Tables("estado").Rows.Add(param1)
        ddlEstados.DataSource = oCC.oDS.Tables("estado")
        ddlEstados.DataTextField = "nombre"
        ddlEstados.DataValueField = "estado_declaracion"
        ddlEstados.SelectedValue = "0"
        ddlEstados.DataBind()


    End Sub

    Private Sub bindGrilla(ByVal gv As GridView)
        Dim ds As Data.DataSet = buscar()
        gv.DataSource = ds
        gv.DataMember = "Listado"
        Try
            gv.DataBind()
            Label1.Text = gv.PageSize * gv.PageIndex + gv.Rows.Count & " de " & ds.Tables("Listado").Rows.Count & " operaciones"
        Catch ex As Exception
            Label1.Text = "No se encontraron operaciones."
        End Try
    End Sub

    Protected Function buscar() As Data.DataSet
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        Dim SP As String

        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
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
        param = (New SqlParameter("@destinacion", SqlDbType.Int))
        param.Value = ddlDestinacion.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@aduana", SqlDbType.Int))
        param.Value = ddlAduana.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@medio_transporte", SqlDbType.Int))
        param.Value = ddlVia.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@canal", SqlDbType.VarChar, 50))
        param.Value = ddlCanal.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@pais", SqlDbType.Int))
        param.Value = ddlProcedencia.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@estado", SqlDbType.VarChar, 30))
        param.Value = ddlEstados.SelectedValue
        lparam.Add(param)
        param = (New SqlParameter("@simi", SqlDbType.Bit))
        If chkSimi.Checked Then
            param.Value = 1
        Else
            param.Value = 0
        End If
        lparam.Add(param)

        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString


        SP = "af_BuscadorPlanilla"


        If oCC.consultaSP(SP, lparam.ToArray, "Listado") = False Then
            Response.Redirect("error-page.aspx")
            Return Nothing
        Else
            Return oCC.oDS
        End If
    End Function

    Protected Sub ibBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click
        Panel1.Visible = True

        Label1.Text = ""

        Me.GridView1.Visible = True
        Me.GridView1.PageIndex = 0
        bindGrilla(Me.GridView1)


    End Sub



    Protected Sub ibCsv_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibCsv.Click
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        Dim ds As Data.DataSet = buscar()

        'For Each dc As Data.DataColumn In ds.Tables("Listado").Columns
        '    sbr.Append(dc.ColumnName & ";")
        'Next
        Dim gv As GridView

        gv = GridView1

        For Each dc As DataControlField In gv.Columns
            If Not Trim(dc.HeaderText) = "" Then
                sbr.Append(dc.HeaderText & ";")
            End If
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
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        bindGrilla(GridView1)
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='none';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            e.Row.Attributes("onmouseover") = "javascript:setMouseOverColor(this);"
            e.Row.Attributes("onmouseout") = "javascript:setMouseOutColor(this);"
            e.Row.Attributes("onclick") = "javascript:window.open('ctt_detalle2.aspx?psp=" & Trim(e.Row.Cells(15).Text) & "','','scrollbars=1,menubar=0,resizable=1,width=650,height=500,toolbars=0');"
            'For x As Integer = 0 To e.Row.Cells.Count - 2
            '    e.Row.Cells(x).Attributes("onclick") = "javascript:window.open('ctt_detalle2.aspx?psp=" & Trim(e.Row.Cells(16).Text) & "','','scrollbars=1,menubar=0,resizable=1,width=650,height=500,toolbars=0');"
            'Next
        End If

        'ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
    End Sub

End Class
