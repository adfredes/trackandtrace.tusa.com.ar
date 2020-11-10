<%@ Page Title="CT&T - Seguimiento SIMIs" Language="VB" AutoEventWireup="false" CodeFile="djj_busqueda2.aspx.vb"
    MasterPageFile="~/MasterPage.master" Inherits="djj_busqueda2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="ibBuscar" class="form-buscador">
        <div class="form-inline">
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlFechas" runat="server" CssClass="form-control form-control-sm"
                    onchange="javascript:enable_fecha();">
                    <asp:ListItem Value="0">[FECHAS]</asp:ListItem>
                    <asp:ListItem Selected="True" Value="fecha_oficializacion">Oficialización</asp:ListItem>
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
                <asp:DropDownList ID="ddlNumero" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Selected="True" Value="identificador_propio">Interno</asp:ListItem>
                    <asp:ListItem>Despacho</asp:ListItem>
                    <asp:ListItem Value="ref_cliente">Referencia</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <md-input-container>
            <label>Número</label>
            <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control form-control-sm" Width="130px"></asp:TextBox>
            </md-input-container>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlAduana" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Selected="True">Aduana</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Selected="True">Estados</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1 d-none">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="3">
                    <asp:ListItem Selected="True" Value="0" Text="x SIMI"></asp:ListItem>
                    <asp:ListItem Value="1" Text="x Despacho"></asp:ListItem>
                    <asp:ListItem Value="2" Text="x Item"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="form-inline">            
            <div class="mt-2 col-6">
                <asp:ImageButton ID="ibBuscar" runat="server" ImageUrl="~/images/search.gif" class="botonBuscar"/>
                <asp:ImageButton ID="ibExcel" runat="server" ImageUrl="~/images/excel.jpg"/>
                <asp:ImageButton ID="ibCsv" runat="server" ImageUrl="~/images/icono-csv.png"/>
            </div>            
            <div class="mt-2 col-6" style="text-align:right">                
                <asp:DropDownList ID="ddlSizeGrid" runat="server" CssClass="form-control form-control-sm font-weight-bold" AutoPostBack="true">
                    <asp:ListItem Selected="True" Value="25">25 Registros</asp:ListItem>
                    <asp:ListItem Value="50">50 Registros</asp:ListItem>
                    <asp:ListItem Value="75">75 Registros</asp:ListItem>
                    <asp:ListItem Value="100">100 Registros</asp:ListItem>
                </asp:DropDownList>
                <button id="btnOcultarBuscador" class="icon-up-open ml-2"></button>
            </div>
        </div>
    </asp:Panel>    
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDesde"
        Format="dd/MM/yyyy" Enabled="true">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtHasta"
        Format="dd/MM/yyyy" Enabled="true">
    </cc1:CalendarExtender>
    <div id="updateProgressDiv" style="display: none; height: 40px; width: 300px; z-index: 400;
        left: 300px;">
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
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100"
                        Font-Bold="False" AllowPaging="True" PageSize="25" RowStyle-CssClass="GridItem"
                        HeaderStyle-CssClass="GridEncabezado" PagerStyle-CssClass="GridPager" PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                        <Columns>                                                        
                            <asp:BoundField DataField="ref_cliente" HeaderText="Referencia"></asp:BoundField>                            
                            <asp:BoundField DataField="despacho" HeaderText="Despacho"></asp:BoundField>                            
                            <asp:BoundField DataField="fecha_oficializacion" DataFormatString="{0:d}" HeaderText="Oficializado">
                            </asp:BoundField>
                            <asp:BoundField DataField="total" HeaderText="Total"></asp:BoundField>
                            <asp:BoundField DataField="consumido" HeaderText="Consumido"></asp:BoundField>
                            <asp:BoundField DataField="restante" HeaderText="Restante"></asp:BoundField>
                            <asp:BoundField DataField="estado_declaracion" HeaderText="Estado"></asp:BoundField>
                            <asp:BoundField DataField="vencimiento" HeaderText="Vencimiento" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />                            
                            </asp:BoundField>
                            <asp:ImageField NullImageUrl="~/images/file_pdf.png" DataImageUrlField="divisa" DataImageUrlFormatString="~/images/file_pdf.png"
                                ControlStyle-Height="18px">
                            </asp:ImageField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="text-right">
                    <asp:Label ID="Label1" runat="server" CssClass="GridTotalRegistros"></asp:Label>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ibBuscar" EventName="Click"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="ddlSizeGrid" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </div>
</asp:Content>
