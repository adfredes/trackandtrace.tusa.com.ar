<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sfw_archivos.aspx.vb" Inherits="sfw_archivos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Detalle archivos XMLs</title>
    <link href="css/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
    <br />
    <table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
        style="font-weight: bold; width: 90%">
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro1.gif" width="6" />
            </td>
            <td background="images/fondo1.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro4.gif" width="6" />
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td bgcolor="#e9f1f6" class="texto" height="10" style="text-align: center">
                <asp:Label ID="lblTexto0" runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="Small">Archivos Enviados</asp:Label>
                <br />
                <asp:GridView ID="gvEnviados" runat="server" AutoGenerateColumns="False" Font-Bold="False"
                    Width="100%" EmptyDataText="No se encontraron archivos.">
                    <FooterStyle BackColor="#4691BD" />
                    <Columns>
                        <asp:BoundField DataField="idFile" />
                        <asp:BoundField DataField="Archivo" HeaderText="Archivo">
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha">
                        </asp:BoundField>
                        <asp:BoundField DataField="Despacho" HeaderText="Despacho" />
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/images/xml_18.jpg" Text="XML" />
                    </Columns>
                    <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Left"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Left"
                        VerticalAlign="Middle" />
                </asp:GridView>
            </td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
        </tr>
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro2.gif" width="6" />
            </td>
            <td background="images/fondo2.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro3.gif" width="6" />
            </td>
        </tr>
    </table>
    <br />
    <table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
        style="font-weight: bold; width: 90%">
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro1.gif" width="6" />
            </td>
            <td background="images/fondo1.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro4.gif" width="6" />
            </td>
        </tr>
        <tr>
            <td background="images/fondo4.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td bgcolor="#e9f1f6" class="texto" height="10" style="text-align: center">
                <asp:Label ID="lblTexto1" runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="Small">Archivos Recibidos</asp:Label>
                <asp:GridView ID="gvRecibidos" runat="server" AutoGenerateColumns="False" Font-Bold="False"
                    Width="100%" EmptyDataText="No se encontraron archivos.">
                    <FooterStyle BackColor="#4691BD" />
                    <Columns>
                        <asp:BoundField DataField="Archivo" HeaderText="Archivo">
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha">
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Left"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Left"
                        VerticalAlign="Middle" />
                </asp:GridView>
            </td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
        </tr>
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro2.gif" width="6" />
            </td>
            <td background="images/fondo2.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro3.gif" width="6" />
            </td>
        </tr>
    </table>
    <br />
    
    </form>
</body>
</html>
