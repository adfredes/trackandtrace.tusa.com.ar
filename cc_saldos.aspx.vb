Imports System.Data.SqlClient
Partial Class cc_saldos
    Inherits System.Web.UI.Page

    Protected Sub cargar()
        Dim oComm As New SqlCommand
        Dim oCC As New clsConex
        oCC.conexion = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
        oComm.Parameters.Add(New SqlParameter("@usuario", Data.SqlDbType.VarChar, 255))
        oComm.Parameters("@usuario").Value = User.Identity.Name        
        oComm.Parameters("@usuario").Direction = Data.ParameterDirection.Input
        oComm.CommandText = "af_estCC"
        oComm.CommandType = Data.CommandType.StoredProcedure
        If oCC.consultaWPar(oComm, "result") = False Then
            'Response.Redirect("error-page.aspx")
        Else
            D1.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("debe")
            C1.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("haber")
            S1.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("saldo")
            D2.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("adebe")
            C2.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("ahaber")
            S2.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("asaldo")
            D3.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("fdebe")
            C3.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("fhaber")
            S3.Text = "$ " & oCC.oDS.Tables("result").DefaultView.Item(0).Item("fsaldo")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim oCC As New clsConex
            If oCC.validaMenu(User.Identity.Name.ToString, 3) = False Then
                Response.Redirect("denegado.aspx")
            End If
            lblFecha.Text = Format(Now(), "Short Date")            
            cargar()
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        cargar()
    End Sub
End Class
