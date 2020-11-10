<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="inf_anual.aspx.vb" Inherits="inf_anual" %>

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
                            <asp:DropDownList ID="ddGrafico" runat="server" Width="225px">                                
                                <asp:ListItem Value="ADUANA">Aduana</asp:ListItem>
                                <asp:ListItem Value="CANAL">Canal</asp:ListItem>
                                <asp:ListItem Value="DESTINACION">Destinación</asp:ListItem>
                                <asp:ListItem Value="OPERACION">Total Operaciones</asp:ListItem>
                                <asp:ListItem Value="TRANSPORTE">Tipo Transporte</asp:ListItem>                                                                
                                <asp:ListItem Value="[TIPO OPERACION]">Tipo Operación</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList runat="server" Width="80px" ID="ddAno">
                            </asp:DropDownList>                            
                                <asp:DropDownList runat="server" Width="225px" ID="ddTipo">
                                    <asp:ListItem Value="0">[OPERACION]</asp:ListItem>
                                    <asp:ListItem Value="I%">Importación</asp:ListItem>
                                    <asp:ListItem Value="E%">Exportación</asp:ListItem>
                                </asp:DropDownList>                          
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
                        <asp:GridView ID="gvDestinacion1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" 
                            Width="100%" EnableViewState="False">
                            <RowStyle ForeColor="#000066" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Chart ID="cDestinacion1" runat="server" Width="700px">
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <br />
                        <br />
                        <asp:GridView ID="gvCanal1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" 
                            Width="100%" EnableViewState="False">
                            <RowStyle ForeColor="#000066" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Chart ID="cCanal1" runat="server" Width="700px">
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <br />
                        <br />
                        <asp:GridView ID="gvAduana1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" 
                            Width="100%" EnableViewState="False">
                            <RowStyle ForeColor="#000066" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Chart ID="cAduana1" runat="server" Width="700px">
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

