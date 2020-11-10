<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cc_recibo.aspx.vb" Inherits="cc_recibo" title="Cuentas Corrientes - Detalle Recibo" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Cuentas Corrientes - Detalle Recibo</title>    
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
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Recibo</font></td>
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
                            &nbsp;Tipo Cbte.</td>
                        <td align="right" width="36%">
                            <asp:Label ID="TC" runat="server"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Número</td>
                        <td align="right" width="36%">
                            <asp:Label ID="NM" runat="server"></asp:Label></td>
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
                            <asp:Label ID="FC" runat="server"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Sucursal</td>
                        <td align="right" width="36%">
                            <asp:Label ID="SC" runat="server"></asp:Label></td>
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
                            &nbsp;Divisa</td>
                        <td align="right" width="36%">
                            <asp:Label ID="DV" runat="server"></asp:Label></td>
                        <td width="2%">
                        </td>
                        <td align="left" class="textoHawb" width="12%">
                            &nbsp;Cotización</td>
                        <td align="right" width="36%">
                            <asp:Label ID="CO" runat="server"></asp:Label></td>
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
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="49%">
                    <tr>
                        <td align="left" class="textoHawb" width="6%">
                            &nbsp;Cliente</td>
                        <td align="right">
                            <asp:Label ID="CL" runat="server"></asp:Label>
                        </td>
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
                            &nbsp;Descripción</td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <!-- repetir esto tantas veces como descripciones haya -->
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="D1" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <!-- fin repetir -->
        <!-- repetir esto tantas veces como descripciones haya -->
        <tr>
            <td background="images/fondo4.gif" width="6">
            </td>
            <td bgcolor="#e9f1f6">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="98%">
                    <tr>
                        <td align="left" width="1%">
                            &nbsp;</td>
                        <td align="left" width="99%">
                            <asp:Label ID="D2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                &nbsp;</td>
        </tr>
        <!-- fin repetir -->
        <!-- fin tabla con datos -->
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
                <img height="7" src="images/flecha_1.gif" width="4" />
                <font class="textoTitulo">Aplicaciones del Recibo 
                    <asp:Label ID="R1" runat="server"></asp:Label></font></td>
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
            <td height="6" style="width: 6px">
                <img height="6" src="images/cuadro4.gif" width="6" /></td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
                &nbsp;</td>
            <td bgcolor="#E9F1F6">
                <asp:GridView ID="gvAplicaciones" runat="server" AutoGenerateColumns="False" Width="100%">
                    <FooterStyle BackColor="#4691BD" />
                    <Columns>
                        <asp:BoundField DataField="cbt_codigo" HeaderText="Comp">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rop_detalle" HeaderText="Descripci&#243;n">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rop_sucursal" HeaderText="Suc.">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rop_cbtenumero" HeaderText="N&#250;mero">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rop_saldo" DataFormatString="$ {0:C}" HeaderText="Saldo">
                            <ItemStyle HorizontalAlign="Right" />
                            <HeaderStyle Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rop_importe" DataFormatString="$ {0:C}" HeaderText="Importe">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rop_numeroint" HeaderText="Operaci&#243;n">
                            <HeaderStyle Width="20%" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                </asp:GridView>
            </td>
            <td background="images/fondo3.gif" style="width: 6px">
                &nbsp;</td>
        </tr>
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro2.gif" width="6" /></td>
            <td background="images/fondo2.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td height="6" style="width: 6px">
                <img height="6" src="images/cuadro3.gif" width="6" /></td>
        </tr>
    </table>

    &nbsp;
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%" id="TABLE1" onclick="return TABLE1_onclick()">
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
                <font class="textoTitulo">Valores del Recibo 
                    <asp:Label ID="R2" runat="server"></asp:Label></font></td>
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
            <td bgcolor="#E9F1F6">
                <asp:GridView ID="gvValores" runat="server" AutoGenerateColumns="False" Width="100%">
                    <FooterStyle BackColor="#4691BD" />
                    <Columns>
                        <asp:BoundField DataField="tval_codigo" HeaderText="Valor">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bco_codigo" HeaderText="Banco">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="val_nrocheque" HeaderText="Nro. Cheque">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="val_fecha" HeaderText="Fecha">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="val_descripcion" HeaderText="Descripci&#243;n">
                            <HeaderStyle Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="val_importe" DataFormatString="$ {0:C}" HeaderText="Importe">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="20%" />
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
   
</form>
</body>
</html>

