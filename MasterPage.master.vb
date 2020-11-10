Imports System.Web.Security
Imports System.Web.SessionState
Imports System.Data.SqlClient
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            Dim oComm As New SqlCommand
            Dim parUser As New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 20)
            oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
            oComm.CommandType = Data.CommandType.StoredProcedure
            oComm.CommandText = "af_cliente"
            parUser.Value = Request.ServerVariables("AUTH_USER")
            oComm.Parameters.Add(parUser)
            lblUser.Text = oCC.exSqlEscWPar(oComm)
            oComm.Parameters.Clear()
            'oComm.CommandText = "af_ultimacopia"
            'lblAct.Text = oCC.exSqlEscWPar(oComm)
            ''Response.Write(Request.ServerVariables("AUTH_USER"))
            'If Trim(lblUser.Text) = "" Then
            '    Response.Redirect("msg_actualizacion.htm")
            'End If
            If oCC.validaMenu(Request.ServerVariables("AUTH_USER"), 0) = True Then
                ddlEmpresaChange.Visible = True
                ddlEmpresaChange.Enabled = True
                lblUser.Visible = False
                oCC.consulta("af_listarclientes", "clientes")
                ddlEmpresaChange.DataSource = oCC.oDS
                ddlEmpresaChange.DataMember = "clientes"
                ddlEmpresaChange.DataTextField = "cli_descripcion"
                ddlEmpresaChange.DataValueField = "cli_codigo"                
                ddlEmpresaChange.DataBind()
                ddlEmpresaChange.SelectedItem.Text = lblUser.Text

            Else
                ddlEmpresaChange.Visible = False
                ddlEmpresaChange.Enabled = False
                lblUser.Visible = True
            End If
        End If
        'lblAct.Text = Date.Today
        'ctusu.Text = Application("visitantes")
    End Sub

    Protected Sub ddlEmpresaChange_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlEmpresaChange.SelectedIndexChanged
        Dim oCC As New clsConex
        Dim oComm As New SqlCommand
        Dim parUser As New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 20)
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString

        
        If oCC.validaMenu(Request.ServerVariables("AUTH_USER"), 0) = True Then
            Dim sql As String
            sql = "update bw_user set enterprise ='" & ddlEmpresaChange.SelectedValue & "' where nameid='" & Request.ServerVariables("AUTH_USER") & "'"
            oCC.exSql(sql)
            lblUser.Text = ddlEmpresaChange.SelectedItem.Text
        End If
    End Sub
End Class

