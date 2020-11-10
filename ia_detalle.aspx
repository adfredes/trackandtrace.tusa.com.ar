<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ia_detalle.aspx.vb" Inherits="ia_detalle" title="HAWB Importación - Detalle" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <link href="css/estilo.css" type="text/css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />--%>
</head>
<body>
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> 
    <br />
    <table align="center" border="0" cellpadding="0" cellspacing="0" class="text-uppercase font-weight-bold"
        width="80%">
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro1.gif" width="6" /></td>
            <td background="images/fondo1.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro4.gif" width="6" /></td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td bgcolor="#e9f1f6" class="texto" height="10">
                &nbsp;
                <img height="7" src="images/flecha_1.gif" width="4" />
                Detalle HAWB</td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro2.gif" width="6" /></td>
            <td background="images/fondo2.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro3.gif" width="6" /></td>
        </tr>
    </table>
    <br />
    <!-- Acá empieza la tabla con los detalles -->
    
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="80%">
            <tr>
                <!-- esquinita -->
                <td height="6" width="6">
                    <img height="6" src="images/cuadro1.gif" width="6" /></td>
                <!-- parte superior -->
                <td background="images/fondo1.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <!-- esquinita -->
                <td height="6" width="6">
                    <img height="6" src="images/cuadro4.gif" width="6" /></td>
            </tr>
            <tr>
                <td background="images/fondo4.gif" width="6">
                </td>
                <td bgcolor="#e9f1f6">
                    <!-- aca empieza la OTRA tabla con datos -->
                    <table border="0" cellpadding="0" cellspacing="8" class="texto" width="100%">
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                MAWB</td>
                            <td align="right">
                                <asp:Label ID="lblMa" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                            </td>
                            <td align="right">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Operación</td>
                            <td align="right">
                                <asp:Label ID="lblOP" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                HAWB</td>
                            <td align="right">
                                <asp:Label ID="lblHW" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Origen</td>
                            <td align="right">
                                <asp:Label ID="lblO" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Destino</td>
                            <td align="right">
                                <asp:Label ID="lblD" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Fecha Salida</td>
                            <td align="right">
                                <asp:Label ID="lblFS" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Fecha Llegada</td>
                            <td align="right">
                                <asp:Label ID="lblFL" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Cliente</td>
                            <td align="right">
                                <asp:Label ID="lblC" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Proveedor</td>
                            <td align="right">
                                <asp:Label ID="lblP" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Agente</td>
                            <td align="right">
                                <asp:Label ID="lblA" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Referencia</td>
                            <td align="right">
                                <asp:Label ID="lblR" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Transportista</td>
                            <td align="right">
                                <asp:Label ID="lblT" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Vuelo</td>
                            <td align="right">
                                <asp:Label ID="lblV" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Bultos</td>
                            <td align="right">
                                <asp:Label ID="lblB" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Volumen</td>
                            <td align="right">
                                <asp:Label ID="lblVL" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Kilos Brutos</td>
                            <td align="right">
                                <asp:Label ID="lblKB" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Kilos Aforados</td>
                            <td align="right">
                                <asp:Label ID="lblKA" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Divisa Flete</td>
                            <td align="right">
                                <asp:Label ID="lblDF" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Tipo Tarifa</td>
                            <td align="right">
                                <asp:Label ID="lblTT" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Tarifa</td>
                            <td align="right">
                                <asp:Label ID="lblTA" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                            </td>
                            <td align="right">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Flete</td>
                            <td align="right">
                                <asp:Label ID="lblF" runat="server"></asp:Label></td>
                            <td colspan="2">
                                <asp:Label ID="lblR1" runat="server"></asp:Label></td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Gastos Carrier</td>
                            <td align="right">
                                <asp:Label ID="lblGC" runat="server"></asp:Label></td>
                            <td colspan="2">
                                <asp:Label ID="lblGC1" runat="server"></asp:Label></td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Gastos Agente</td>
                            <td align="right">
                                <asp:Label ID="lblGA" runat="server"></asp:Label></td>
                            <td colspan="2">
                                <asp:Label ID="lblGA1" runat="server"></asp:Label></td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                CCFEE</td>
                            <td align="right">
                                <asp:Label ID="lblCC" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                &nbsp;</td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Divisa Manejo</td>
                            <td align="right">
                                <asp:Label ID="lblDM" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Manejo</td>
                            <td align="right">
                                <asp:Label ID="lblMJ" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Mercadería</td>
                            <td align="right">
                                <asp:Label ID="lblM" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                &nbsp;</td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="font-italic" width="85">
                                Fecha Retiro</td>
                            <td align="right">
                                <asp:Label ID="lblFR" runat="server"></asp:Label></td>
                            <td width="35">
                            </td>
                            <td align="left" class="font-italic" width="85">
                                Responsable</td>
                            <td align="right">
                                <asp:Label ID="lblRe" runat="server"></asp:Label></td>
                        </tr>
                        <tr align="middle">
                            <td colspan="8">
                            </td>
                        </tr>
                    </table>
                </td>
                <td background="images/fondo3.gif" width="6">
                </td>
            </tr>
            <tr>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro2.gif" width="6" /></td>
                <td background="images/fondo2.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro3.gif" width="6" /></td>
            </tr>
        </table>
   
</form>
</body>
</html>

