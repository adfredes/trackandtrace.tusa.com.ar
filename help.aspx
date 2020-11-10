<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sistema - Ayuda</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
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
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="280" style="text-align: center">
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
                    <b>
                    &nbsp;Ayuda del sistema</b></td>
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
        <form action="servlet/LoginServlet" method="post" name="form">
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
                                                <p>
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;Utilizar el sistema BW es relativamente sencillo. Para comenzar, deberá ambientarse
                                                    con la barra superior que se encuentra en su pantalla; la misma le permitirá navegar
                                                    por todo nuestro sitio. A continuación le presentamos un panorama respecto a qué
                                                    la conforma:</p>
                                                <p align="center">
                                                    <br />
                                                    &nbsp;
                                                    <img src="images/help1.gif" /></p>
                                                <p>
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;Respecto a la Barra de Herramientas, hay cuatro opciones disponibles:</p>
                                                <p>
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;<img align="absMiddle" height="16" src="images/iconos/ico_home.gif" width="16" />
                                                    : Permite ir a la página de inicio del sistema.<br />
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;<img align="absMiddle" height="16" src="images/iconos/ico_print.gif" width="16" />
                                                    : Permite imprimir la pantalla actual.<br />
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;<img align="absMiddle" height="16" src="images/iconos/ico_ayuda.gif" width="16" />
                                                    : Muestra esta ayuda.<br />
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;<img align="absMiddle" height="16" src="images/iconos/ico_logoff.gif" width="16" />
                                                    : Permite salir del sistema.</p>
                                                <p>
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;Para poder acceder a las diferentes prestaciones del sistema, solo hace falta
                                                    hacer click en los Tabs de Opciones, y luego en los correspondientes Sub-Tabs. Veamos
                                                    a continuación a qué nos referimos con un sencillo ejemplo. Imaginando que queremos
                                                    obtener los Movimientos Con Saldos de nuestra empresa:</p>
                                                <p>
                                                    1) Hacemos clic en la opción Cuentas Corrientes (se aclara que debemos tener permisos
                                                    para poder acceder a ella. Para más información sobre sus permisos, consulte al
                                                    administrador):</p>
                                                <p align="center">
                                                    <img height="74" src="images/help2.gif" width="531" /></p>
                                                <p>
                                                    2) Elegir en el submenú de Cuentas Corrientes, la opción que queremos. En nuestro
                                                    ejemplo, Movimientos Con Saldos:</p>
                                                <p align="center">
                                                    <img height="89" src="images/help3.gif" width="551" /></p>
                                                <p>
                                                    3) Finalmente, nos encontraremos en la pantalla correspondiente a la opción deseada.</p>
                                                <p>
                                                    <img height="7" src="images/flecha_1.gif" width="4" />
                                                    &nbsp;Para más información, póngase en contacto con el administrador del sistema.</p>
                                                <p>
                                                    <br />
                                                </p>
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
                                                <input border="0" height="22" name="imageField" onclick="window.close(); return false;"
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
            <p>
                &nbsp;</p>
        </form>
        <br />
    
    </div>
    </form>
</body>
</html>
