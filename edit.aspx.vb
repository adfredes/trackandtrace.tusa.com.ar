Imports System.Data.SqlClient
Partial Class edit
    Inherits System.Web.UI.Page

    Protected Function fnc_clave() As SqlParameter
        Dim opp As New Encriptar
        Dim abclave() As Byte
        Dim prmClave As SqlParameter
        abclave = opp._Encriptar(txtClave.Text, "", 1)
        prmClave = New SqlParameter("@clave", Data.SqlDbType.Binary, 20)
        prmClave.Value = abclave
        Return prmClave
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 0) = False Then
                If oCC.validaMenu(User.Identity.Name.ToString, 4) = False Then
                    Response.Redirect("denegado.aspx")
                Else                    
                    ddlEmpresa.Enabled = False
                End If

            End If

            oCC.consulta("af_listarclientes", "clientes")
            ddlEmpresa.DataSource = oCC.oDS
            ddlEmpresa.DataMember = "clientes"
            ddlEmpresa.DataTextField = "cli_descripcion"
            ddlEmpresa.DataValueField = "cli_codigo"


            

            If Request.QueryString("pcp") <> "" Then
                Dim oComm As New SqlCommand
                txtNombre.Text = Request.QueryString("pcp").ToString
                txtNombre.Enabled = False
                oComm.Parameters.Add(New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))
                oComm.Parameters("@nameid").Value = txtNombre.Text
                oComm.CommandText = "af_listadoUsuarioDet"
                oComm.CommandType = Data.CommandType.StoredProcedure
                oCC.consultaWPar(oComm, "usuario")
                txtMail.Text = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("email").ToString
                tyt.Checked = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("tyt").ToString
                cc.Checked = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("cc").ToString
                ff.Checked = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("ff").ToString
                di.Checked = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("di").ToString
                admin.Checked = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("admin").ToString
                activo.Checked = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("activo").ToString

                ddlEmpresa.SelectedValue = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("enterprise").ToString
                chkClave.Visible = True
            Else
                Dim oComm As New SqlCommand                
                oComm.Parameters.Add(New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))
                oComm.Parameters("@nameid").Value = User.Identity.Name
                oComm.CommandText = "af_listadoUsuarioDet"
                oComm.CommandType = Data.CommandType.StoredProcedure
                oCC.consultaWPar(oComm, "usuario")
                ddlEmpresa.SelectedValue = oCC.oDS.Tables("usuario").DefaultView.Item(0).Item("enterprise").ToString                
            End If
            Try
                ddlEmpresa.DataBind()

            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        Dim result As String

        txtNombre.Text = Trim(txtNombre.Text.Replace("'", ""))
        txtMail.Text = Trim(txtMail.Text.Replace("'", ""))
        txtClave.Text = Trim(txtClave.Text.Replace("'", ""))

        oComm.Parameters.Add(New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@enterprise", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@active", Data.SqlDbType.Bit, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@email", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))

        oComm.Parameters.Add(New SqlParameter("@admin", Data.SqlDbType.Bit, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@tyt", Data.SqlDbType.Bit, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@ff", Data.SqlDbType.Bit, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@cc", Data.SqlDbType.Bit, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@di", Data.SqlDbType.Bit, Data.ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@change", Data.SqlDbType.Bit, Data.ParameterDirection.Input))

        oComm.Parameters.Add(New SqlParameter("@user_edoc", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))

        oComm.Parameters("@nameid").Value = txtNombre.Text
        oComm.Parameters("@enterprise").Value = ddlEmpresa.SelectedValue.ToString
        oComm.Parameters("@active").Value = CInt(activo.Checked)
        oComm.Parameters("@email").Value = txtMail.Text

        oComm.Parameters("@admin").Value = CInt(admin.Checked)
        oComm.Parameters("@tyt").Value = CInt(tyt.Checked)
        oComm.Parameters("@ff").Value = CInt(ff.Checked)
        oComm.Parameters("@cc").Value = CInt(cc.Checked)
        oComm.Parameters("@di").Value = CInt(di.Checked)
        oComm.Parameters("@change").Value = CInt(chkClave.Checked)

        oComm.Parameters("@user_edoc").Value = DBNull.Value
        
        oComm.CommandType = Data.CommandType.StoredProcedure

        If txtNombre.Enabled = False Then

            If chkClave.Checked And Len(txtClave.Text) < 6 Then

                lblError.Text = "La contraseña debe tener al menos 6 caracteres."
                    lblError.Visible = True
                    Exit Sub

            End If

            oComm.Parameters.Add(fnc_clave)
            oComm.CommandText = "af_modificarusuario"
            result = oCC.exSqlwithP("af_modificarusuario", oComm)

            Response.Redirect("admin.aspx")
        Else
            If Len(txtClave.Text) < 6 Then
                lblError.Text = "La contraseña debe tener al menos 6 caracteres."
                lblError.Visible = True
                Exit Sub
            End If
            oComm.Parameters.Add(New SqlParameter("@resu", Data.SqlDbType.Bit, 1))
            oComm.Parameters("@resu").Direction = Data.ParameterDirection.Output
            oComm.Parameters.Add(fnc_clave)
            oComm.CommandText = "af_ingresarusuario"
            oCC.exSqlwithP("af_ingresarusuario", oComm)
            'oCC.exSqlEscWPar(oComm)
            If oComm.Parameters("@resu").Value = False Then
                Response.Redirect("admin.aspx")
            Else
                lblError.Text = "El usuario ya se encuentra ingresado."
                lblError.Visible = True
            End If
            'oComm.CommandText = "update bw_user set clave=@clave where nameid like '" & txtUser.Text & "'"
            'oCC.exSqlwithP("update bw_user set clave=@clave where nameid like '" & txtUser.Text & "'", oComm)           
        End If
    End Sub
End Class
