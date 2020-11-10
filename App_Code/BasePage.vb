Imports Microsoft.VisualBasic

Public Class BasePage
    Inherits System.Web.UI.Page


    Protected Overrides Sub OnLoad(ByVal e As EventArgs)        
        MyBase.OnLoad(e)
    End Sub

    Protected Function verificar_permisos() As Boolean
        Dim oCC As New clsConex
        Return oCC.validaMenu(User.Identity.Name.ToString, 3)
        Response.Redirect("denegado.aspx")        
    End Function

End Class
