<%@ Page Title="CT&T - Búsqueda de Operaciones" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="ctt_busqueda2.aspx.vb" Inherits="ctt_busqueda2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:Panel ID="pnlBuscador" runat="server" Wrap="true" CssClass="form-buscador" DefaultButton="ibBuscar">
        <div class="form-inline ocultar-buscador">
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True" Value="0">[TIPOS]</asp:ListItem>
                    <asp:ListItem>Importación</asp:ListItem>
                    <asp:ListItem>Exportación</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlNumero" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True" Value="identificador_propio">Interno</asp:ListItem>
                    <asp:ListItem>Despacho</asp:ListItem>
                    <asp:ListItem Value="ref_cliente">Referencia</asp:ListItem>
                    <asp:ListItem Value="guia_conocimiento">Doc Embarque</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <md-input-container>
        <label>Número</label>
        <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control form-control-sm font-weight-bold"
                        Width="130px"></asp:TextBox>
      </md-input-container>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlFechas" runat="server" CssClass="form-control form-control-sm font-weight-bold"
                    onchange="javascript:enable_fecha();">
                    <asp:ListItem Value="0">[FECHAS]</asp:ListItem>
                    <asp:ListItem Selected="True" Value="fecha_oficializacion">Oficialización</asp:ListItem>
                    <%--<asp:ListItem Value ="fecha_arribo">Arribo</asp:ListItem>
                        <asp:ListItem Value="fecha_entrega">Entrega/Carga</asp:ListItem>--%>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDesde"
                    ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                    ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                <md-input-container>
                        <label>Desde</label>
        <asp:TextBox ID="txtDesde" runat="server" CssClass="form-control form-control-sm font-weight-bold" Width="105px"></asp:TextBox>
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
                    <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control form-control-sm font-weight-bold" Width="105px"></asp:TextBox>
                    </md-input-container>
                <cc1:CalendarExtender ID="txtHasta_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                    TargetControlID="txtHasta">
                </cc1:CalendarExtender>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlDestinacion" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True">Destinacion</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlAduana" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True">Aduana</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlVia" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True">Via</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlCanal" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True">Canal</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlProcedencia" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True">Procedencia</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-control form-control-sm font-weight-bold">
                    <asp:ListItem Selected="True">Estados</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group mr-1 form-check">
                <asp:CheckBox ID="chkItem" runat="server" CssClass="" />
                <label class="font-weight-bold">
                    xItems</label>
            </div>
            <div class="form-group mr-1 form-check">
                <asp:CheckBox ID="chkSimi" runat="server" CssClass="" Checked="True" /><label class="font-weight-bold">Incluir
                    SIMIs</label>
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
    <div id="updateProgressDiv1" style="display: none; height: 100px; width: 100%; z-index: 400;
        text-align: center;">
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
                
                                                            
                    
                    <asp:GridView ID="GViTEM2" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" Font-Bold="False"
                        AllowPaging="True" PageSize="25" RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">                        
                        
                        <Columns>
                            <asp:BoundField HeaderText="Interno" DataField="identificador_propio" />
                            <asp:BoundField HeaderText="Referencia" DataField="ref_cliente" />
                            <asp:BoundField HeaderText="Despacho" DataField="despacho" />
                            <asp:BoundField HeaderText="Aduana" DataField="aduana"></asp:BoundField>
                            <asp:BoundField HeaderText="Dest." DataField="destinacion"></asp:BoundField>                            
                            <asp:BoundField HeaderText="Transporte" DataField="transporte" />
                            <asp:BoundField HeaderText="Gu&#237;a" DataField="guia_conocimiento" />                                                         
                            <asp:BoundField HeaderText="Oficializado" DataField="fecha_oficializacion" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="Arribo" DataField="fecha_arribo" />
                            <asp:BoundField HeaderText="Entrega" DataField="fecha_entrega"></asp:BoundField>
                            <asp:BoundField DataField="estado_declaracion" HeaderText="Estado" />
                            <asp:BoundField DataField="nro_Item" HeaderText="Item" />
                            <asp:BoundField DataField="posicion_arancelaria" HeaderText="Posición" />
                            <asp:BoundField DataField="declaracion_a_cancelar" HeaderText="Declaración a Cancelar" />
                            <asp:BoundField DataField="nro_item_a_cancelar" HeaderText="Item a Canelar" />
                            <asp:BoundField DataField="unidad_declarada" HeaderText="Unidad" />
                            <asp:BoundField DataField="cantidad_declarada" HeaderText="Cantidad" />
                            <asp:BoundField DataField="precio_unitario" HeaderText="Precio Unitario" />
                            <asp:BoundField DataField="monto_fob_div" HeaderText="Valor Fob">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="divisa" HeaderText="Divisa" />
                            <asp:ImageField NullImageUrl="~/images/xml_18.jpg" DataImageUrlField="divisa" DataImageUrlFormatString="~/images/xml_18.jpg">
                            </asp:ImageField>
                            <asp:ImageField NullImageUrl="~/images/file_pdf.png" DataImageUrlField="divisa" DataImageUrlFormatString="~/images/file_pdf.png"
                                ControlStyle-Height="18px">
                            </asp:ImageField>
                        </Columns>                                                
                    </asp:GridView>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" Font-Bold="False"
                        AllowPaging="True" PageSize="25" RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">                        
                        <Columns>
                            <asp:BoundField HeaderText="Interno" DataField="identificador_propio" />
                            <asp:BoundField HeaderText="Referencia" DataField="ref_cliente" />
                            <asp:BoundField HeaderText="Despacho" DataField="despacho" />                            
                            <asp:BoundField HeaderText="Aduana" DataField="aduana"></asp:BoundField>
                            <asp:BoundField HeaderText="Dest." DataField="destinacion"></asp:BoundField>                            
                            <asp:BoundField HeaderText="Transporte" DataField="transporte" />
                            <asp:BoundField HeaderText="Gu&#237;a" DataField="guia_conocimiento" />                                                        
                            <asp:BoundField HeaderText="Facturas" DataField="Facturas" />
                            <asp:BoundField HeaderText="Oficializado" DataField="fecha_oficializacion" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="Arribo" DataField="fecha_arribo" />
                            <asp:BoundField HeaderText="Entrega" DataField="fecha_entrega"></asp:BoundField>
                            <asp:BoundField DataField="estado_declaracion" HeaderText="Estado" />
                            <asp:BoundField DataField="monto_fob" HeaderText="Fob">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="divisa" HeaderText="Divisa" />
                            <asp:ImageField NullImageUrl="~/images/xml_18.jpg" DataImageUrlField="divisa" DataImageUrlFormatString="~/images/xml_18.jpg">
                            </asp:ImageField>
                            <asp:ImageField NullImageUrl="~/images/file_pdf.png" DataImageUrlField="divisa" DataImageUrlFormatString="~/images/file_pdf.png"
                                ControlStyle-Height="18px">
                            </asp:ImageField>
                        </Columns>                                                
                    </asp:GridView>
                    
                    <div class="text-right">
                        <asp:Label ID="Label1" runat="server" CssClass="GridTotalRegistros"></asp:Label>
                    </div>                
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ibBuscar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="GViTEM2" EventName="PageIndexChanging" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />
            <asp:AsyncPostBackTrigger ControlID="ddlSizeGrid" EventName="SelectedIndexChanged" />            
        </Triggers>
    </asp:UpdatePanel>
    </div>
    
    <%--<script lang="javascript">
        boton = document.querySelector('.botonBuscar');
        boton.click();    
    </script>--%>
</asp:Content>
