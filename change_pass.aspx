<%@ Page Language="VB" AutoEventWireup="false" CodeFile="change_pass.aspx.vb" Inherits="change_pass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 18px;
            width: 668px;
        }
        .style2
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="300">
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
            <td bgcolor="#e9f1f6" class="texto" height="10" style="text-align:center;">                
                <b>Cambiar Contraseña</b></td>
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
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="400">
        <tr>
            <td height="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
        </tr>
    </table>    
        &nbsp;&nbsp;
        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px">
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
                </td>
                <td bgcolor="#e9f1f6">
                    <table border="0" cellpadding="0" cellspacing="8" width="100%">
                        <tr>
                            <td style="width: 500px">
                                <table border="0" cellpadding="0" cellspacing="0" class="texto" style="width: 100%">
                                    <tr>
                                        <td align="left" class="style1">
                                            <img height="7" src="images/flecha_1.gif" width="4" /> Contraseña Anterior</td>
                                        <td width="18px" style="height: 18px">
                                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtVPass"
                                                ErrorMessage="Debe ingresar el nombre del usuario.">*</asp:RequiredFieldValidator></td>
                                        <td valign="center" width="80" style="height: 18px">
                                            <asp:TextBox ID="txtVPass" runat="server" Width="280px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style2">
                                            <img height="7" src="images/flecha_1.gif" width="4" /> Nueva
                                            Contraseña</td>
                                        <td height="18" width="80">
                                            <asp:RequiredFieldValidator ID="rfvNombre0" runat="server" ControlToValidate="txtRPass"
                                                ErrorMessage="Debe ingresar el nombre del usuario.">*</asp:RequiredFieldValidator></td>
                                        <td height="18" width="80">
                                            <asp:TextBox ID="txtNPass" runat="server" TextMode="Password" Width="280px"></asp:TextBox><br />
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="center" class="style2">
                                            <img height="7" src="images/flecha_1.gif" width="4" /> Reingrese contraseña</td>
                                        <td height="18">
                                            <asp:RequiredFieldValidator ID="rfvNombre1" runat="server" ControlToValidate="txtRPass"
                                                ErrorMessage="Debe ingresar el nombre del usuario.">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txtNPass" ControlToValidate="txtRPass" 
                                                ErrorMessage="CompareValidator">*</asp:CompareValidator>
                                        </td>
                                        <td height="18">
                                            <asp:TextBox ID="txtRPass" runat="server" TextMode="Password" Width="280px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style2" colspan="3">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_aceptar.gif" />&nbsp;<img onclick="window.close();" src="images/b_cancelar.gif" style="cursor:pointer" height="22" width="52"/>
                                        </td>
                                    </tr>
                                </table>
                                </td>
                        </tr>
                    </table>
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
    </div>
    </form>
</body>
</html>
