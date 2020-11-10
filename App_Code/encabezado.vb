Imports System.Text

Public Class encabezado
    Private fecha As String
    Private nro_op As String

    Public Sub New(ByVal _fecha As String, ByVal _nro_op As String)
        fecha = _fecha
        nro_op = _nro_op
    End Sub

    Public Function TString(ByVal cabecera As Boolean) As StringBuilder

        Dim str As New StringBuilder
        str.AppendLine("FX(SICE - COMIMP)|")
        str.AppendLine("2.05|")
        str.AppendLine("Documentos de Gastos (Entrada)|")
        str.AppendLine("COMIMP()|")
        str.AppendLine("FX|")
        str.AppendLine("| |")
        If cabecera Then
            str.Append("FXC_" & nro_op & "_" & fecha & "|")
        Else
            str.Append("FXD_" & nro_op & "_" & fecha & "|")
        End If
        Return str

    End Function


    Public Function get_nombre(ByVal cabecera As Boolean) As String
        If cabecera Then
            Return ("FXC_" & nro_op & "_" & fecha & ".txt")
        Else
            Return ("FXD_" & nro_op & "_" & fecha & ".txt")
        End If
    End Function


End Class
