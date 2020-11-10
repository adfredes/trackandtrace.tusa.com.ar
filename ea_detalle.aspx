<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="ea_detalle.aspx.vb" Inherits="ea_detalle" title="Exportación Aerea - Detalle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <link href="css/style.css" type="text/css" rel="stylesheet" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />--%>
</head>
<body>
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> 
    
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
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
                <!-- TEXTO DEL TITULO -->
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Edicion
                    de datos</font></td>
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
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
            <tr>
                <!-- esq sup izq -->
                <td height="6" width="6">
                    <img height="6" src="images/cuadro1.gif" width="6" /></td>
                <!-- superior -->
                <td background="images/fondo1.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <!-- esq sup der -->
                <td height="6" width="6">
                    <img height="6" src="images/cuadro4.gif" width="6" /></td>
            </tr>
            
            <tr>
                <!-- esto sirve para que tengan los datos un borde izq para cada fila -->
                <td background="images/fondo4.gif" width="6">
                </td>
                <td bgcolor="#e9f1f6">
                    <!-- TABLA PARA DATOS, que esta dentro del cuadro -->
                    <table border="0" cellpadding="0" cellspacing="8" class="texto" width="100%">
                        <!-- FILA DE DATOS CON FORMA: DATO<>VALOR<>ESPACIO<>DATO<>VALOR -->
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Operación</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblOP" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                &nbsp;</td>
                            <td align="right" width="33%">
                                &nbsp;</td>
                        </tr>
                        <!-- FIN DE UNA FILA DE DATOS -->
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                HAWB</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblHWB" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                MAWB</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblMWB" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Cliente</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblCli" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Agente</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblA" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Consignatario</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblCO" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Transportista</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblTA" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Fecha Salida</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblFS" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Aerop. Destino</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblAD" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Kgs. Bruto</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblKB" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Kgs. Aforados</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblKA" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Tipo Tarifa</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblTT" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Cód. Divisa</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblCD" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Tarifa</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblT" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Flete</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblF" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Cargos PP</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblCPP" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Cargos CC</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblC" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Gastos Agente PP</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblGAPP" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Gastos Agente CC</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblGA" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Gastos Carrier PP</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblGCPP" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Gastos Carrier CC</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblGC" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Gastos Value PP</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblGVPP" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Gastos Value CC</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblGV" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Mercadería</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblM" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Vuelo</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblV" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="15%">
                                Fecha Vuelo</td>
                            <td align="right" width="32%">
                                <asp:Label ID="lblFV" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="15%">
                                Fecha Llegada</td>
                            <td align="right" width="33%">
                                <asp:Label ID="lblFL" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                    </table>
                    <!-- esto sirve para que tengan los datos un borde der para cada fila
									 pero ojo que hay dos formas, fijarse bien -->
                </td>
                <td background="images/fondo3.gif" width="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <!-- FIN TABLA PARA DATOS -->
            </tr>
            <!-- esquinitas y borde inferiores -->
            <tr>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro2.gif" width="6" /></td>
                <td background="images/fondo2.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro3.gif" width="6" /></td>
            </tr>
        </table>
        <!-- FIN TABLA INTERIOR -->
        <!-- FIN CUADRO -->

        &nbsp;
        <br />
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
            <tr>
                <!-- esq sup izq -->
                <td height="6" width="6">
                    <img height="6" src="images/cuadro1.gif" width="6" /></td>
                <!-- superior -->
                <td background="images/fondo1.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <!-- esq sup der -->
                <td height="6" width="6">
                    <img height="6" src="images/cuadro4.gif" width="6" /></td>
            </tr>
            <tr>
                <!-- BORDE DEL TITULO DE LA TABLA Y FLECHITA -->
                <td background="images/fondo4.gif" width="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <td bgcolor="#e9f1f6" class="texto" height="25">
                    <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Detalle
                        HAWB </font>
                </td>
                <td background="images/fondo3.gif" width="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <!-- FIN BORDE DE LA TABLA Y FLECHITA -->
                <!-- EMPIEZA TABLA INTERIOR -->
            </tr>
        </table>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
            <tr>
                <td background="images/fondo4.gif" width="6">
                    &nbsp;</td>
                <td bgcolor="#E9F1F6">
                    <!-- BORDE DERECHO -->
                    <asp:Label ID="lblNO" runat="server" CssClass="texto" Text="No hay bultos para esta Exportación Aérea"
                        Visible="False"></asp:Label><asp:GridView ID="gvListado" runat="server" AutoGenerateColumns="False"
                            Font-Bold="False" Width="100%">
                            <FooterStyle BackColor="#4691BD" />
                            <Columns>
                                <asp:BoundField HeaderText="Bultos" DataField="det_bultos">
                                    <HeaderStyle Width="16%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Ancho" DataField="det_ancho">
                                    <HeaderStyle Width="17%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Largo" DataField="det_largo">
                                    <HeaderStyle Width="17%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Alto" DataField="det_alto">
                                    <HeaderStyle Width="16%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Volumen" DataField="det_volumen">
                                    <HeaderStyle Width="17%" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:GridView>
                </td>
                <td background="images/fondo3.gif" width="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
            </tr>
            <!-- esquinitas y borde inferiores -->
            <tr>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro2.gif" width="6" /></td>
                <td background="images/fondo2.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro3.gif" width="6" /></td>
            </tr>
        </table>
        <!-- FIN TABLA INTERIOR -->
        <!-- FIN EJEMPLO -->
        </form>
</body>
</html>
       



