<%@ Page Language="VB" AutoEventWireup="false" CodeFile="em_detalle.aspx.vb" Inherits="em_detalle" title="Exportación Marítima - Detalle" %>
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
                                Operación</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblO" runat="server" CssClass="texto"></asp:Label></td>
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
                                Descr. Buque</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblDB" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Viaje</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblV" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Agente</td>
                            <td align="right" width="35%">
                                
                                    <asp:Label ID="lblA" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Compañia</td>
                            <td align="right" width="35%">                                
                                    <asp:Label ID="lblCO" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Cliente</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblC" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Consignatario</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblCGT" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                H B/L</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblHBL" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                B/L</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblBL" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Kg. Brutos</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblKB" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Cód. Embarque</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblCE" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Bultos</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblB" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Volumen</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblVO" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                ETD</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblETD" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                &nbsp;</td>
                            <td align="right" width="35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Origen</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblORG" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Destino</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblDes" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Tipo Tarifa</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblTT" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Divisa</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblDiv" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Tarifa H B/L</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblTHBL" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Flete H B/L</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblFHBL" runat="server" CssClass="texto"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left" class="textoHawb" width="12%">
                                Descripción</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblD" runat="server" CssClass="texto"></asp:Label></td>
                            <td width="5%">
                            </td>
                            <td align="left" class="textoHawb" width="13%">
                                Referencia</td>
                            <td align="right" width="35%">
                                <asp:Label ID="lblR" runat="server" CssClass="texto"></asp:Label></td>
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
        
        <!-- SOLO UN EJEMPLO CON VARIANTES -->
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
                <td background="images/fondo4.gif" width="6" style="height: 60px">
                    &nbsp;</td>
                <td bgcolor="#E9F1F6" style="height: 60px">
                    <!-- BORDE DERECHO -->
                    &nbsp;<asp:Label ID="lblno" runat="server" CssClass="texto" Text="No hay detalles para esta Exportación Marítima"
                        Visible="False"></asp:Label>
                    <asp:GridView ID="gvListado" runat="server" AutoGenerateColumns="False" Font-Bold="False"
                        Width="100%">
                        <FooterStyle BackColor="#4691BD" />
                        <Columns>
                            <asp:BoundField HeaderText="Tipo" DataField="con_tipo">
                                <HeaderStyle Width="16%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="N&#250;mero" DataField="con_numero">
                                <HeaderStyle Width="17%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Parcial" DataField="con_parcial">
                                <HeaderStyle Width="17%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Kg. Brutos." DataField="con_kgbrutos">
                                <HeaderStyle Width="16%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Precinto" DataField="con_precinto">
                                <HeaderStyle Width="17%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Bultos" DataField="con_bultos" >
                                <HeaderStyle Width="17%" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:GridView>
                </td>
                <td background="images/fondo3.gif" width="6" style="height: 60px">
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

