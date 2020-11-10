Imports System.Text

Public Class Cabecera
    Private origen As Char
    Private tipodoc As Char
    Private nrodoc As String
    Private letra As Char
    Private codcli As String
    Private fcocumento As String 'aaaammdd
    Private importe As String
    Private codme As String
    Private tcbiome As String
    Private nrocai As String
    Private fvtcai As String
    Private fvto As String
    Private oc_servicio As String
    Private coiibb As String
    Private pais As String
    Private hpc As String
    Private cli_uni As Boolean
    Private enca As encabezado


    Public Sub New(ByVal _origen As Char, ByVal _tipodoc As Char, ByVal _nrodoc As String, ByVal _letra As Char, ByVal _codcli As String, ByVal _fcocumento As String, ByVal _importe As String, ByVal _codme As String, ByVal _tcbiome As String, ByVal _nrocai As String, ByVal _fvtcai As String, ByVal _fvto As String, ByVal _oc_servicio As String, ByVal _coiibb As String, ByVal pv As String)
        origen = _origen
        tipodoc = _tipodoc
        nrodoc = modelar(modelar(pv, 4, True) & "-" & modelar(_nrodoc, 8, True), 20, False)
        letra = _letra
        codcli = modelar(_codcli, 15, False)
        fcocumento = Mid(_fcocumento, 7, 4) & Mid(_fcocumento, 4, 2) & Mid(_fcocumento, 1, 2)
        importe = modelar(_importe.Replace(",", ""), 15, True)
        codme = modelar(_codme, 13, False)
        tcbiome = modelar(_tcbiome.Replace(",", ""), 12, True)
        nrocai = modelar(_nrocai, 14, True)
        fvtcai = Mid(_fvtcai, 7, 4) & Mid(_fvtcai, 4, 2) & Mid(_fvtcai, 1, 2)
        fvto = Mid(_fvto, 7, 4) & Mid(_fvto, 4, 2) & Mid(_fvto, 1, 2)
        oc_servicio = modelar(Trim(_oc_servicio), 6, False)
        coiibb = modelar(_coiibb, 13, False)
        cli_uni = False
        'enca = New encabezado(archi)
    End Sub

    Public Sub New(ByVal _origen As Char, ByVal _tipodoc As Char, ByVal _nrodoc As String, ByVal _letra As Char, ByVal _codcli As String, ByVal _fcocumento As String, ByVal _importe As String, ByVal _codme As String, ByVal _tcbiome As String, ByVal _nrocai As String, ByVal _fvtcai As String, ByVal _fvto As String, ByVal _oc_servicio As String, ByVal _coiibb As String, ByVal pv As String, ByVal _pais As String, ByVal _hpc As String)
        origen = _origen
        tipodoc = _tipodoc
        nrodoc = modelar(modelar(pv, 4, True) & "-" & modelar(_nrodoc, 8, True), 20, False)
        letra = _letra
        codcli = modelar(_codcli, 15, False)
        fcocumento = Mid(_fcocumento, 7, 4) & Mid(_fcocumento, 4, 2) & Mid(_fcocumento, 1, 2)
        importe = modelar(_importe.Replace(",", ""), 15, True)
        codme = modelar(_codme, 13, False)
        tcbiome = modelar(_tcbiome.Replace(",", ""), 12, True)
        nrocai = modelar(_nrocai, 14, True)
        fvtcai = Mid(_fvtcai, 7, 4) & Mid(_fvtcai, 4, 2) & Mid(_fvtcai, 1, 2)
        fvto = Mid(_fvto, 7, 4) & Mid(_fvto, 4, 2) & Mid(_fvto, 1, 2)
        oc_servicio = modelar(Trim(_oc_servicio), 6, False)
        coiibb = modelar(_coiibb, 13, False)
        hpc = modelar(_hpc, 4, True)
        pais = modelar(Trim(_pais), 30, False)
        cli_uni = True
        'enca = New encabezado(archi)
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

    'Devuelvo la cadena de la cabecera
    Public Overrides Function ToString() As String
        Dim linea As String
        If Not cli_uni Then
            linea = origen & "|" & tipodoc & "|" & nrodoc & "|" & letra & "|" & codcli & "|" & fcocumento & "|" & importe & "|" & codme & "|" & tcbiome & "|" & nrocai & "|" & fvtcai & "|" & fvto & "|" & oc_servicio & "|" & coiibb & "|"
        Else
            linea = origen & "|" & tipodoc & "|" & nrodoc & "|" & letra & "|" & codcli & "|" & fcocumento & "|" & importe & "|" & codme & "|" & tcbiome & "|" & nrocai & "|" & fvtcai & "|" & fvto & "|" & oc_servicio & "|" & coiibb & "|" & pais & "|" & hpc & "|"
        End If
        Return linea
    End Function

    'Devuelvo el id
    Public Function get_id() As String
        'Origen + Tipo de documento + Nro. de Documento + Código de Proveedor 			
        Return Trim(origen) & Trim(tipodoc) & Trim(nrodoc) & Trim(codcli)
    End Function



End Class
