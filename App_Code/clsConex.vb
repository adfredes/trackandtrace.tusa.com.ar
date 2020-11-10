Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System.Web.Configuration
Imports errLog

Public Class clsConex
    Public oDS As DataSet
    Dim mySql As String

    Sub New()
        oDS = New DataSet
        mySql = ConfigurationManager.ConnectionStrings("mySql").ConnectionString
    End Sub
    Sub New(ByVal cadena As String)
        oDS = New DataSet
        mySql = cadena
    End Sub

    Public WriteOnly Property conexion() As String
        Set(ByVal value As String)
            mySql = value
        End Set
    End Property


    'Funcion de consulta con parametro
    Function consultaWPar(ByVal oComm As SqlCommand, Optional ByVal tabla As String = "") As Boolean
        Dim oConn As New SqlConnection        
        Dim oDA As New SqlDataAdapter
        oDS = New DataSet
        oConn.ConnectionString = mySql
        oComm.Connection = oConn
        oComm.CommandTimeout = 600000000
        oDA.SelectCommand = oComm
        Try
            If tabla <> "" Then
                oDA.Fill(oDS, tabla)
            Else
                oDA.Fill(oDS)
            End If
        Catch ex As Exception
            LogException(ex)
            Return False
        End Try
        Return True
    End Function

    

    'Función de consulta escalar
    Function exSqlEscWPar(ByVal oComm As SqlCommand) As String
        Dim oConn As New SqlConnection        
        Dim result As String = ""
        oConn.ConnectionString = mySql
        oComm.Connection = oConn
        oComm.CommandTimeout = 600000000
        Try
            oConn.Open()
            result = oComm.ExecuteScalar
        Catch ex As Exception
            LogException(ex)
        Finally
            Try
                oConn.Close()
            Catch ex As Exception

            End Try
        End Try
        Return result
    End Function

    'Función de actualización con parametros
    Function exSqlwithP(ByVal sql As String, ByVal oComm As SqlCommand) As Boolean
        Dim oConn As New SqlConnection
        oConn.ConnectionString = mySql
        oComm.Connection = oConn
        oComm.CommandText = sql
        oComm.CommandTimeout = 600000000
        Try
            oConn.Open()
            oComm.ExecuteNonQuery()
            Dim p As String = CStr(oComm.Parameters("@resu").Value)
            oConn.Close()
            Return True
        Catch ex As Exception
            LogException(ex)
            Try
                oConn.Close()
            Catch ex1 As Exception

            End Try
            Return False
        End Try
    End Function

    'Función para validar las fechas ingresadas
    Function validafecha(ByVal sano As String, ByVal smes As String, ByVal sdia As String) As Boolean
        Dim mes As Integer
        Dim dia As Integer
        Dim ano As Integer
        Dim vfecha As Boolean
        ano = CInt(sano)
        mes = CInt(smes)
        dia = CInt(sdia)
        If mes > 12 Then
            vfecha = False
            Exit Function
        End If
        Select Case mes
            Case 1, 3, 5, 7, 8, 10, 12
                If dia > 31 Then
                    vfecha = False
                Else
                    vfecha = True
                End If
            Case 4, 6, 9, 11
                If dia > 30 Then
                    vfecha = False
                Else
                    vfecha = True
                End If
            Case 2
                If dia < 29 Then
                    vfecha = True
                ElseIf (ano / 4 = CInt(ano / 4)) Or (ano / 1000 = CInt(ano / 1000)) _
                And dia < 30 Then
                    If (dia = 29) And (ano / 100 = CInt(ano / 100)) And (ano / 400 <> CInt(ano / 400)) Then
                        vfecha = False
                        Exit Function
                    End If
                    vfecha = True
                Else
                    vfecha = False
                End If
            Case Else
                vfecha = False
        End Select
        Return vfecha
    End Function

    'Convierto una fecha dd/mm/aaaa en mm/dd/aaaa
    Function convertfecha(ByVal fecha As Date) As String
        Dim newFecha As String
        newFecha = Format(fecha, "Small Date")
        newFecha = Mid(newFecha, 4, 2) & "/" & Mid(newFecha, 1, 2) & "/" & Mid(newFecha, 7, 4)
        Return newFecha
    End Function

    'Creo una fecha dd/mm/aaaa
    Function crearfecha(ByVal sano As String, ByVal smes As String, ByVal sdia As String) As Date
        Dim newFecha As String
        Dim fecha As Date
        newFecha = sdia & "/" & smes & "/" & sano
        Try
            fecha = CDate(newFecha)
        Catch ex As Exception


        End Try
        Return fecha
    End Function

    '
    Function validaMenu(ByVal user As String, ByVal modulo As Integer) As Boolean
        'af_validamenu
        Dim band As Boolean
        Dim oComm As New SqlCommand
        oComm.Parameters.Clear()
        oComm.Parameters.Add(New SqlParameter("@nameid", SqlDbType.NVarChar, 255, ParameterDirection.Input))
        oComm.Parameters.Add(New SqlParameter("@moduleid", SqlDbType.Int, ParameterDirection.Input))
        oComm.Parameters("@nameid").Value = user
        oComm.Parameters("@moduleid").Value = modulo
        oComm.CommandText = "af_validamenu"
        oComm.CommandType = CommandType.StoredProcedure
        oComm.CommandTimeout = 600000000
        oDS = New DataSet
        consultaWPar(oComm, "valida")
        If oDS.Tables("valida").Rows.Count > 0 Then
            oDS.Tables("valida").Rows(0).Item(1).ToString()
            band = True
        Else
            band = False
        End If
        oDS = New DataSet
        Return band
    End Function

    Function consultaSP(ByVal sp As String, Optional ByVal prmt() As SqlParameter = Nothing, Optional ByVal tabla As String = "") As Boolean
        Dim oConn As New SqlConnection
        Dim oComm As New SqlCommand
        Dim oDA As New SqlDataAdapter

        oConn.ConnectionString = mySql

        oComm.Connection = oConn
        oComm.CommandText = sp
        oComm.CommandType = CommandType.StoredProcedure
        oComm.CommandTimeout = 600000000
        If Not prmt Is Nothing Then
            For Each param As SqlParameter In prmt
                oComm.Parameters.Add(param)
            Next
        End If
        oDA.SelectCommand = oComm
        Try
            If tabla <> "" Then
                oDA.Fill(oDS, tabla)
            Else
                oDA.Fill(oDS)
            End If
            oComm.Parameters.Clear()
        Catch ex As Exception
            oComm.Parameters.Clear()
            Return False
        End Try
        Return True
    End Function

    Function exSqlSP(ByVal sp As String, Optional ByVal prmt() As SqlParameter = Nothing) As Boolean
        Dim oConn As New SqlConnection
        Dim oComm As New SqlCommand
        Dim resu As Boolean
        oConn.ConnectionString = mySql

        oComm.Connection = oConn
        oComm.CommandText = sp
        oComm.CommandType = CommandType.StoredProcedure
        oComm.CommandTimeout = 600000000
        If Not prmt Is Nothing Then
            For Each param As SqlParameter In prmt
                oComm.Parameters.Add(param)
            Next
        End If
        Try
            oConn.Open()
            If oComm.ExecuteNonQuery() > 0 Then
                resu = True
            Else
                resu = False
            End If
            oConn.Close()
        Catch ex As Exception
            Try
                oConn.Close()
            Catch ex1 As Exception

            End Try
            resu = False
        End Try
        Return resu
    End Function


    Function consulta(ByVal sql As String, Optional ByVal tabla As String = "") As Boolean
        Dim oConn As New SqlConnection
        Dim oComm As New SqlCommand
        Dim oDA As New SqlDataAdapter
        oConn.ConnectionString = mySql
        oComm.Connection = oConn
        oComm.CommandText = Sql
        oComm.CommandType = CommandType.Text
        oComm.CommandTimeout = 600000000
        oDA.SelectCommand = oComm
        Try
            If tabla <> "" Then
                oDA.Fill(oDS, tabla)
            Else
                oDA.Fill(oDS)
            End If
        Catch ex As Exception
            Return False
        End Try
        Return True
    End Function

    Function exSql(ByVal sql As String) As Boolean
        Dim oConn As New SqlConnection
        Dim oComm As New SqlCommand
        Dim resu As Boolean
        oConn.ConnectionString = mySql
        oComm.Connection = oConn
        oComm.CommandText = sql
        oComm.CommandType = CommandType.Text
        oComm.CommandTimeout = 600000000
        Try
            oConn.Open()
            If oComm.ExecuteNonQuery() > 0 Then
                resu = True
            Else
                resu = False
            End If
            oConn.Close()
        Catch ex As Exception
            Try
                oConn.Close()
            Catch ex1 As Exception

            End Try
            resu = False
        End Try
        Return resu
    End Function

    Function exSqlEsc(ByVal sql As String) As String
        Dim oConn As New SqlConnection
        Dim oComm As New SqlCommand
        Dim result As String = ""
        oConn.ConnectionString = mySql
        oComm.Connection = oConn
        oComm.CommandText = sql
        oComm.CommandType = CommandType.Text
        oComm.CommandTimeout = 600000000
        Try
            oConn.Open()
            result = oComm.ExecuteScalar
        Catch ex As Exception

        Finally
            Try
                oConn.Close()
            Catch ex As Exception

            End Try
        End Try
        Return result
    End Function


End Class
