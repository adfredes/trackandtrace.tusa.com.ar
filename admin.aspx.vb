Imports System.Data.SqlClient
Partial Class admin
    Inherits System.Web.UI.Page
    Sub cargar()

        Dim oCC As New clsConex
        Dim oComm As New SqlCommand
        oComm.CommandType = Data.CommandType.StoredProcedure

        If oCC.validaMenu(User.Identity.Name.ToString, 0) = False Then            

            If oCC.validaMenu(User.Identity.Name.ToString, 4) = False Then
                Response.Redirect("denegado.aspx")
            Else
                pnlBuscador.Visible = False

                oComm.Parameters.Add(New SqlParameter("@cliente", Data.SqlDbType.Char, 255))

                oComm.Parameters("@cliente").Value = User.Identity.Name
                oComm.CommandText = "af_listadoUsuariosCliente"
                If oCC.consultaWPar(oComm, "Listado") = True Then
                    gvListado.DataSource = oCC.oDS
                    gvListado.DataMember = "Listado"
                    gvListado.DataBind()
                Else
                    Response.Redirect("error-page.aspx")
                End If
            End If
        Else

            pnlBuscador.Visible = True

            oComm.Parameters.Add(New SqlParameter("@usuario", Data.SqlDbType.VarChar, 255))
            oComm.Parameters("@usuario").Value = "%" & txtUsuario.Text.Trim & "%"

            oComm.Parameters.Add(New SqlParameter("@empresa", Data.SqlDbType.VarChar, 255))
            oComm.Parameters("@empresa").Value = "%" & txtEmpresa.Text.Trim & "%"

            oComm.CommandText = "af_ListadoUsuarios"

            If oCC.consultaWPar(oComm, "Listado") = True Then
                gvListado.DataSource = oCC.oDS
                gvListado.DataMember = "Listado"
                gvListado.DataBind()
            Else
                Response.Redirect("error-page.aspx")
            End If
        End If


        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            cargar()
        End If
    End Sub

    Protected Sub gvListado_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvListado.PageIndexChanging
        gvListado.PageIndex = e.NewPageIndex
        cargar()
    End Sub

    Protected Sub gvListado_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvListado.RowDeleted
        cargar()
    End Sub

    Protected Sub gvListado_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvListado.RowDeleting
        'If MsgBox("¿Seguro que desea eliminar el registro?", MsgBoxStyle.YesNo, "") = MsgBoxResult.Yes Then            
        Dim occ As New clsConex
        Dim oComm As New SqlCommand
        oComm.CommandText = "af_eliminarUsuario"
        oComm.CommandType = Data.CommandType.StoredProcedure
        oComm.Parameters.Add(New SqlParameter("@nameid", Data.SqlDbType.NVarChar, 255, Data.ParameterDirection.Input))
        oComm.Parameters("@nameid").Value = gvListado.Rows(e.RowIndex).Cells(0).Text
        occ.exSqlwithP("af_eliminarUsuario", oComm)
        cargar()
        'Else
        'e.Cancel = True
        'End If
    End Sub

    Protected Sub gvListado_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvListado.RowEditing
        Response.Redirect("edit.aspx?pcp=" & gvListado.Rows(e.NewEditIndex).Cells(0).Text)
    End Sub


    Protected Sub ibBuscar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ibBuscar.Click
        gvListado.PageIndex = 0
        cargar()

    End Sub
End Class
