<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ctt_items-operacion.aspx.vb" Inherits="ctt_items_operacion" Title="CT&T - Detalle Item Operación" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CT&T - Detalle Item Operación</title>    
    <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div class="card">
  <div class="card-header" id="dDetalleItem" style="cursor:pointer">
   <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase"> Detalle
                        Item</font>   
  </div>
  <asp:Panel ID="pDetalleItem" runat="server">
  <div class="card-body table-responsive container-fluid">   
  
    <div class="row pb-1">
        <div class="col-3 font-italic font-weight-bold"></div>
        <div class="col-3"></div>
        <div class="col-3 font-italic font-weight-bold"></div>
        <div class="col-3"></div>
    </div>

    <div class="row pb-1">
        <div class="col-3 font-italic font-weight-bold">Número de Item</div>
        <div class="col-3"><asp:Label ID="lblNItem" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Tipo de Item</div>
        <div class="col-3"><asp:Label ID="lblTItem" runat="server" CssClass="texto"></asp:Label></div>
    </div>

    <div class="row pb-1">
        <div class="col-3 font-italic font-weight-bold">Posición Arancelaria</div>
        <div class="col-3"><asp:Label ID="lblPA" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Fecha Imponible</div>
        <div class="col-3"><asp:Label ID="lblFI" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    
                    
                       
                        
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold">Existencia SubItems</div>
                            <div class="col-3"><asp:Label ID="lblES" runat="server" CssClass="texto"></asp:Label></div>                                                        
                            <div class="col-3 font-italic font-weight-bold" >Estado Mercaderia</div>
                            <div class="col-3"><asp:Label ID="lblEM" runat="server" CssClass="texto"></asp:Label></div>
                        </div>
                        
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold">Peso Neto</div>
                            <div class="col-3"><asp:Label ID="lblPN" runat="server" CssClass="texto"></asp:Label></div>                                                        
                            <div class="col-3 font-italic font-weight-bold">Despacho</div>
                            <div class="col-3"><asp:HyperLink ID="lblDespacho" runat="server" CssClass="texto">[lblDespacho]</asp:HyperLink></div>
                        </div>
                        
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Pais Origen</div>
                            <div class="col-3"><asp:Label ID="lblPO" runat="server" CssClass="texto"></asp:Label></div>                            
                            <div class="col-3 font-italic font-weight-bold" >Pais Procedencia</div>
                            <div class="col-3"><asp:Label ID="lblPP" runat="server" CssClass="texto"></asp:Label></div>
                        </div>

                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Unidad Declarada</div>
                            <div class="col-3"><asp:Label ID="lblUD" runat="server" CssClass="texto"></asp:Label></div>                            
                            <div class="col-3 font-italic font-weight-bold" >Cantidad Declarada</div>
                            <div class="col-3"><asp:Label ID="lblCnD" runat="server" CssClass="texto"></asp:Label></div>
                        </div>

                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Unidad Estadistica</div>
                            <div class="col-3"><asp:Label ID="lblUE" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" width="85">Cantidad Estadistica</div>
                            <div class="col-3"><asp:Label ID="lblCE" runat="server" CssClass="texto"></asp:Label></div>
                        </div>

                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Cantidad Especifica</div>
                            <div class="col-3"><asp:Label ID="lblCEsp" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Valor Especifico</div>
                            <div class="col-3"><asp:Label ID="lblVE" runat="server" CssClass="texto"></asp:Label></div>
                        </div>

                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Monto Fob Div</div>
                            <div class="col-3"><asp:Label ID="lblMFD" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Monto Fob Dolar</div>
                            <div class="col-3"><asp:Label ID="lblMFDol" runat="server" CssClass="texto"></asp:Label></div>
                        </div>
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Monto Seguro</div>
                            <div class="col-3"><asp:Label ID="lblMS" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Monto Flete</div>
                            <div class="col-3"><asp:Label ID="lblMF" runat="server" CssClass="texto"></asp:Label></div>                                                        
                        </div>

                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Ajuste a Deducir</div>
                            <div class="col-3"><asp:Label ID="lblAD" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Ajuste a Incluir</div>
                            <div class="col-3"><asp:Label ID="lblAI" runat="server" CssClass="texto"></asp:Label></div>                                                        
                        </div>
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Base Imponible Div</div>
                            <div class="col-3"><asp:Label ID="lblBI" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Base Imponible Dolar</div>
                            <div class="col-3"><asp:Label ID="lblBID" runat="server" CssClass="texto"></asp:Label></div>                                                        
                        </div>
                        
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Precio Unitario</div>
                            <div class="col-3"><asp:Label ID="lblPU" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Coeficiente Derecho</div>
                            <div class="col-3"><asp:Label ID="lblCD" runat="server" CssClass="texto"></asp:Label></div>                            
                        </div>
                        
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Insumos Imp. Temp.</div>
                            <div class="col-3"><asp:Label ID="lblIIT" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Insumos Imp. a Consumo</div>
                            <div class="col-3"><asp:Label ID="lblIIC" runat="server" CssClass="texto"></asp:Label></div>                            
                        </div>

                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Calidad Distinta Standar</div>
                            <div class="col-3"><asp:Label ID="lblCDS" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" >Pago Regalias</div>
                            <div class="col-3"><asp:Label ID="lblPG" runat="server" CssClass="texto"></asp:Label></div>                            
                        </div>
                        <div class="row pb-1">
                            <div class="col-3 font-italic font-weight-bold" >Precio Oficial Dolar</div>
                            <div class="col-3"><asp:Label ID="lblPOD" runat="server" CssClass="texto"></asp:Label></div>
                            <div class="col-3 font-italic font-weight-bold" ></div>
                            <div class="col-3"></div>                            
                        </div>                        
                    
                  
    </div>  
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="server" 
TargetControlID="pDetalleItem" 
CollapsedSize="0" 
Collapsed="false" 
ExpandControlID="dDetalleItem" 
CollapseControlID="dDetalleItem" 
ExpandDirection="Vertical"/> 
</div>
    
    
        
   
       <div class="card">
  <div class="card-header" id="hSubItems" style="cursor:pointer">    
                    <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase"> SubItems</font>
  </div>
  <asp:Panel ID="bSubItems" runat="server">
  <div class="card-body table-responsive">
  <asp:GridView ID="gvSubItems" runat="server" AutoGenerateColumns="False" 
  CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
            <Columns>
                <asp:BoundField HeaderText="Nro SubItem" DataField="nro_subitem" />
                <asp:BoundField HeaderText="Sufijo de Valor" DataField="sufijos_de_valor" />
            </Columns>            
        </asp:GridView>
   
  </div>
  </asp:Panel>
    <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
