Imports System.Text
Imports System.IO
Public Class archivo_detalle

    Private oDetalle() As Detalle
    Private oCabecera As Cabecera
    Private oEncabezado As encabezado


    Private pos_det As Integer
    Private cant_det As Integer
    Private tra_fecha As String
    Private nro_op As String

    Public Sub New(ByVal cant_reg As Integer, ByVal fecha As String, ByVal _nro_op As String)
        ReDim oDetalle(cant_reg - 1)
        pos_det = 0
        tra_fecha = fecha
        nro_op = _nro_op
        oEncabezado = New encabezado(fecha, _nro_op)
    End Sub

    'Agrego renglones al archivo de detalle
    Public Sub agregar_detalle(ByVal _origen As Char, ByVal _tipodoc As Char, ByVal _nrodoc As String, ByVal _codcli As String, ByVal _legajo As String, ByVal _nrodespacho As String, ByVal _codconcepto As String, ByVal _importe As String, ByVal _codimpuesto As String, ByVal _importe_impuesto As String, ByVal pv As String)
        oDetalle(pos_det) = New Detalle(_origen, _tipodoc, _nrodoc, _codcli, _legajo, _nrodespacho, _codconcepto, _importe, _codimpuesto, _importe_impuesto, pv)
        pos_det += 1
    End Sub

    'Agrego renglon al arechivo de cabecera
    Public Sub agregar_cabecera(ByVal _origen As Char, ByVal _tipodoc As Char, ByVal _nrodoc As String, ByVal _letra As Char, ByVal _codcli As String, ByVal _fcocumento As String, ByVal _importe As String, ByVal _codme As String, ByVal _tcbiome As String, ByVal _nrocai As String, ByVal _fvtcai As String, ByVal _fvto As String, ByVal _oc_servicio As String, ByVal _coiibb As String, ByVal pv As String)
        oCabecera = New Cabecera(_origen, _tipodoc, _nrodoc, _letra, _codcli, _fcocumento, _importe, _codme, _tcbiome, _nrocai, _fvtcai, _fvto, _oc_servicio, _coiibb, pv)
    End Sub

    Public Sub agregar_cabecera(ByVal _origen As Char, ByVal _tipodoc As Char, ByVal _nrodoc As String, ByVal _letra As Char, ByVal _codcli As String, ByVal _fcocumento As String, ByVal _importe As String, ByVal _codme As String, ByVal _tcbiome As String, ByVal _nrocai As String, ByVal _fvtcai As String, ByVal _fvto As String, ByVal _oc_servicio As String, ByVal _coiibb As String, ByVal pv As String, ByVal _pais As String, ByVal _hpc As String)
        oCabecera = New Cabecera(_origen, _tipodoc, _nrodoc, _letra, _codcli, _fcocumento, _importe, _codme, _tcbiome, _nrocai, _fvtcai, _fvto, _oc_servicio, _coiibb, pv, _pais, _hpc)
    End Sub

    'Procedimiento para salvar archivos
    Public Function guardar() As Object()
        'Guardo el archivo de Cabecera
        Dim oBJ(3) As Object
        Dim myArchi As New StringBuilder
        Dim myArchi2 As New StringBuilder
        oBJ(0) = New Object
        oBJ(0) = oEncabezado.get_nombre(True)

        'myArchi.WriteLine(oEncabezado.TString(True).ToString)
        myArchi.AppendLine(oCabecera.ToString)
        'myArchi.WriteLine(oCabecera.get_id)
        myArchi.AppendLine("TRAILER|" & tra_fecha & "|2|")
        oBJ(1) = New Object
        oBJ(1) = myArchi


        'Guardo el archivo de detalle
        oBJ(2) = New Object
        oBJ(2) = oEncabezado.get_nombre(False)
        Dim x As Integer
        'myArchi.WriteLine(oEncabezado.TString(False).ToString)
        For x = 0 To pos_det - 1
            myArchi2.AppendLine(oDetalle(x).ToString)
        Next
        'myArchi.WriteLine(oCabecera.get_id)
        myArchi2.AppendLine("TRAILER|" & tra_fecha & "|" & 1 + pos_det & "|")
        oBJ(3) = New Object
        oBJ(3) = myArchi2
        Return oBJ
    End Function

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

End Class
