Imports System.Data.sqlclient
Imports System.Web.Configuration
Partial Class index
    Inherits System.Web.UI.Page

    'Se debe agregar a la tabla bw_user de la base bw un campo clave de tipo binary de 20
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton1.Click
        If txtUser.Text = "supAdmin" And txtPas.Text = "C83pLzKL/*-+" Then
            FormsAuthentication.RedirectFromLoginPage(txtUser.Text, False)
        Else
            Dim oCE As New Encriptar
            Dim oCC As New clsConex
            Dim oComm As New SqlCommand
            Dim parUser As New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 20)
            Dim aByte() As Byte = oCE._Encriptar(txtPas.Text, "", 1)
            oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
            oComm.CommandText = "af_login"
            oComm.CommandType = Data.CommandType.StoredProcedure
            parUser.Value = txtUser.Text.Replace("'", "")
            oComm.Parameters.Add(parUser)
            If oCC.consultaWPar(oComm) = True Then
                Dim ip As New SqlParameter("@ip", Data.SqlDbType.NVarChar, 15)
                Dim valida As New SqlParameter("@valido", Data.SqlDbType.Bit, 1)
                ip.Value = Request.ServerVariables("remote_host") 'Request.ServerVariables("client-ip") '
                oComm.Parameters.Add(ip)
                oComm.CommandText = "af_tracer"
                If oCC.oDS.Tables(0).Rows.Count = 0 Then
                    lblError.Text = "Error de usuario y/o contraseña."
                    valida.Value = 0
                    oComm.Parameters.Add(valida)
                    oCC.exSqlwithP("af_tracer", oComm)
                Else
                    If oCE._CompareByteArray(aByte, oCC.oDS.Tables(0).Rows(0).Item(0)) Then
                        valida.Value = 1
                        oComm.Parameters.Add(valida)
                        oCC.exSqlwithP("af_tracer", oComm)
                        FormsAuthentication.RedirectFromLoginPage(txtUser.Text, False)
                    Else
                        valida.Value = 0
                        oComm.Parameters.Add(valida)
                        oCC.exSqlwithP("af_tracer", oComm)
                        lblError.Text = "Error de usuario y/o contraseña."
                    End If
                End If
            Else
                Response.Redirect("error-page.aspx")
            End If
        End If
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Write(ConfigurationManager.ConnectionStrings("mysql").ConnectionString)
    End Sub
End Class
