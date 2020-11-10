Imports Microsoft.VisualBasic
Imports System.Security
Imports System.Security.Cryptography

Public Class Encriptar

    'El array resultante es de 20 bit

    'Función para encriptar una clave con SHA
    'strSalt... agregado del password
    'intIteraciones cantidad de veces que se va a encriptar
    Public Function _Encriptar(ByVal strPassword As String, ByVal strSalt As String, ByVal intIteraciones As Integer) As Byte()
        Dim _strPasswordSalt As String = strPassword + strSalt
        Dim _objSha1 As SHA1 = SHA1.Create()
        Dim _objTemporal() As Byte = Nothing
        Try
            Dim i As Integer
            _objTemporal = System.Text.Encoding.UTF8.GetBytes(_strPasswordSalt)
            For i = 0 To intIteraciones - 1
                _objTemporal = _objSha1.ComputeHash(_objTemporal)
            Next
        Catch ex As Exception
        Finally
            _objSha1.Clear()
        End Try
        Return _objTemporal
    End Function

    'Función para comparar dos array cifrados
    Public Function _CompareByteArray(ByVal arrayA() As Byte, ByVal arrayB() As Byte) As Boolean
        Dim band As Boolean = True
        If (arrayA.Length <> arrayB.Length) Then
            band = False
        Else
            Dim i As Integer            
            For i = 0 To arrayA.Length - 1
                If Not arrayA(i) = arrayB(i) Then
                    'arrayA(1).Equals(arrayB(1))                                    
                    band = False
                    Exit For
                End If
            Next
        End If
        Return band
    End Function
End Class
