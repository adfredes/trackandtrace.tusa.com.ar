﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="error-page.aspx.vb" Inherits="error_page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sistema - Error</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" >
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="font-size: 21px; background-image: url(images/fondo_a1.gif); text-align: center">
                    &nbsp;<br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="font-size: 20px; background-image: url(images/fondo_b1.gif); text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="font-size: 20px; background-image: url(images/fondo_sombra.gif); height: 19px;
                    text-align: center">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="280">
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
                    <b>&nbsp;Error en la página</b></td>
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
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="280">
            <tr>
                <td height="6">
                    <img height="1" src="images/spacer.gif" width="1" /></td>
            </tr>
        </table>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="280">
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
                    <table border="0" cellpadding="0" cellspacing="8" width="100%">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" class="texto" width="100%">
                                    <tr>
                                        <td align="left" class="texto" colspan="3" height="6">
                                            <img height="1" src="images/spacer.gif" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="texto" colspan="3">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            &nbsp;Lo siento, pero se ha producido un error en la página. En este momento se
                                            esta enviando un informe al area de soporte.<br />
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="6">
                                            <img height="1" src="images/spacer.gif" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td width="66">
                                            &nbsp;</td>
                                        <td width="47">
                                            &nbsp;</td>
                                        <td width="139">
                                            <input border="0" height="22" name="imageField" onclick="history.back(-1); return false;"
                                                src="images/b_aceptar.gif" type="image" width="60" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
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
    
    </div>
    </form>
</body>
</html>
