Imports System.Data.SqlClient
Partial Class cc_recibo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            'Dim Cabecera As Panel = Me.Master.FindControl("Panel2")
            'Cabecera.Visible = True
            Dim factura As String = ""
            Dim tipo As String = ""
            Try
                factura = Request.QueryString("pcp")
                tipo = Request.QueryString("tipo")
            Catch ex As Exception

            End Try
            If Trim(factura) <> "" Then
                R1.Text = factura
                R2.Text = factura
                Dim oCC As New clsConex
                Dim oComm As New SqlCommand
                Dim parUser As New SqlParameter("@recibo", Data.SqlDbType.Int)
                parUser.Value = factura
                oComm.CommandType = Data.CommandType.StoredProcedure
                oComm.Parameters.Add(parUser)
                '/************/
                oComm.CommandText = "af_detalleRecibo"
                '/************/
                If oCC.consultaWPar(oComm, "recibo") = False Then
                    Response.Redirect("error-page.aspx")
                End If
                If oCC.oDS.Tables("recibo").Rows.Count > 0 Then
                    Try
                        TC.Text = tipo
                    Catch ex As Exception

                    End Try
                    Try
                        FC.Text = oCC.oDS.Tables("recibo").Rows(0).Item("rop_fecha")
                    Catch ex As Exception

                    End Try
                    Try
                        DV.Text = oCC.oDS.Tables("recibo").Rows(0).Item("div_codigo")
                    Catch ex As Exception

                    End Try
                    Try
                        CL.Text = oCC.oDS.Tables("recibo").Rows(0).Item("rop_razonsocial")
                    Catch ex As Exception

                    End Try
                    Try
                        NM.Text = oCC.oDS.Tables("recibo").Rows(0).Item("rop_numero")
                    Catch ex As Exception

                    End Try
                    Try
                        SC.Text = oCC.oDS.Tables("recibo").Rows(0).Item("rop_sucursal")
                    Catch ex As Exception

                    End Try
                    Try
                        CO.Text = "$ " & oCC.oDS.Tables("recibo").Rows(0).Item("cot")
                    Catch ex As Exception

                    End Try
                    Try
                        D1.Text = oCC.oDS.Tables("recibo").Rows(0).Item("rop_concepto1")
                    Catch ex As Exception

                    End Try
                    Try
                        D2.Text = oCC.oDS.Tables("recibo").Rows(0).Item("rop_concepto2")
                    Catch ex As Exception

                    End Try

                    '/*******************/
                    oComm.CommandText = "af_detalleReciboA"
                    If oCC.consultaWPar(oComm, "aplicacion") = False Then
                        Response.Redirect("error-page.aspx")
                    End If
                    gvAplicaciones.DataSource = oCC.oDS
                    gvAplicaciones.DataMember = "aplicacion"
                    gvAplicaciones.DataBind()

                    oComm.CommandText = "af_detalleReciboV"
                    If oCC.consultaWPar(oComm, "valores") = False Then
                        Response.Redirect("error-page.aspx")
                    End If
                    gvValores.DataSource = oCC.oDS
                    gvValores.DataMember = "valores"
                    gvValores.DataBind()
                End If
            End If
        End If
    End Sub
End Class
