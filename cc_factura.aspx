<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="cc_factura.aspx.vb" Inherits="cc_factura" title="Cuentas Corrientes - Detalle Factura" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Cuentas Corrientes - Detalle Factura</title>    
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
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
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Factura</font></td>
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

    &nbsp;
    <!-- fin del cuadrito de titulo de la tabla con datos -->
    <!-- aca empieza la tabla con los datos -->
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
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
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Factura Tipo</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblTF" runat="server" CssClass="texto"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Factura Nro.</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblFA" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6" height="21">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Fecha</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblF" runat="server" CssClass="texto"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Sucursal</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblS" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Cliente</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblCli" runat="server" CssClass="texto"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Divisa</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblD" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" height="21" width="12%">
                            &nbsp;Cotización</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblC" runat="server" CssClass="texto"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="16%">
                            &nbsp;Condición Venta</td>
                        <td align="right" width="32%">
                            <asp:Label ID="lblCV" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" style="font-weight: bold" width="6">
            </td>
            <!-- detalles adicionales sobre la factura -->
        </tr>
        <tr style="font-weight: bold">
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="50%">
                            &nbsp;Información Adicional:</td>
                        <td align="left">
                        </td>
                    </tr>
                </table>
            </td>
            <!-- cada fila de esto q esta aca es para un detalle adicional -->
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="lblr1" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <!-- termina filita con detalles -->
            <!-- cada fila de esto q esta aca es para un detalle adicional -->
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="lblr2" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <!-- termina filita con detalles -->
            <!-- cada fila de esto q esta aca es para un detalle adicional -->
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="lblr3" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <!-- termina filita con detalles -->
            <!-- cada fila de esto q esta aca es para un detalle adicional -->
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="lblr4" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <!-- termina filita con detalles -->
            <!-- cada fila de esto q esta aca es para un detalle adicional -->
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="lblr5" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <!-- termina filita con detalles -->
            <!-- terminan los detalles adicionales -->
            <!-- fin tabla con datos -->
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
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
    &nbsp;
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
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
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Detalle</font></td>
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
    &nbsp;
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
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
                &nbsp;</td>
            <td bgcolor="#e9f1f6">
                <asp:GridView ID="gvliquidacion" runat="server" AutoGenerateColumns="False" Width="100%">
                    <FooterStyle BackColor="#4691BD" />
                    <Columns>
                        <asp:BoundField DataField="gas_codigo" HeaderText="C&#243;digo">
                            <HeaderStyle Width="12%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gas_tipo" HeaderText="Tipo">
                            <HeaderStyle Width="8%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fac_imptotal" DataFormatString="$ {0:C}" HeaderText="Importe">
                            <ItemStyle HorizontalAlign="Right" />
                            <HeaderStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fac_descripcion1" HeaderText="Descripci&#243;n">
                            <HeaderStyle Width="35%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fac_numoper" HeaderText="Operaci&#243;n">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="25%" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                </asp:GridView>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
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
    &nbsp;
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
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
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Resumen
                    - Totales</font></td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro2.gif" width="6" /></td>
            <td background="images/fondo2.gif" height="1">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro3.gif" width="6" /></td>
        </tr>
    </table>
    &nbsp;
    <table align="center" border="0" cellpadding="0" cellspacing="0" 
        style="width: 60%">
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
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="12%">
                            Anticipo</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRA" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6" height="21">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="12%">
                            Derecho</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRD" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" width="12%">
                            Exento</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRE" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" height="21" width="12%">
                            Gravado</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRG" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" height="21" width="12%">
                            I.V.A.</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRI" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" height="21" width="12%">
                            Subtotal</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRS" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" class="textoHawb" height="21" width="12%">
                            Total</td>
                        <td align="right" width="36%">
                            <asp:Label ID="lblRT" runat="server" CssClass="texto"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
            </td>
            <!-- termina filita con detalles -->
            <!-- terminan los detalles adicionales -->
            <!-- fin tabla con datos -->
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
    </form>
</body>
</html>

