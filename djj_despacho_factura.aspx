<%@ Page Title="CT&T" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="djj_despacho_factura.aspx.vb" Inherits="djj_despacho_factura" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
   <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton2">
        <table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
            style="font-weight: bold">
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
                <td bgcolor="#e9f1f6" class="texto" height="10">
                    <table cellpadding="10" class="textoTitulo">
                        <tr>
                   
                        <td align="right" class="texto">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDesde"
                                ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                                ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
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
                       
                        <td align="right" class="texto">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHasta"
                                ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                                ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
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
                            <td style="vertical-align: bottom">
                               
                            </td>
                            <td style="vertical-align: middle; text-align: right;">
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="26px" ImageUrl="~/images/icono-csv.png"
                                    ToolTip="Exportar" Width="26px" />
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
       
    </asp:Panel>
    
</asp:Content>
