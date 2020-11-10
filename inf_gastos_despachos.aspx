<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="inf_gastos_despachos.aspx.vb" Inherits="inf_gastos_despachos" %>

<%@ Register assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<table style="width: 100%; vertical-align: super;" cellpadding="10">
        <tr>
            <td>
            <table style="width: 100%;">
                <tr>
                    <td style="width:50%"></td>
                    <td>
                    <table cellpadding="10" style="width: 600px; color: white; background-color: #006699;
                    vertical-align: text-bottom;" >
                    <tr>
                        <td style="width:100%;">
                            <asp:DropDownList ID="ddGrafico" runat="server" Width="225px" CssClass="textoB">                                
                                <asp:ListItem Value="COMPROBANTE">Comprobante</asp:ListItem>
                                <asp:ListItem Value="GASTO">Gasto</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlFechas" runat="server" CssClass="textoB" onchange="javascript:enable_fecha();">
                        <asp:ListItem Value="0">[FECHAS]</asp:ListItem>
                        <asp:ListItem Selected="True" Value = "o.fecha_oficializacion">Oficialización</asp:ListItem>
                        <asp:ListItem Value ="p.pos_fecha">Contable</asp:ListItem>
                        <%--<asp:ListItem Value="fecha_entrega">Entrega/Carga</asp:ListItem>--%>
                    </asp:DropDownList>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txtDesde" ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                        ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtDesde" runat="server" CssClass="textoB" Width="105px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtDesde_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtDesde">
                    </cc1:CalendarExtender>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="txtHasta" ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                        ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtHasta" runat="server" CssClass="textoB" Width="105px"></asp:TextBox>
                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="textoB" Visible="False">
                        <asp:ListItem Selected="True" Value="0">[TIPOS]</asp:ListItem>
                        <asp:ListItem>Importación</asp:ListItem>
                        <asp:ListItem>Exportación</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<cc1:CalendarExtender ID="txtHasta_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtHasta">
                    </cc1:CalendarExtender>
                        </td>
                        <td style="font-weight: bold">
                            <asp:ImageButton runat="server" ImageUrl="~/images/search.gif" ID="bVer1">
                            </asp:ImageButton>
                        </td>
                    </tr>
                </table>
                </td>
                    <td style="width:50%"></td>
                </tr>
            </table>                
            </td>
        </tr>
        <tr>
            <td>
                 <div id="updateProgressDiv" style="display: none; height: 40px; width: 300px; z-index: 400;
        left: 300px;">
        <img src="images/LOADING.gif" />
    </div>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;vertical-align: super;">
                <cc1:updatepanelanimationextender ID="UpdatePanelAnimationExtender1" runat="server"
                    TargetControlID="upPanel1" Enabled="True">
                    <Animations>
         <OnUpdating>
         <Sequence>                             
         <ScriptAction Script="onUpdating('updateProgressDiv1');" /> 
         </Sequence>          
         </OnUpdating>
      <OnUpdated>
        <Sequence>          
        <ScriptAction Script="onUpdated('updateProgressDiv1');" />           
        </Sequence>
      </OnUpdated></Animations>
                </cc1:updatepanelanimationextender>
                <asp:UpdatePanel ID="upPanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:GridView ID="gvDp" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                            BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%" 
                            EnableViewState="False">
                            <RowStyle ForeColor="#000066" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Chart ID="chDP" runat="server" Width="900px" Height="500px">
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <br />
                        <br />
                        
                       <asp:GridView ID="gvTransporte1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" 
                            Width="100%" EnableViewState="False">
                            <RowStyle ForeColor="#000066" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Chart ID="cTransporte1" runat="server" Width="700px">
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <br />
                        <br />                        
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="bVer1" EventName="Click" />                        
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>


