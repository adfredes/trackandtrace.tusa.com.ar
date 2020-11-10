Imports System.Text

Public Class Detalle
    Private origen As Char
    Private tipodoc As Char
    Private nrodoc As String
    Private codcli As String
    Private legajo As String
    Private nrodespacho As String
    Private codconcepto As String
    Private importe As String
    Private codimpuesto As String
    Private importe_impuesto As String


    Public Sub New(ByVal _origen As Char, ByVal _tipodoc As Char, ByVal _nrodoc As String, ByVal _codcli As String, ByVal _legajo As String, ByVal _nrodespacho As String, ByVal _codconcepto As String, ByVal _importe As String, ByVal _codimpuesto As String, ByVal _importe_impuesto As String, ByVal pv As String)
        origen = _origen
        tipodoc = _tipodoc
        'nrodoc = modelar(_nrodoc, 20, False)
        nrodoc = modelar(modelar(pv, 4, True) & "-" & modelar(_nrodoc, 8, True), 20, False)
        codcli = modelar(_codcli, 15, False)
        legajo = modelar(_legajo, 50, True)
        nrodespacho = modelar(_nrodespacho, 20, False)
        codconcepto = modelar(_codconcepto, 13, False)
        importe = modelar(_importe.Replace(",", ""), 15, True)
        codimpuesto = modelar(_codimpuesto, 13, False)
        importe_impuesto = modelar(_importe_impuesto.Replace(".", ""), 15, True)
    End Sub

    Private Function modelar(ByVal palabra As String, ByVal cantcar As Integer, ByVal num As Boolean) As String
        'palabra:  cadena que deseo modelar
        'cantcar: tamaño que debe tener la palabra
        'num: si es verdadero completa con 0 a la izquierda sino completa con caracteres a la derecha
        While palabra.Length < cantcar
            If num Then
                palabra = "0" + palabra
            Else
                palabra += " "
            End If
        End While
        Return palabra
    End Function

    Public Overrides Function ToString() As String
        Return origen & "|" & tipodoc & "|" & nrodoc & "|" & codcli & "|" & legajo & "|" & nrodespacho & "|" & codconcepto & "|" & importe & "| |000|"
    End Function


End Class