TargetControlID="bSubItems" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="hSubItems" 
CollapseControlID="hSubItems" 
ExpandDirection="Vertical"/> 
</div>

<div class="card">
  <div class="card-header" id="hDocumentos" style="cursor:pointer">
    <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase"> Documentos</font>
  </div>
  <asp:Panel ID="bDocumentos" runat="server">
  <div class="card-body table-responsive">
    <asp:GridView ID="gvDocumentos" runat="server" AutoGenerateColumns="False" 
    CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
        <Columns>
            <asp:BoundField HeaderText="Documentaci&#243;n" DataField="codigo" >
                <HeaderStyle Width="30%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="presencia" HeaderText="Presencia" />
            <asp:BoundField HeaderText="N&#250;mero" DataField="referencia" >
                <HeaderStyle Width="50%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>        
    </asp:GridView>
  </div>
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" 
TargetControlID="bDocumentos" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="hDocumentos" 
CollapseControlID="hDocumentos" 
ExpandDirection="Vertical"/> 
</div>
        
        
<div class="card">
  <div class="card-header" id="hVentajas" style="cursor:pointer">
    <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase"> Ventajas</font>
  </div>
  <asp:Panel ID="bVentajas" runat="server">
  <div class="card-body table-responsive">
   <asp:GridView ID="gvVentajas" runat="server" AutoGenerateColumns="False" 
   CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                    <Columns>
                        <asp:BoundField HeaderText="Nro Linea" DataField="nro_linea" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="C&#243;digo" DataField="codigo" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>                    
                </asp:GridView>
  </div>
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" 
TargetControlID="bVentajas" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="hVentajas" 
CollapseControlID="hVentajas" 
ExpandDirection="Vertical"/> 
</div>   
   
   <div class="card">
  <div class="card-header" id="hInfoComplementaria" style="cursor:pointer">
   <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase"> Información
                    Complementaria</font>
  </div>
  <asp:Panel ID="bInfoComplementaria" runat="server">
  <div class="card-body table-responsive">
    <asp:GridView ID="gv_Informacion_Complementarias" runat="server" AutoGenerateColumns="False" 
    CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                    <Columns>
                        <asp:BoundField HeaderText="C&#243;digo" DataField="codigo" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Sufijo" DataField="sufijo_dato_comp" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Valor" DataField="valor">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>                    
                </asp:GridView>
  </div>
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="server" 
TargetControlID="bInfoComplementaria" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="hInfoComplementaria" 
CollapseControlID="hInfoComplementaria" 
ExpandDirection="Vertical"/> 
</div>        

    <div class="card">
  <div class="card-header" id="hBeneficios" style="cursor:pointer">
    <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase">&nbsp;Beneficios
                        /
                        Reintegros</font>
  </div>
  <asp:Panel ID="bBeneficios" runat="server">
  <div class="card-body table-responsive">
    <asp:GridView ID="gvBeneficios" runat="server" AutoGenerateColumns="False" CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">                        
                        <Columns>
                            <asp:BoundField DataField="codigo_concepto" HeaderText="Concepto">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="monto" DataFormatString="$ {0}" HeaderText="Monto">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="monto_base" DataFormatString="$ {0}" HeaderText="Monto Base">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="coeficiente_aplicado" DataFormatString="{0}" HeaderText="Coeficiente Aplicado">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            
                        </Columns>                        
                    </asp:GridView>
  </div>
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender6" runat="server" 
TargetControlID="bBeneficios" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="hBeneficios" 
CollapseControlID="hBeneficios" 
ExpandDirection="Vertical"/> 
</div>
    
<div class="card">
  <div class="card-header" id="hLiquidaciones" style="cursor:pointer">
    <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase">&nbsp;Liquidación
                        Items&nbsp;</font>
  </div>
  <asp:Panel ID="bLiquidaciones" runat="server">
  <div class="card-body table-responsive">
    <asp:GridView ID="gvLiquidacion_Item" runat="server" AutoGenerateColumns="False" 
    CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                        <Columns>
                            <asp:BoundField DataField="codigo_concepto" HeaderText="Codigo">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nombre_concepto" HeaderText="Concepto">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tipo_obligacion" HeaderText="Tipo">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="motivo_garantia" HeaderText="Motivo">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="monto_concepto" DataFormatString="$ {0}" HeaderText="Monto">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="base_imponible" DataFormatString="{0}" HeaderText="Base Imponible">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="coeficiente" DataFormatString="{0}" HeaderText="Coeficiente">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>                        
                    </asp:GridView>
  </div>
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender7" runat="server" 
TargetControlID="bLiquidaciones" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="hLiquidaciones" 
CollapseControlID="hLiquidaciones" 
ExpandDirection="Vertical"/> 
  
</div>    
    
    
    
       
    </form>
</body>
</html>
