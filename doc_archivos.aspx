<%@ Page Language="VB" AutoEventWireup="false" CodeFile="doc_archivos.aspx.vb" Inherits="doc_archivos" title="Archivos - Downloads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Archivos - Downloads</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                <img height="7" src="images/flecha_1.gif" width="4" /><font class="textoTitulo"> 
                Archivos</font></td>
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
    <br />
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro1.gif" width="6" /></td>
            <td background="images/fondo1.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro4.gif" width="6" /></td>
        </tr>
                <tr bgcolor="#4a92bd">
                    <td background="images/fondo4.gif" width="6">
                        &nbsp;
                    </td>
                    <td style="background-color: #e9f1f6;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                            Font-Bold="False" AllowPaging="True" PageSize="50" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';"  style="cursor:pointer">
                            <FooterStyle BackColor="#4691BD" />
                            <Columns>
                                <asp:BoundField DataField="link" HeaderText="link" />
                                <asp:ImageField DataImageUrlField="archivo" 
                                    DataImageUrlFormatString="~/Images/file.gif" 
                                    NullImageUrl="~/Images/file.gif">
                                </asp:ImageField>
                                <asp:BoundField HeaderText="Archivo" DataField="archivo" />
                                <asp:BoundField HeaderText="Fecha" DataField="Fecha" DataFormatString="{0:d}"></asp:BoundField>
                                <asp:BoundField HeaderText="Tamaño" DataField="Tamaño"></asp:BoundField>
                            </Columns>
                            <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                            <PagerStyle HorizontalAlign="Right" />
                        </asp:GridView>
                    </td>
                    <td background="images/fondo3.gif" width="6">
                        &nbsp;
                    </td>
                </tr>
                <tr bgcolor="#4a92bd">
                    <td background="images/fondo4.gif" width="6">
                    </td>
                    <td style="background-color: #e9f1f6; text-align: right;">
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
    </div>
    <br />
    <br />
        <div align="center">
        <img src="images/b_volver.gif" OnClick="window.close();" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';"  style="cursor:pointer" id="IMG1"/>&nbsp;<br />
        <br />
    </div>
    </form>
</body>
</html>
