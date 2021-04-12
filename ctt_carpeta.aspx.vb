Imports System.Data.SqlClient
Imports System.Globalization
Partial Class ctt_carpeta
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            binddata()
        End If
    End Sub

    Sub binddata()
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(0)
        prm(0) = New SqlParameter("@CarpetaId", Data.SqlDbType.UniqueIdentifier)
        prm(0).Value = New Guid(Request.QueryString("id"))
        occ.consultaSP("Dashboard_GetCarpeta", prm, "carpeta")

        occ.consultaSP("Dashboard_GetCarpetaCamporPersonalizados", prm, "camposPersonalizados")

        Dim dr As Data.DataRow = occ.oDS.Tables("carpeta").Rows(0)

        For Each dc As Data.DataColumn In occ.oDS.Tables(0).Columns
            Dim control As Control = FindControlRecursive(Me, dc.ColumnName.ToLower())
            If control IsNot Nothing Then
                Try
                    CType(control, Label).Text = dr.Item(dc.ColumnName)
                Catch ex As Exception

                End Try

            End If

        Next

        gvCamposPersonalizados.DataSource = occ.oDS.Tables("camposPersonalizados")
        gvCamposPersonalizados.DataBind()


    End Sub

    'Function FindAnyControl(control As Control, controlId As String) As Control
    '    Return FindControlRecursive(controlId, control)
    'End Function


    'Function FindControlRecursive(controlId As String, parent As Control) As Control
    '    For Each control As Control In parent.Controls
    '        Dim result As Control = FindControlRecursive(controlId, control)
    '        If result IsNot Nothing Then
    '            Return control
    '        End If
    '    Next
    '    Return parent.FindControl(controlId)
    'End Function

    Function FindControlRecursive(ByVal ctrl As Control, ByVal id As String) As Control
        Dim c As Control = Nothing

        If ctrl.ID = id Then
            c = ctrl
        Else
            For Each childCtrl In ctrl.Controls
                Dim resCtrl As Control = FindControlRecursive(childCtrl, id)
                If resCtrl IsNot Nothing Then c = resCtrl
            Next
        End If

        Return c
    End Function



End Class
