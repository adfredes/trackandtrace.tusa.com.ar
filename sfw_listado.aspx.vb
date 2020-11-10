Imports System.Data
Imports System.Data.SqlClient
Partial Class sfw_listado
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Me.GridView1.PageIndex = 0
        binddata()
    End Sub

    Sub binddata()
        GridView1.DataSource = getdata()
        GridView1.DataBind()
    End Sub

    Function getdata() As Data.DataTable
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lparam As New List(Of SqlParameter)
        Dim param As SqlParameter
        Dim sp As String
        If Not Trim(txtReference.Text) = "" Then
            sp = "Softway_GetByReference"
            param = New SqlParameter("@referencecode", SqlDbType.NVarChar, 50)
            param.Value = "%" & Trim(txtReference.Text).Replace("/", "-") & "%"
            lparam.Add(param)

            param = New SqlParameter("@cli_cuit", SqlDbType.NVarChar, 50)
            Dim lbl As Label = Master.FindControl("lblUser")
            param.Value = Trim(lbl.Text)
            lparam.Add(param)
        Else
            sp = "Softway_GetByAll"
            param = New SqlParameter("@cli_cuit", SqlDbType.NVarChar, 50)
            Dim lbl As Label = Master.FindControl("lblUser")
            param.Value = Trim(lbl.Text)
            lparam.Add(param)
            If DropDownList2.SelectedValue = 0 Then
                param = New SqlParameter("@e_desde", SqlDbType.SmallDateTime)
                param.Value = CDate("01/01/1901")
                lparam.Add(param)
                param = New SqlParameter("@e_hasta", SqlDbType.SmallDateTime)
                param.Value = CDate("01/01/1901")
                lparam.Add(param)

                param = New SqlParameter("@r_desde", SqlDbType.SmallDateTime)
                If txtDesde.Text = "" Then
                    param.Value = CDate("01/01/2014 00:00:00")
                Else
                    param.Value = CDate(txtDesde.Text & " 00:00:00")
                End If
                lparam.Add(param)
                param = New SqlParameter("@r_hasta", SqlDbType.SmallDateTime)
                If txtHasta.Text = "" Then
                    param.Value = DateAndTime.Now
                Else
                    param.Value = CDate(txtHasta.Text & " 23:59:59")
                End If
                lparam.Add(param)
            Else
                param = New SqlParameter("@r_desde", SqlDbType.SmallDateTime)
                param.Value = CDate("01/01/1901")
                lparam.Add(param)
                param = New SqlParameter("@r_hasta", SqlDbType.SmallDateTime)
                param.Value = CDate("01/01/1901")
                lparam.Add(param)

                param = New SqlParameter("@e_desde", SqlDbType.SmallDateTime)
                If txtDesde.Text = "" Then
                    param.Value = CDate("01/01/2014 00:00:00")
                Else
                    param.Value = CDate(txtDesde.Text & " 00:00:00")
                End If
                lparam.Add(param)
                param = New SqlParameter("@e_hasta", SqlDbType.SmallDateTime)
                If txtHasta.Text = "" Then
                    param.Value = DateAndTime.Now
                Else
                    param.Value = CDate(txtHasta.Text & " 23:59:59")
                End If
                lparam.Add(param)

            End If

            param = New SqlParameter("@send", SqlDbType.Int)
            param.Value = ddEstado.SelectedValue
            lparam.Add(param)

        End If

        oCC.consultaSP(sp, lparam.ToArray, "softway")
        Return oCC.oDS.Tables(0)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "aparece", "function onUpdating(){var updateProgressDiv = $get('updateProgressDiv');updateProgressDiv.style.display = '';}function onUpdated() {var updateProgressDiv = $get('updateProgressDiv');updateProgressDiv.style.display = 'none';}", True)
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 1) = False Then
                Response.Redirect("denegado.aspx")
            End If
            txtDesde.Text = DateTime.Now.AddDays(-7).ToShortDateString
            txtHasta.Text = DateTime.Now.ToShortDateString
        End If
    End Sub


    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        binddata()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then            
            e.Row.Attributes("onclick") = "javascript:window.OpenModalAngular('SfwXmlModal','" & Trim(e.Row.Cells(0).Text) & "');"            
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim ds As DataTable = getdata()        
        Dim sbr As New StringBuilder
        Dim targetEncoding As Encoding
        For Each dc As Data.DataColumn In ds.Columns
            sbr.Append(dc.ColumnName & ";")
        Next
        For Each dr As Data.DataRow In ds.Rows
            sbr.AppendLine("")
            For Each dc As Data.DataColumn In ds.Columns
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
End Class
