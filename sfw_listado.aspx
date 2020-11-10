<%@ Page Title="Listado XML" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="sfw_listado.aspx.vb" Inherits="sfw_listado" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton1" CssClass="form-buscador">
        <div class="form-inline">
            <div class="form-group mr-1">
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control form-control-sm"
                    onchange="javascript:enable_fecha();">
                    <asp:ListItem Value="0">Recepción</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">Envío</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDesde"
                    ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                    ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                <md-input-container>
    <label>Desde</label>
<asp:TextBox ID="txtDesde" runat="server" CssClass="form-control form-control-sm" Width="105px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtDesde_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtDesde">
                    </cc1:CalendarExtender>
    </md-input-container>
            </div>
            <div class="form-group mr-1">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHasta"
                    ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                    ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                <md-input-container>
            <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control form-control-sm" Width="105px"></asp:TextBox>
            <label>Hasta</label>
                    <cc1:CalendarExtender ID="txtHasta_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtHasta">
                    </cc1:CalendarExtender>
            </md-input-container>
            </div>
            <div class="form-group mr-1">
                <md-input-container>
                <label>Ref Code</label>
                <asp:TextBox ID="txtReference" runat="server" Width="104px" CssClass="form-control form-control-sm"></asp:TextBox>                
            </md-input-container>

            </div>
            <div class="form-inline">
                <div class="form-group mr-1">
                    <asp:DropDownList ID="ddEstado" runat="server" Width="130px" CssClass="form-control form-control-sm">
                        <asp:ListItem Value="-1">[ESTADO]</asp:ListItem>
                        <asp:ListItem Value="1">No Enviados</asp:ListItem>
                        <asp:ListItem Value="0">Enviados</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>
        </div>
        <div class="form-inline">
            <div class="form-group mt-2">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/search.gif" class="botonBuscar" />

                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/icono-csv.png" />
            </div>
        </div>

    </asp:Panel>

    <div id="updateProgressDiv" style="display: none; height: 40px; width: 300px; z-index: 400; left: 300px;">
        <img src="images/LOADING.gif" />
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

    <div class="h-100 table-responsive pt-3">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" CssClass="div-listado">
                    <br />
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" Font-Bold="False"
                            AllowPaging="True" PageSize="25" RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" PagerStyle-CssClass="GridPager"
                            PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                            <Columns>
                                <asp:BoundField DataField="ReferenceCode" HeaderText="ReferenceCode" />
                                <asp:BoundField DataField="Despacho" HeaderText="Despacho" />
                                <asp:BoundField DataField="Recibido" HeaderText="Fecha Recibido" />
                                <asp:BoundField DataField="Veces Recibido" HeaderText="Veces Recibido" />
                                <asp:BoundField DataField="Enviado" HeaderText="Fecha Envio" />
                                <asp:BoundField DataField="Veces Enviado" HeaderText="Veces Enviado" />
                                <asp:CheckBoxField DataField="send" HeaderText="Enviado" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click"></asp:AsyncPostBackTrigger>
                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging"></asp:AsyncPostBackTrigger>
            </Triggers>
        </asp:UpdatePanel>
    </div>

</asp:Content>
