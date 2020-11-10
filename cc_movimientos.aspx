<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="cc_movimientos.aspx.vb" Inherits="cc_mocimientos" Title="Cuentas Corrientes - Búsqueda" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Panel ID="pnlBuscador" runat="server" Wrap="true" CssClass="form-buscador" DefaultButton="ibBuscar">
        <div class="form-inline">
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlOperacion" runat="server" CssClass="form-control form-control-sm"
                    Width="160px">
                    <asp:ListItem>Cuenta Corriente</asp:ListItem>
                    <asp:ListItem>Anticipos</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlFechas" runat="server" CssClass="form-control form-control-sm"
                    onchange="javascript:enable_fecha();">
                    <asp:ListItem Selected="True" Value="fecha">Fecha Contable</asp:ListItem>
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
        </md-input-container>
                <cc1:CalendarExtender ID="txtDesde_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                    TargetControlID="txtDesde">
                </cc1:CalendarExtender>
            </div>
            <div class="form-group mr-1">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHasta"
                    ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                    ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                <md-input-container>
                    <label>Hasta</label>
                    <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control form-control-sm" Width="105px"></asp:TextBox>
                    </md-input-container>
                <cc1:CalendarExtender ID="txtHasta_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                    TargetControlID="txtHasta">
                </cc1:CalendarExtender>
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



    <!-- tabla para hacer la busqueda -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="updateProgressDiv1" style="display: none; height: 100px; width: 100%; z-index: 400; text-align: center;">
        <img src="images/LOADING.gif" />
    </div>
    <cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server"
        TargetControlID="UpdatePanel1" Enabled="True">
        <Animations>
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
      </OnUpdated></Animations>
    </cc1:UpdatePanelAnimationExtender>
    <div class="h-100 table-responsive pt-3">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Panel ID="Panel1" runat="server" CssClass="div-listado">


                    <div class="table-responsive">
                        <asp:GridView ID="gvListado" runat="server" AutoGenerateColumns="false"
                            CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" Font-Bold="False"
                            AllowPaging="True" PageSize="25" RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" PagerStyle-CssClass="GridPager"
                            PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                            <Columns>
                                <asp:BoundField DataField="cta_fecha" HeaderText="Fecha" />
                                <asp:BoundField DataField="cta_comprobante" HeaderText="Tipo Doc" />
                                <asp:BoundField DataField="tipo" HeaderText="Tipo Fact." />
                                <asp:BoundField DataField="fac_sucursal" HeaderText="Sucursal" />
                                <asp:HyperLinkField DataTextField="cta_numero" HeaderText="Número" />
                                <asp:BoundField DataField="cta_cbteaplica" HeaderText="Tipo Doc. Afect." />
                                <asp:BoundField DataField="fac_tipo" HeaderText="Tipo Fact. Af." />
                                <asp:BoundField DataField="fac_sucursal" HeaderText="Suc. Afec." />
                                <asp:BoundField DataField="cta_nroaplica" HeaderText="Número Afect." />
                                <asp:BoundField DataField="div_codigo" HeaderText="Divisa" />
                                <asp:BoundField DataField="debe" HeaderText="Débito">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="haber" HeaderText="Crédito">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="cta_saldo" HeaderText="Saldo Final">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="explorar" HeaderText="" />
                            </Columns>

                        </asp:GridView>
                    </div>
                    <div class="text-right">
                        <asp:Label ID="Label1" runat="server" CssClass="GridTotalRegistros"></asp:Label>
                    </div>

                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ibBuscar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvListado" EventName="PageIndexChanging" />
                <asp:AsyncPostBackTrigger ControlID="ddlSizeGrid" EventName="SelectedIndexChanged" />            
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
