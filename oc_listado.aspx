<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="oc_listado.aspx.vb" Inherits="oc_listado" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>   
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
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
                    <table cellpadding="10" style="width: 600px; color: white; background-color: #006699">
                        <tr>
                            <td>
                                <b>Desde</b>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtDesde" ErrorMessage="*" 
                                    ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ControlToValidate="txtDesde" ErrorMessage="*" 
                                    ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="txtDesde" runat="server" Width="130px"></asp:TextBox>
                            </td>
                            <td>
                                <b>Hasta</b>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtHasta" ErrorMessage="*" 
                                    ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ControlToValidate="txtHasta" ErrorMessage="*" 
                                    ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="txtHasta" runat="server" Width="130px"></asp:TextBox>
                            </td>
                            <td>
                                <b>Número O.C.</b>
                                <asp:TextBox ID="txtDespa" runat="server" Width="130px"></asp:TextBox>                                
                            </td>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" runat="server" Height="26px" ImageUrl="~/images/icono-csv.png"
                                    ToolTip="Exportar" Width="26px" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="28px" ImageUrl="~/images/search.gif"
                                    Width="28px" />
                                        </td>
             
                                    </tr>
                                  
                                </table>
                                
                                
                               
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
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <div id="updateProgressDiv" style="display: none; height: 40px; width: 300px; z-index: 400;
                    left: 300px;">
                    <img src="Img/LOADING.gif" />
                </div>
                <updatepanelanimationextender id="UpdatePanelAnimationExtender1" runat="server" 
                    enabled="True" targetcontrolid="UpdatePanel1">
                    <animations>
                        <onupdating>
                            <sequence>
                                <fadeout duration=".5" fps="30" />
                                <scriptaction script="onUpdating();" />
                            </sequence>
                        </onupdating>
                        <onupdated>
                            <sequence>
                                <scriptaction script="onUpdated();" />
                                <fadein duration=".5" fps="30" />
                            </sequence>
                        </onupdated>
                    </animations>
                </updatepanelanimationextender>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView ID="gvOc" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                            AutoGenerateColumns="False" Width="100%">
                            <RowStyle ForeColor="#000066" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="idoc" />
                                <asp:BoundField DataField="mrp" HeaderText="MRP" />
                                <asp:BoundField DataField="oc" HeaderText="Número O. C." />
                                <asp:BoundField DataField="incoterm" HeaderText="Incoterm" />
                                <asp:BoundField DataField="Aduana" HeaderText="Aduana" />
                                <asp:BoundField DataField="Despacho" HeaderText="Djai" />
                                <asp:BoundField DataField="identificador_propio" HeaderText="Interno" />
                                <asp:BoundField DataField="fecha_oficializacion" HeaderText="Oficializada" />
                                <asp:BoundField DataField="estado_declaracion" HeaderText="Estado" />
                                <asp:BoundField DataField="fecha_pickup" DataFormatString="{0:d}" 
                                    HeaderText="PickUp" />
                                <asp:BoundField DataField="fecha_arribo" DataFormatString="{0:d}" 
                                    HeaderText="Arribo" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />                                
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDesde"
        Format="dd/MM/yyyy" Enabled="true">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtHasta"
        Format="dd/MM/yyyy" Enabled="true">
    </cc1:CalendarExtender>
</asp:Content>

