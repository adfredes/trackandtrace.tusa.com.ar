<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="im_detalle.aspx.vb" Inherits="im_detalle" title="Importación Marítima - Detalle" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <link href="css/style.css" type="text/css" rel="stylesheet" />
   <%-- <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />--%>
</head>
<body>
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> 
    <!-- TITULO DE UN CUADRO -->
  
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
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Detalle
                    de la importación</font></td>
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
    <!-- FIN TITULO DE CUADRO -->
    <!-- CUADRO -->
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
            <!-- ACA EMPIEZA UNA FILA DEL CUADRO PARA METER DATOS O UNA TABLA
								 INTERIOR -->
            <tr>
                <!-- esto sirve para que tengan los datos un borde izq para cada fila -->
                <td background="images/fondo4.gif" width="6">
                </td>
                <td bgcolor="#e9f1f6">
                    <!-- TABLA PARA DATOS, que esta dentro del cuadro -->
                    <table border="0" cellpadding="0" cellspacing="8" class="texto" width="100%">
                        <!-- FILA DE DATOS CON FORMA: DATO<>VALOR<>ESPACIO<>DATO<>VALOR -->
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Nro. Operación</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblOP" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                &nbsp;</td>
                            <td align="right" width="35%">
                                &nbsp;</td>
                        </tr>
                        <!-- FIN DE UNA FILA DE DATOS -->
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                H B / L</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblHBL" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                B / L</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblBL" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Origen</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblO" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Destino</td>
                            <td align="right" width="35%">
                                <asp:Label ID="blbD" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Fecha Llegada</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblFL" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                &nbsp;</td>
                            <td align="right" width="35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Cliente</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblC" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Proveedor</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblP" runat="server"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Agente</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblA" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Referencia</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblR" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Bultos</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblB" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Volumen</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblV" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Peso Bruto</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblPB" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Toneladas</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblTN" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Divisa</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblD" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Tipo Tarifa</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblTT" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Tarifa</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblT" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                            </td>
                            <td align="right" width="35%">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Flete</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblF" runat="server"></asp:Label></td>
                            <td width="5%">
                                <asp:Label ID="lblF1" runat="server"></asp:Label></td>
                            <td align="left" class="textoHawb" width="13%">
                            </td>
                            <td align="right" width="35%">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Gastos Carrier</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblGC" runat="server"></asp:Label></td>
                            <td width="5%">
                                <asp:Label ID="lblGC1" runat="server"></asp:Label></td>
                            <td align="left" class="textoHawb" width="13%">
                            </td>
                            <td align="right" width="35%">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Gastos Agente</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblGA" runat="server"></asp:Label></td>
                            <td width="5%">
                                <asp:Label ID="lblGA1" runat="server"></asp:Label></td>
                            <td align="left" class="textoHawb" width="13%">
                            </td>
                            <td align="right" width="35%">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Divisa Manejo</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblDM" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Manejo</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblMA" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Mercadería</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblM" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Retiro</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblRT" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Fecha Retiro</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblFC" runat="server"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Embalaje</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblE" runat="server"></asp:Label></td>
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
                    <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> Contenedores
                    </font>
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
                    <asp:Label ID="Label30" runat="server" CssClass="texto" Text="No hay contenedores para esta Importación Marítima"
                        Visible="False"></asp:Label>
                    <asp:GridView ID="gvListado" runat="server" AutoGenerateColumns="False" Font-Bold="False"
                        Width="100%">
                        <FooterStyle BackColor="#4691BD" />
                        <Columns>
                            <asp:BoundField HeaderText="Tipo" DataField="con_tipo">
                                <HeaderStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="N&#250;mero" DataField="con_numero">
                                <HeaderStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Condici&#243;n" DataField="con_condicion">
                                <HeaderStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Kg. Brutos." DataField="con_kgbrutos">
                                <HeaderStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Precinto" DataField="con_precinto">
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
        
    
</form>
</body>
</html>

