<%@ Page Title="CT&T" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="djj_djai_despacho.aspx.vb" Inherits="djj_djai_despacho" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton1">
        <table align="center" border="0" cellpadding="0" cellspacing="0" class="textoTitulo"
            style="font-weight: bold">
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
                    <table cellpadding="10" class="textoTitulo">
                        <tr>
                            <td style="vertical-align: bottom">
                                <b>Desde</b>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDesde"
                                    ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator><asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                                        ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator><br />
                                <asp:TextBox ID="txtDesde" runat="server" Width="130px"></asp:TextBox>
                            </td>
                            <td style="vertical-align: bottom">
                                <b>Hasta</b>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHasta"
                                    ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator><asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                                        ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator><br />
                                <asp:TextBox ID="txtHasta" runat="server" Width="130px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: bottom">
                                &nbsp;</td>
                            <td style="vertical-align: middle; text-align: right;">
                                <asp:ImageButton ID="ImageButton2" runat="server" Height="26px" 
                                    ImageUrl="~/images/icono-csv.png" ToolTip="Exportar" Width="26px" />
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="28px" 
                                    ImageUrl="~/images/search.gif" class="botonBuscar" Width="28px" />
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
    </asp:Panel>
    <br />
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDesde"
        Format="dd/MM/yyyy" Enabled="true">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtHasta"
        Format="dd/MM/yyyy" Enabled="true">
    </cc1:CalendarExtender>
    <div id="updateProgressDiv" style="display: none; height: 40px; width: 100%; z-index: 400;
        left: 300px;">
        <img src="images/LOADING.gif" style="width:100%;" />
    </div>
    <cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server"
        TargetControlID="UpdatePanel1" Enabled="True">
        <Animations>
         <OnUpdating>
         <Sequence>                    
         <FadeOut Duration=".5" Fps="30" />            
         <ScriptAction Script="onUpdating();" /> 
         </Sequence>          
         </OnUpdating>
      <OnUpdated>
        <Sequence>          
        <ScriptAction Script="onUpdated();" /> 
          <FadeIn Duration=".5" Fps="30" />
        </Sequence>
      </OnUpdated></Animations>
    </cc1:UpdatePanelAnimationExtender>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="Panel2" runat="server">
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
                        &nbsp; </td>
                    <td style="background-color: #e9f1f6;">
                           <asp:GridView ID="GridView1" runat="server" Font-Bold="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                AutoGenerateColumns="False" AllowPaging="True" PageSize="50" Width="100%">
                                <PagerSettings FirstPageImageUrl="~/images/pagina1_activo.gif" LastPageImageUrl="~/images/pagina4_activo.gif"
                                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/images/pagina3_activo.gif" Position="TopAndBottom"
                                    PreviousPageImageUrl="~/images/pagina2_activo.gif"></PagerSettings>
                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#E9F1F6" CssClass="texto"
                                    ForeColor="Black"></RowStyle>
                                <Columns>                                    
                                    <asp:BoundField DataField="Fecha Oficialización" DataFormatString="{0:d}" 
                                        HeaderText="Fecha Oficializ." />
                                    <asp:BoundField DataField="despacho" HeaderText="Nro. Despacho"></asp:BoundField>
                                    <asp:BoundField DataField="Interno" HeaderText="Interno"></asp:BoundField>                                    
                                    <asp:BoundField DataField="Ref Cliente" HeaderText="Ref. Cli." />
                                    <asp:BoundField DataField="Item" HeaderText="Item" />
                                    <asp:BoundField DataField="Pos. Arancelaria" HeaderText="Pos. Arancelaria" />
                                    <asp:BoundField DataField="Unidad" HeaderText="Unidad" />
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                    <asp:BoundField DataField="Fob" HeaderText="Fob" />                                    
                                    <asp:BoundField DataField="djai" HeaderText="DJAI"></asp:BoundField>
                                    <asp:BoundField DataField="Item a Cancelar" HeaderText="Item a Cancelar">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="salido" HeaderText="Fecha Salido" DataFormatString="{0:d}" ></asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#4691BD"></FooterStyle>
                                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#4691BD"
                                    CssClass="encabezadoTabla"></HeaderStyle>
                            </asp:GridView>
                       
                       
                       
                       
                    </td>
                    <td background="images/fondo3.gif" width="6">
                        &nbsp; </td>
                </tr>
       <tr bgcolor="#4a92bd">
            <td width="6" background="images/fondo4.gif">
                </td>
            <td style="background-color: #e9f1f6; text-align: right;">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Font-Size="10pt"></asp:Label>
                    </td>
            <td width="6" background="images/fondo3.gif">
                </td>
        </tr>
        <tr>
            <td width="6" height="6">
                <img height="6" src="images/cuadro2.gif" width="6" /></td>
            <td height="6" background="images/fondo2.gif" >
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td width="6" height="6">
                <img height="6" src="images/cuadro3.gif" width="6" /></td>
        </tr>
    </table>
            
            
            
                
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    <!-- Tabla de movimiento entre resultados -->
    <br />
    <div id="Boton" align="center">
        <br />
        &nbsp;<br />
        &nbsp; &nbsp;&nbsp;</div>
</asp:Content>

