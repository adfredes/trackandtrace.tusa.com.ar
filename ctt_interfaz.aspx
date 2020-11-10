<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ctt_interfaz.aspx.vb" Inherits="ctt_interfaz" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
        style="width: 350px">
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
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td bgcolor="#e9f1f6" class="texto" height="10">
                &nbsp;
                <img height="7" src="images/flecha_1.gif" width="4" />
                &nbsp;Criterios de búsqueda
            </td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
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
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="40%">
        <tr>
            <td height="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
        </tr>
    </table>
    <!-- tabla para hacer la busqueda -->
    &nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    &nbsp;<table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
        style="width: 350px">
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
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td bgcolor="#e9f1f6" class="texto" height="10">
                <table>
                    <tr>
                        <td>
                        </td>
                        <td class="texto">
                            Tipo de Operaciones:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlOperacion" runat="server" CssClass="texto" 
                                Width="128px">
                                <asp:ListItem Value="Importación">Importaciones</asp:ListItem>
                                <asp:ListItem Value="Exportación">Exportaciones</asp:ListItem>                                
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td class="texto">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;<asp:RadioButton ID="rbtFecha" runat="server" Checked="True" GroupName="rad" />
                        </td>
                        <td class="texto">
                            Búsqueda por fecha
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="right" class="texto">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDesde"
                                ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                                ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtDesde" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                            Desde:
                        </td>
                        <td height="18" style="text-align: right">
                            <asp:TextBox ID="txtDesde" runat="server" Width="128px"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtDesde_CalendarExtender" runat="server" 
                                TargetControlID="txtDesde" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="right" class="texto">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHasta"
                                ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                                ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtHasta" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                            Hasta:
                        </td>
                        <td style="text-align: right">
                            <asp:TextBox ID="txtHasta" runat="server" Width="128px"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtHasta_CalendarExtender" runat="server" 
                                TargetControlID="txtHasta" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    </table>
            </td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
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
    <br />
    
        <asp:Panel ID="Panel2" runat="server">
            <table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
        style="width: 145px">
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
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
            <td bgcolor="#e9f1f6" class="texto" height="10" >
                &nbsp;
                <img height="7" src="images/flecha_1.gif" width="4" />
                &nbsp;Exportar a Archivo:&nbsp;<br />
                &nbsp;&nbsp;
            </td>
            <td background="images/fondo3.gif" width="6">
                <img height="1" src="images/spacer.gif" width="1" />
            </td>
        </tr>
                <tr>
                    <td background="images/fondo4.gif" width="6">
                        &nbsp;</td>
                    <td bgcolor="#e9f1f6" class="texto" height="10" style="text-align: center;">
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="30px" 
                            ImageUrl="~/images/excel.jpg" Width="30px" Visible="False" />
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="30px" 
                            ImageUrl="~/images/icono-csv.png" Width="30px" />
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
            </asp:Panel>
            <br />
    <div id="updateProgressDiv1" style="display: none; height: 100px; width: 100%; z-index: 400; text-align: center;">
                    <img src="images/LOADING.gif" />
    </div>
    </asp:Content>

