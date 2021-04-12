Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports System.Configuration
Imports System.Collections.Generic
Imports System.Text
Imports System
Imports Sertear


<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<System.Web.Script.Services.ScriptService()> _
Public Class wsDashboard
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetItemsDashboard() As String
        Try

            Dim json As New StringBuilder
            Dim oCc As clsConex = New clsConex(ConfigurationManager.ConnectionStrings("mySql").ConnectionString)
            Dim lparam As List(Of SqlParameter) = New List(Of SqlParameter)
            Dim param As SqlParameter = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
            param.Value = User.Identity.Name
            lparam.Add(param)
            If oCc.consultaSP("getIemsDashboard", lparam.ToArray, "Listado") AndAlso oCc.oDS.Tables.Count > 0 AndAlso oCc.oDS.Tables(0).Rows.Count > 0 Then
                Dim separador As String = ""
                json.Append("[")
                For Each dr As DataRow In oCc.oDS.Tables(0).Rows
                    json.Append(separador)
                    Dim item As New ItemsDashboard(dr("UnidadNEgocio").ToString, dr("Dias").ToString(), dr("Cantidad").ToString, dr("Arribo").ToString)
                    json.Append("{" & """" & "UnidadNegocio" & """" & ": " & """" & item.UnidadNegocio & """" & ",")
                    json.Append("""" & "Dias" & """" & ": " & item.Dias & ",")
                    json.Append("""" & "FechaArribo" & """" & ": " & """" & item.FechaArribo & """" & ",")
                    json.Append("""" & "Cantidad" & """" & ": " & item.Cantidad & "}")
                    separador = ","
                Next
                json.Append("]")
            End If
            Return json.ToString()
        Catch ex As Exception
            Return "{" & """" & "Error" & """" & ":" & """" & ex.ToString & """" & "}"
        End Try
    End Function


    <WebMethod()> _
    Public Function GetItemsDetailsDashboard() As String
        Dim json As New StringBuilder
        Dim oCc As clsConex = New clsConex(ConfigurationManager.ConnectionStrings("mySql").ConnectionString)
        Dim lparam As List(Of SqlParameter) = New List(Of SqlParameter)
        Dim param As SqlParameter = New SqlParameter("@cliente", Data.SqlDbType.Char, 255)
        param.Value = User.Identity.Name
        lparam.Add(param)
        If oCc.consultaSP("getIemsDetailsDashboard", lparam.ToArray, "Listado") AndAlso oCc.oDS.Tables.Count > 0 AndAlso oCc.oDS.Tables(0).Rows.Count > 0 Then
            Dim separador As String = ""
            json.Append("[")
            For Each dr As DataRow In oCc.oDS.Tables(0).Rows
                Try
                    json.Append(separador)
                    Dim item As New ItemDetailDashboard(dr("UnidadNEgocio").ToString().Trim(), dr("Dias").ToString().Trim(), dr("Identificador_Propio").ToString().Trim(), dr("despacho").ToString().Trim(), dr("estado").ToString().Trim(), dr("referencia_cliente").ToString().Trim(), dr("motivo").ToString().Trim(), dr("via").ToString().Trim(), dr("arribo").ToString().Trim(), dr("CarpetaId").ToString().Trim())
                    json.Append("{" & """" & "UnidadNegocio" & """" & ": " & """" & item.UnidadNegocio & """" & ",")
                    json.Append("""" & "Dias" & """" & ": " & item.Dias & ",")
                    json.Append("""" & "Identificador" & """" & ": " & """" & item.Identificador & """" & ",")
                    json.Append("""" & "Despacho" & """" & ": " & """" & item.Despacho & """" & ",")
                    json.Append("""" & "Referencia" & """" & ": " & """" & item.Referencia & """" & ",")
                    json.Append("""" & "Motivo" & """" & ": " & """" & item.Motivo & """" & ",")
                    json.Append("""" & "Via" & """" & ": " & """" & item.Via & """" & ",")
                    json.Append("""" & "Id" & """" & ": " & """" & item.Id & """" & ",")
                    json.Append("""" & "FechaArribo" & """" & ": " & """" & item.FechaArribo & """" & ",")
                    json.Append("""" & "Estado" & """" & ": " & """" & item.Estado & """" & "}")
                    separador = ","
                Catch ex As Exception

                End Try
                
            Next
            json.Append("]")
        End If
        Return json.ToString()
    End Function

    Private Function GetFileClass(ByVal descripcion As String, ByVal url As String) As String
        Dim json As New StringBuilder
        If (Not url Is Nothing AndAlso url <> String.Empty AndAlso url.Length > 0) Then
            json.Append("{")
            json.Append("""")
            json.Append("descripcion")
            json.Append("""")
            json.Append(":")
            json.Append("""")
            json.Append(descripcion)
            json.Append("""")
            json.Append(",")
            json.Append("""")
            json.Append("url")
            json.Append("""")
            json.Append(":")
            json.Append("""")
            json.Append(url)
            json.Append("""")
            json.Append("}")
        Else
            json.Append("")
        End If

        Return json.ToString()
    End Function

    'af_FacturasDespacho
    <WebMethod()> Public Function GetFacturasTyT(ByVal despacho As String) As String
        Dim json As New StringBuilder

        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(1)
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 255)
        prm(0).Value = despacho

        prm(1) = New SqlParameter("@cliente", Data.SqlDbType.NVarChar, 255)
        prm(1).Value = User.Identity.Name

        json.Append("[")

        If occ.consultaSP("af_FacturasDespacho", prm, "despa_Archivos") AndAlso occ.oDS.Tables("despa_Archivos").Rows.Count > 0 Then
            For Each dr As DataRow In occ.oDS.Tables("despa_Archivos").Rows
                Dim url As String = dr("url").ToString
                Dim descripcion As String = dr("descripcion").ToString '& " (" & dr("alias").ToString & ")"                
                If json.ToString <> "[" Then
                    json.Append(",")
                End If
                json.Append(GetFileClass(descripcion, url))
            Next

        End If

        json.Append("]")

        Return json.ToString
    End Function

    <WebMethod()> Public Function GetArchivosTyT(ByVal despacho As String) As String
        Dim json As New StringBuilder        

        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(0)
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16)
        prm(0).Value = despacho

        json.Append("[")

        If occ.consultaSP("af_GetArchivos", prm, "despa_Archivos") AndAlso occ.oDS.Tables("despa_Archivos").Rows.Count > 0 Then
            For Each dr As DataRow In occ.oDS.Tables("despa_Archivos").Rows
                Dim url As String = "http://trackandtrace.tusa.com.ar/tyt_files/" & dr("cuit").ToString & "/" & dr("archivo").ToString
                Dim descripcion As String = dr("descripcion").ToString '& " (" & dr("alias").ToString & ")"
                If dr("descripcion").ToString = "Despacho" Then
                Else
                    If json.ToString <> "[" Then
                        json.Append(",")
                    End If
                    json.Append(GetFileClass(descripcion, url))
                End If
            Next

        End If

        json.Append("]")

        Return json.ToString
    End Function


    <WebMethod()> Public Function GetArchivosSertear(ByVal despacho As String) As String
        Dim json As New StringBuilder
        Dim cliente As New wsSRD
        Dim auth As New AuthHeader
        'Dim proxy As New System.Net.WebProxy("192.168.0.201", 8080)
        auth.UserName = "20082080903"
        auth.Password = "PANASONIC123"
        'cliente.Url = "https://srd.lakaut.com.ar/srd/ws/wsrd.asmx?WSDL"
        cliente.AuthHeaderValue = auth


        Dim lDespacho() As Sertear.Document = Nothing

        Dim occ As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim prm() As SqlParameter
        ReDim prm(0)
        prm(0) = New SqlParameter("@despacho", Data.SqlDbType.NVarChar, 16)
        prm(0).Value = despacho

        json.Append("[")

        Try

            lDespacho = cliente.getDespachos("", "", despacho, "", "", "", "", "", "", "", "", "", "", "")

        Catch ex As Exception

        End Try

        If Not lDespacho Is Nothing Then
            For Each d As Sertear.Document In lDespacho


                If json.ToString <> "[" And d.UrlDespacho <> "" Then
                    json.Append(",")
                End If
                json.Append(GetFileClass("Despacho Digitalizado Completo", d.UrlDespacho))

                If json.ToString <> "[" And d.UrlFamilia1 <> "" Then
                    json.Append(",")
                End If
                json.Append(GetFileClass("OM- Declaración y Sobre Contenedor", d.UrlFamilia1))
                If json.ToString <> "[" And d.UrlFamilia2 <> "" Then
                    json.Append(",")
                End If
                json.Append(GetFileClass("FACTURA COMERCIAL / FORMULARIO DE VALOR", d.UrlFamilia2))
                If json.ToString <> "[" And d.UrlFamilia3 <> "" Then
                    json.Append(",")
                End If
                json.Append(GetFileClass("CONOCIMIENTO DE EMBARQUE", d.UrlFamilia3))
                If json.ToString <> "[" And d.UrlFamilia5 <> "" Then
                    json.Append(",")
                End If
                json.Append(GetFileClass("3ros. ORGANISMOS y demás docs + OTROS", d.UrlFamilia5))
            Next
        End If

        json.Append("]")

        Return json.ToString
    End Function


End Class

Public Class ItemsDashboard
    Sub New(ByVal un As String, ByVal d As String, ByVal c As String, ByVal a As String)
        _unidadNegocio = un
        _dias = d
        _cantidad = c
        _fechaArribo = a
    End Sub

    

    Private _fechaArribo As String
    Public Property FechaArribo() As String
        Get
            Return _fechaArribo
        End Get
        Set(ByVal value As String)
            _fechaArribo = value
        End Set
    End Property

    Private _unidadNegocio As String
    Public Property UnidadNegocio() As String
        Get
            Return _unidadNegocio
        End Get
        Set(ByVal value As String)
            _unidadNegocio = value
        End Set
    End Property

    Private _dias As Integer
    Public Property Dias() As String
        Get
            Return _dias
        End Get
        Set(ByVal value As String)
            _dias = value
        End Set
    End Property

    Private _cantidad As Integer
    Public Property Cantidad() As String
        Get
            Return _cantidad
        End Get
        Set(ByVal value As String)
            _cantidad = value
        End Set
    End Property
End Class


Public Class ItemDetailDashboard
    Sub New(ByVal un As String, ByVal d As String, ByVal i As String, ByVal dp As String, ByVal e As String, ByVal r As String, ByVal m As String, ByVal v As String, fa As String, id As String)
        _unidadNegocio = un
        _dias = d
        _identificador = i
        _despacho = dp
        _estado = e
        _referencia = r
        _motivo = m
        _via = v
        _fechaArribo = fa
        _id = id
    End Sub

    Private _id As String

    Public Property Id() As String
        Get
            Return _id
        End Get
        Set(value As String)
            _id = value
        End Set
    End Property

    Private _fechaArribo As String
    Public Property FechaArribo() As String
        Get
            Return _fechaArribo
        End Get
        Set(ByVal value As String)
            _fechaArribo = value
        End Set
    End Property

    Private _via As String
    Public Property Via() As String
        Get
            Return _via
        End Get
        Set(ByVal value As String)

        End Set
    End Property

    Private _referencia As String
    Public Property Referencia() As String
        Get
            Return _referencia
        End Get
        Set(ByVal value As String)
            _referencia = value
        End Set
    End Property

    Private _motivo As String
    Public Property Motivo() As String
        Get
            Return _motivo
        End Get
        Set(ByVal value As String)
            _motivo = value
        End Set
    End Property

    Private _despacho As String
    Public Property Despacho() As String
        Get
            Return _despacho
        End Get
        Set(ByVal value As String)
            _despacho = value
        End Set
    End Property

    Private _estado As String
    Public Property Estado() As String
        Get
            Return _estado
        End Get
        Set(ByVal value As String)
            _estado = value
        End Set
    End Property

    Private _unidadNegocio As String
    Public Property UnidadNegocio() As String
        Get
            Return _unidadNegocio
        End Get
        Set(ByVal value As String)
            _unidadNegocio = value
        End Set
    End Property

    Private _dias As Integer
    Public Property Dias() As String
        Get
            Return _dias
        End Get
        Set(ByVal value As String)
            _dias = value
        End Set
    End Property

    Private _identificador As String
    Public Property Identificador() As String
        Get
            Return _identificador
        End Get
        Set(ByVal value As String)
            _identificador = value
        End Set
    End Property
End Class