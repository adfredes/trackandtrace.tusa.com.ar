<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="doc_carpetas.aspx.vb" Inherits="doc_carpetas" title="Archivos - Listado de Carpetas" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                            Desde:
                        </td>
                        <td height="18" style="text-align: right">
                            <asp:TextBox ID="txtDesde" runat="server" Width="140px"></asp:TextBox>
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
                            Hasta:
                        </td>
                        <td style="text-align: right">
                            <asp:TextBox ID="txtHasta" runat="server" Width="140px"></asp:TextBox>
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
                    <tr>
                        <td>
                            &nbsp;<asp:RadioButton ID="rbtNro" runat="server" GroupName="rad" />
                        </td>
                        <td class="texto">
                            Búsqueda por Número
                        </td>
                        <td class="texto">
                            <asp:DropDownList ID="ddlNro" runat="server" CssClass="texto" Width="140px">
                                <asp:ListItem Value="1">N&#250;mero de Ref. Cliente</asp:ListItem>
                                <asp:ListItem Value="2">N&#250;mero de Interno</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="right" class="texto">
                            Número:
                        </td>
                        <td class="texto">
                            &nbsp;<asp:TextBox ID="txtnro" runat="server" CssClass="texto" Width="140px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: right">
                            <br />
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/b_aceptar.gif"
                                EnableViewState="False" />
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
    <div id="updateProgressDiv1" style="display: none; height: 20px; width: 100%; z-index: 400; text-align: center;">
                    <img src="images/LOADING.gif" />
    </div>
<cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server"
    TargetControlID="UpdatePanel1" Enabled="True">
         <animations>
         <OnUpdating>
         <Sequence>                    
         <FadeOut Duration=".5" Fps="30" />            
         <ScriptAction Script="onUpdating('updateProgressDiv1');" /> 
         </Sequence>          
         </OnUpdating>
      <OnUpdated>
        <Sequence>          
        <ScriptAction Script="onUpdated('updateProgressDiv1');" /> 
          <FadeIn Duration=".5" Fps="30" />
        </Sequence>
      </OnUpdated></animations>
    </cc1:UpdatePanelAnimationExtender>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">            
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
                                <asp:BoundField DataField="id" HeaderText="id" />
                                <asp:ImageField DataImageUrlField="id" 
                                    DataImageUrlFormatString="~/Images/folder.gif" 
                                    NullImageUrl="~/Images/folder.gif">
                                </asp:ImageField>
                                <asp:BoundField HeaderText="Operación" DataField="carpeta" />
                                <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:d}"></asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad" DataField="total"></asp:BoundField>
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
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="" Font-Size="10pt"></asp:Label>
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
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />            
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging"/>
        </Triggers>
    </asp:UpdatePanel>    
</asp:Content>

