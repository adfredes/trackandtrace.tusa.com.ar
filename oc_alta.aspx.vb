Imports System.Data.SqlClient
Partial Class oc_alta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindcontrols()
            bindata(CInt(Request.QueryString("id")))
        End If
    End Sub

    Private Sub bindata(ByVal idoc As Integer)
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lparam As New List(Of SqlParameter)
        Dim param As SqlParameter

        param = New SqlParameter("idoc", Data.SqlDbType.Int)
        param.Value = idoc
        lparam.Add(param)

        occ.consultaSP("OrdenesCompraUDJAI_GetByidOc", lparam.ToArray, "DJAI")
        If occ.oDS.Tables.Count > 0 Then
            Me.gvDjais.DataSource = occ.oDS.Tables("DJAI")
            Me.gvDjais.DataBind()
        End If

        occ.consultaSP("OrdenesCompraUDetalle_GetByidOc", lparam.ToArray, "articulos")
        If occ.oDS.Tables.Contains("articulos") Then
            Me.gvArticulos.DataSource = occ.oDS.Tables("articulos")
            Me.gvArticulos.DataBind()
        End If

        occ.consultaSP("OrdenesCompraU_GetByidOc", lparam.ToArray, "oc")
        With occ.oDS.Tables("oc").Rows(0)
            Me.txtDjai.Text = .Item("despacho").ToString
            Me.txtObservaciones.Text = .Item("observaciones").ToString
            Me.txtOc.Text = .Item("oc").ToString
            Me.txtProblema.Text = .Item("problema").ToString
            Me.txtVenta.Text = .Item("termino_venta").ToString
            ddlAduana.SelectedValue = .Item("idaduana").ToString
            ddlIncoterm.SelectedValue = .Item("idincoterm").ToString
            ddlCriticidad.SelectedValue = .Item("criticidad").ToString
            If .Item("mes_consumirse").ToString = "" Then
                ddlMesConsumirse.SelectedValue = "0"
            Else
                ddlMesConsumirse.SelectedValue = .Item("mes_consumirse").ToString
            End If
            ddlMRP.SelectedValue = .Item("idmrp").ToString
            ddlPago.SelectedValue = .Item("pago").ToString
            ddlProveedor.SelectedValue = .Item("idProveedorU").ToString
            ddlStatus.SelectedValue = .Item("status").ToString
        End With

    End Sub





    Private Sub bindcontrols()
        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lMes As New List(Of sDDL)
        lMes.Add(New sDDL("", "0"))
        lMes.Add(New sDDL("Enero", "1"))
        lMes.Add(New sDDL("Febrero", "2"))
        lMes.Add(New sDDL("Marzo", "3"))
        lMes.Add(New sDDL("Abril", "4"))
        lMes.Add(New sDDL("Mayo", "5"))
        lMes.Add(New sDDL("Junio", "6"))
        lMes.Add(New sDDL("Julio", "7"))
        lMes.Add(New sDDL("Agosto", "8"))
        lMes.Add(New sDDL("Septiembre", "9"))
        lMes.Add(New sDDL("Octubre", "10"))
        lMes.Add(New sDDL("Noviembre", "11"))
        lMes.Add(New sDDL("Diciembre", "12"))
        bindDll(ddlMesConsumirse, lMes)

        Dim lCriticidad As New List(Of sDDL)
        With lCriticidad
            .Add(New sDDL("", ""))
            .Add(New sDDL("A", "A"))
            .Add(New sDDL("B", "B"))
            .Add(New sDDL("C", "C"))
            .Add(New sDDL("D", "D"))
            .Add(New sDDL("E", "E"))
        End With
        bindDll(ddlCriticidad, lCriticidad)

        Dim lStatus As New List(Of sDDL)
        lStatus.Add(New sDDL("No Embarcada", "No Embarcada"))
        lStatus.Add(New sDDL("En Transito", "En Transito"))
        lStatus.Add(New sDDL("Arribada", "Arribada"))
        bindDll(ddlStatus, lStatus)

        occ.consultaSP("getAduanas", , "Aduana")
        Try
            bindDll(ddlAduana, oDStosDDL(occ.oDS.Tables("Aduana"), "idaduana", "nombre"))
        Catch ex As Exception

        End Try

        occ.consultaSP("Incoterms_GetAll", , "Incoterms")
        Try
            bindDll(ddlIncoterm, oDStosDDL(occ.oDS.Tables("Incoterms"), "idIncoterm", "Incoterm"))
        Catch ex As Exception

        End Try

        occ.consultaSP("ProveedoresU_GetAll", , "Proveedores")
        Try
            bindDll(ddlProveedor, oDStosDDL(occ.oDS.Tables("Proveedores"), "idProveedor", "Proveedor"))
        Catch ex As Exception

        End Try

        occ.consultaSP("MRPS_GetAll", , "MRPS")
        Try
            bindDll(ddlMRP, oDStosDDL(occ.oDS.Tables("MRPS"), "idmrp", "MRP"))
        Catch ex As Exception

        End Try

    End Sub

    Private Function oDStosDDL(ByVal oDT As Data.DataTable, ByVal fvalue As String, ByVal ftext As String) As List(Of sDDL)
        Dim lFS As New List(Of sDDL)
        For Each dR As Data.DataRow In oDT.Rows
            lFS.Add(New sDDL(dR(ftext), dR(fvalue)))
        Next
        Return lFS
    End Function

    Private Sub bindDll(ByVal ddl As DropDownList, ByVal lDDL As List(Of sDDL))
        ddl.DataSource = lDDL
        ddl.DataTextField = "text"
        ddl.DataValueField = "value"
        ddl.DataBind()
    End Sub

   

    Protected Sub gvArticulos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvArticulos.SelectedIndexChanged

    End Sub

   

    Private Structure sDDL
        Dim _text As String
        Dim _value As String
        Sub New(ByVal dText As String, ByVal dValue As String)
            _text = dText
            _value = dValue
        End Sub
        Public ReadOnly Property text() As String
            Get
                Return _text
            End Get
        End Property

        Public ReadOnly Property value() As String
            Get
                Return _value
            End Get
        End Property
    End Structure

    Private Structure itemArticulo
        Dim __idLinea As Integer
        Dim __sap As String
        Dim __mercaderia As String
        Dim __pu As String
        Sub New(ByVal _id As Integer, ByVal _sap As String, ByVal _mercaderia As String, ByVal _pu As String)
            __idLinea = _id
            __sap = _sap
            __mercaderia = _mercaderia
            __pu = _pu
        End Sub

        Public ReadOnly Property idLinea() As Integer
            Get
                Return __idLinea
            End Get
        End Property

        Public ReadOnly Property Sap() As String
            Get
                Return __sap
            End Get
        End Property

        Public ReadOnly Property Mercaderia() As String
            Get
                Return __mercaderia
            End Get
        End Property

        Public ReadOnly Property PU() As String
            Get
                Return __pu
            End Get
        End Property

    End Structure

End Class
