<%@ Page Language="VB" AutoEventWireup="false" CodeFile="oc_alta.aspx.vb" Inherits="oc_alta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="width: 100%;">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                        Width="100%">
                        <cc1:TabPanel runat="server" HeaderText="Caratula OC" ID="TabPanel1">
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="Width:15%;">
                                            OC
                                            </td>
                                        <td style="Width:35%;">
                                            <asp:TextBox ID="txtOc" runat="server" Width="90%" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td style="Width:15%;">
                                            DJAI
                                        </td>
                                        <td style="Width:35%;">
                                            <asp:TextBox ID="txtDjai" runat="server" Width="90%" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            MRP
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlMRP" runat="server" Width="91%" Enabled="False">                                            
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Aduana
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlAduana" runat="server" Width="91%" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Proveedor
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlProveedor" runat="server" Width="91%" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Mes a Consumirse
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlMesConsumirse" runat="server" Width="91%" 
                                                Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Incoterm
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlIncoterm" runat="server" Width="91%" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Criticidad
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCriticidad" runat="server" Width="91%" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Pago
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPago" runat="server" Width="91%" Enabled="False">
                                            <asp:ListItem />
                                            <asp:ListItem Text="Anticipado" Value="Anticipado" />
                                            <asp:ListItem Text="Diferido" Value="Diferido" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Mail a Compras
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkCompras" runat="server" Enabled="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Terminos de Venta
                                            </td>
                                        <td>
                                            <asp:TextBox ID="txtVenta" runat="server" Width="90%" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlStatus" runat="server" Width="91%" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Observaciones
                                        </td>
                                        <td rowspan="2">
                                            <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine" 
                                                Width="90%" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            Problema
                                        </td>
                                        <td rowspan="2">
                                            <asp:TextBox ID="txtProblema" runat="server" TextMode="MultiLine" Width="90%" 
                                                ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Detalle OC">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                    <asp:GridView ID="gvArticulos" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">
                                                        <RowStyle ForeColor="#000066" />
                                                        <Columns>
                                                            <asp:BoundField DataField="idLinea" />
                                                            <asp:BoundField DataField="Sap" HeaderText="Sap" />
                                                            <asp:BoundField DataField="Mercaderia" HeaderText="Mercaderia" />
                                                            <asp:BoundField DataField="pu" HeaderText="P U" />                                                            
                                                        </Columns>
                                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        
                                    </Triggers>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="DJAIs Asociadas">
                             <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <table style="width: 100%;">                                            
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                    <asp:GridView ID="gvDjais" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">
                                                        <RowStyle ForeColor="#000066" />
                                                        <Columns>
                                                            <asp:BoundField DataField="idoc" Visible="false" />
                                                            <asp:BoundField DataField="idoperacion" Visible="false" />
                                                            <asp:BoundField DataField="Despacho" HeaderText="Djai" />
                                                            <asp:BoundField DataField="identificador_propio" HeaderText="Interno" />
                                                            <asp:BoundField DataField="fecha_oficializacion" HeaderText="Oficializado" />
                                                            <asp:BoundField DataField="estado_declaracion" HeaderText="Estado" />                                                                                                                        
                                                        </Columns>
                                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>                                        
                                        
                                    </Triggers>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                    </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: center;">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>    
    </form>
</body>
</html>
