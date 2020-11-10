<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ctt_detalle2.aspx.vb" Inherits="ctt_detalle2" title="CT&T - Detalle Operacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html >
<head id="Head1" runat="server">
    <title>CT&T - Detalle Operacion</title>    
    <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    
         
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Content/angular-material.min.css" rel="stylesheet" />
    <link href="Content/chart.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.slim.js" type="text/jscript"></script>
    <!--script src="Scripts/popper.min.js" type="text/javascript"></script-->
    <script src="Scripts/chart.min.js" type="text/javascript"></script>
    <script src="Scripts/angular.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-material.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-animate.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-messages.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-route.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-sanitize.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-aria.min.js" type="text/javascript"></script>
    <script src="Scripts/angular-chart.js" type="text/javascript"></script>

     <script src="Scripts/Angular/Module/TytModule.js"></script>
    <script src="Scripts/Angular/Service/XhrService.js"></script>
    <script src="Scripts/Angular/Directive/MdDraggableDirective.js"></script>


    <script src="Scripts/Angular/Service/ModalComponentService.js" type="text/javascript"></script>

    <script src="Scripts/Angular/Directive/ModalHandleDirective.js" type="text/javascript"></script>
    
    <script language="JavaScript" type="text/JavaScript">
<!--

window.OpenModalAngular = function(modalName, value){
    let evt = new CustomEvent('openmodalangular', {
            detail: {
                name: modalName,
                value: value
            }
        });                                    
    document.body.dispatchEvent(evt);
}
//-->
    </script>
    
    
    <script language="JavaScript" type="text/JavaScript">        
        function ocultar_grilla(item){
            var grilla = document.getElementById(item)
            if (grilla.style.visibility == 'hidden')
                grilla.style.visibility = 'visible';
            else
                grilla.style.visibility = 'hidden';
        }
     </script>    
</head>
<body ng-app="tytApp" modal-handle>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         
        
        <div class="card">
  <div class="card-header">
    <div id="dDetalleDespacho" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">DETALLE DESPACHO</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iDetalleDespacho" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div><asp:Panel ID="pDetalleDespacho" runat="server">
  <div class="card-body table-responsive container-fluid">   
    <div class="row pb-1">
        <div class="col-3 font-italic font-weight-bold">Código Interno</div>
        <div class="col-3"><asp:Label ID="lblCod" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Fecha Apertura</div>
        <div class="col-3"><asp:Label ID="lblFA" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Aduana</div>
        <div class="col-3"><asp:Label ID="lblAd" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Tipo Destinación</div>
        <div class="col-3"><asp:Label ID="lblTD" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Condición Venta</div>
        <div class="col-3"><asp:Label ID="lblCV" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Referencia Cliente</div>
        <div class="col-3"><asp:Label ID="lblRC" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Medio Transporte</div>
        <div class="col-3"><asp:Label ID="lblMT" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Guía Conocimiento</div>
        <div class="col-3"><asp:HyperLink ID="lblGC" runat="server" CssClass="texto">[lblGC]</asp:HyperLink></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Proveedor</div>
        <div class="col-3"><asp:Label ID="lblP" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Fecha Arribo</div>
        <div class="col-3"><asp:Label ID="lblFArribo" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Bultos</div>
        <div class="col-3"><asp:Label ID="lblBultos" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Peso Bruto</div>
        <div class="col-3"><asp:Label ID="lblPB" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Número Despacho</div>
        <div class="col-3"><asp:Label ID="lblNumDes" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Canal</div>
        <div class="col-3"><asp:Label ID="lblC" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row  pb-1">
        <div class="col-3 font-italic font-weight-bold">Fecha Oficialización</div>
        <div class="col-3"><asp:Label ID="lblFO" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Fecha Entrega</div>
        <div class="col-3"><asp:Label ID="lblFE" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    <div class="row">
        <div class="col-3 font-italic font-weight-bold">Lugar Entrega</div>
        <div class="col-3"><asp:Label ID="lblLE" runat="server" CssClass="texto"></asp:Label></div>
        <div class="col-3 font-italic font-weight-bold">Giro del medio</div>
        <div class="col-3"><asp:Label ID="lblGM" runat="server" CssClass="texto"></asp:Label></div>
    </div>
    
    
    </div>
                    
        
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="server" 
TargetControlID="pDetalleDespacho" 
CollapsedSize="0" 
Collapsed="false" 
ExpandControlID="dDetalleDespacho" 
CollapseControlID="dDetalleDespacho" 
ImageControlID="iDetalleDespacho"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/>         
        
         </asp:Panel>
  
</div>
            
        <!-- fin del cuadrito de titulo de la tabla con datos -->
                                      
<div class="card">
  <div class="card-header"> <div id="dDocumentos" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">DOCUMENTOS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iDocumentos" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>    
  </div><asp:Panel ID="pDocumentos" runat="server">
  <div class="card-body table-responsive">   
                
                                                            
                                        

                    
                 <asp:GridView ID="gvDocumentos" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                        
                        <Columns>
                            <asp:BoundField DataField="codigo" HeaderText="Documentación">
                            <HeaderStyle Width="30%" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="presencia" HeaderText="Presencia" />
                            <asp:BoundField DataField="referencia" HeaderText="Número">
                            <HeaderStyle Width="50%" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        
                        <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                        
                    </asp:GridView>    
                              
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
TargetControlID="pDocumentos" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dDocumentos" 
CollapseControlID="dDocumentos" 
ImageControlID="iDocumentos"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/>
     
  </div></asp:Panel>  
</div>
        
 
 <div class="card">
  <div class="card-header">
    <div id="dInformacion_Complementarias" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">INFORMACION COMPLEMENTARIA</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iInformacion_Complementarias" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div><asp:Panel ID="pInformacion_Complementarias" runat="server">
  <div class="card-body table-responsive">
    
            <asp:GridView ID="gv_Informacion_Complementarias" runat="server" 
                AutoGenerateColumns="False" 
                CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">                
                <Columns>
                    <asp:BoundField DataField="codigo" HeaderText="Código">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sufijo_dato_comp" HeaderText="Sufijo">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="valor" HeaderText="Valor">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                
                    <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                
            </asp:GridView>
            
             <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" 
TargetControlID="pInformacion_Complementarias" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dInformacion_Complementarias" 
CollapseControlID="dInformacion_Complementarias" 
ImageControlID="iInformacion_Complementarias"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/>
  </div></asp:Panel>
</div>       
       

  <div class="card">
  <div class="card-header">
    <div id="dBultos" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">BULTOS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iBultos" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div><asp:Panel ID="pBultos" runat="server">
  <div class="card-body table-responsive ">
    
            <asp:GridView ID="gvBultos" runat="server" AutoGenerateColumns="False" 
                CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Embalaje">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="tipo_embalaje" HeaderText="Tipo Embalaje">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nro_bultos" DataFormatString="{0}" 
                        HeaderText="Bultos">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cantidad_bultos_declarados" DataFormatString="{0}" 
                        HeaderText="Bultos Declarada">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cantidad_unidad_medida" DataFormatString="{0}" 
                        HeaderText="Cant. Medida">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="unidad" DataFormatString="{0}" 
                        HeaderText="Unidad Medida">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cantidad_declarada" DataFormatString="{0}" 
                        HeaderText="Cant. Declarada">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cantidad_disponible" DataFormatString="{0}" 
                        HeaderText="Cant. Disp.">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                
            </asp:GridView>
                      
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" 
TargetControlID="pBultos" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dBultos" 
CollapseControlID="dBultos" 
ImageControlID="iBultos"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div></asp:Panel>  
</div>


<div class="card">
  <div class="card-header">
    <div id="dItems" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">ITEMS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iItems" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div> <asp:Panel ID="pItems" runat="server">
  <div class="card-body table-responsive">
   
                   <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">                        
                        <Columns>
                            <asp:BoundField DataField="idda" HeaderText="IdDA" />
                            <asp:BoundField DataField="posicion_arancelaria" 
                                HeaderText="Pos. Arancelaria" />
                            <asp:BoundField DataField="procedencia" HeaderText="Procedencia" />
                            <asp:BoundField DataField="origen" HeaderText="Origen" />
                            <asp:BoundField DataField="declaracion_a_cancelar" HeaderText="Djai" />
                            <asp:BoundField DataField="peso_neto_kgr" HeaderText="Peso Neto">
                            <ItemStyle HorizontalAlign="Right" />
                            <ControlStyle CssClass="text" ForeColor="DarkBlue" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cantidad_declarada" HeaderText="Cant. Declarada">
                            <ItemStyle HorizontalAlign="Right" />
                            <ControlStyle CssClass="text" ForeColor="DarkBlue" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                        
                    </asp:GridView>
                                
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="server" 
TargetControlID="pItems" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dItems" 
CollapseControlID="dItems" 
ImageControlID="iItems"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div> </asp:Panel>
</div>
    
     <div class="card">
  <div class="card-header">
    <div id="dImportes" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">IMPORTES</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iImportes" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div><asp:Panel ID="pImportes" runat="server">
  <div class="card-body table-responsive">
    <div class="container-fluid">
        <div class="row pb-1">
            <div class="col-3 font-italic font-weight-bold">Total Bultos</div>
            <div class="col-3"><asp:Label ID="lblTB" runat="server" CssClass="texto"></asp:Label></div>
            <div class="col-3 font-italic font-weight-bold">Peso Guía</div>
            <div class="col-3"><asp:Label ID="lblPN" runat="server" CssClass="texto"></asp:Label></div>
        </div>
        <div class="row pb-1">
            <div class="col-3 font-italic font-weight-bold">Peso bruto</div>
            <div class="col-3"><asp:Label ID="lblPB2" runat="server" CssClass="texto"></asp:Label></div>
            <div class="col-3 font-italic font-weight-bold">FOB</div>
            <div class="col-3"><asp:Label ID="LblFob" runat="server" CssClass="texto"></asp:Label></div>
        </div>
        <div class="row pb-1">
            <div class="col-3 font-italic font-weight-bold">Base Imponible</div>
            <div class="col-3"><asp:Label ID="lblBI" runat="server" CssClass="texto"></asp:Label></div>
            <div class="col-3 font-italic font-weight-bold">Flete</div>
            <div class="col-3"><asp:Label ID="lblFlete" runat="server" CssClass="texto"></asp:Label></div>
        </div>
        <div class="row">
            <div class="col-3 font-italic font-weight-bold">Seguro</div>
            <div class="col-3"><asp:Label ID="lblS" runat="server" CssClass="texto"></asp:Label></div>
            <div class="col-3 font-italic font-weight-bold">Cotización</div>
            <div class="col-3"><asp:Label ID="lblCot" runat="server" CssClass="texto"></asp:Label></div>
        </div>
    </div>                            
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                        <tr align="middle"  class="encabezadoTabla">                             
                            <td width="100%">
                                <br />
                                <asp:GridView ID="gvLiquidaciones" runat="server" AutoGenerateColumns="False" 
                                    CssClass="table table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                                    <Columns>
                                        <asp:BoundField DataField="codigo_concepto" HeaderText="Codigo Concepto">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nombre_concepto" HeaderText="Nombre Concepto">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_obligacion" HeaderText="Tipo de Obligación">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="monto_concepto" DataFormatString="$ {0}" 
                                            HeaderText="Monto">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>                                    
                                </asp:GridView>
                                <br />
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="30px" 
                            ImageUrl="~/images/icono-csv.png" Width="30px" />
                                </td>                            
                        </tr>
                    </table>
                    <!-- fin tabla con datos -->
                    <table cellpadding="0" cellspacing="0" style="width: 98%; text-align: right">
                        <tr>
                            <td style="height: 20px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Visible="False">Descargar...</asp:LinkButton></td>
                        </tr>
                    </table>
                <%--</td>
                
            </tr>
            
        </table>--%>
    
                
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender6" runat="server" 
TargetControlID="pImportes" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dImportes" 
CollapseControlID="dImportes" 
ImageControlID="iImportes"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div> </asp:Panel>
</div>       
      

        <div class="card">
  <div class="card-header">
    <div id="dCostoEmbarque" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">COSTOS OPERATIVOS ASOCIADOS AL EMBARQUE</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iCostoEmbarque" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div>
  <asp:Panel ID="pCostoEmbarque" runat="server">
  <div class="card-body table-responsive">
    
                    <asp:GridView ID="gvCostoEmbarque" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                        <Columns>
                            <asp:BoundField DataField="pos_comprobante" HeaderText="Comprobante">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pos_tipocomp" HeaderText="Tipo">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pos_sucursal" HeaderText="Sucursal">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pos_numero" 
                                HeaderText="Número">
                            </asp:BoundField>
                            <asp:BoundField DataField="gas_descripcion" 
                                HeaderText="Descripción">
                            </asp:BoundField>
                            <asp:BoundField DataField="pos_fecha" DataFormatString="{0:d}" 
                                HeaderText="Fecha" />
                            <asp:BoundField DataField="div_codigo" HeaderText="Divisa" />
                            <asp:BoundField DataField="pos_importe" DataFormatString="$ {0}" 
                                HeaderText="Importe">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cot_divlocal" DataFormatString="$ {0}" 
                                HeaderText="Cot. Divisa">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                        
                    </asp:GridView>
                           
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender7" runat="server" 
TargetControlID="pCostoEmbarque" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dCostoEmbarque" 
CollapseControlID="dCostoEmbarque" 
ImageControlID="iCostoEmbarque"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div> 
  </asp:Panel>     
</div>


    <div class="card">
  <div class="card-header">
    <div id="dFacturas" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">FACTURAS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iFacturas" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div><asp:Panel ID="pFacturas" runat="server">
  <div class="card-body table-responsive">
    
                    <asp:GridView ID="gvFacturas" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
            <Columns>
                <asp:BoundField DataField="idfac" DataFormatString="factura.aspx?psp={0}" />
                <asp:ButtonField Text="Descargar" CommandName="Descargar" Visible="False" >
                <ControlStyle Width="2%" CssClass="texto" ForeColor="DarkBlue" />
                <ItemStyle Width="2%" />
                <HeaderStyle Width="2%" />                
                </asp:ButtonField>
                <asp:ImageField DataImageUrlField="darchivo" 
                    DataImageUrlFormatString="images/fl_pdf.png">
                    <ItemStyle Height="3px" Width="3px" />
                </asp:ImageField>
                <asp:BoundField HeaderText="Fecha" DataField="fac_fecha" />                
                <asp:BoundField HeaderText="Número" DataField="fac_numero" />
                <asp:BoundField HeaderText="Anticipo" DataField="fac_anticipo" DataFormatString="$ {0}">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Total" DataField="fac_total" DataFormatString="$ {0}">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Saldo" DataField="fac_total" DataFormatString="$ {0}">
                    <ItemStyle HorizontalAlign="Right" />
                    <ControlStyle CssClass="text" ForeColor="DarkBlue" />
                </asp:BoundField>
                <asp:BoundField DataField="darchivo" HeaderText="darchivo" />
            </Columns>
            <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>            
        </asp:GridView>
                    
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender8" runat="server" 
TargetControlID="pFacturas" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dFacturas" 
CollapseControlID="dFacturas" 
ImageControlID="iFacturas"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div></asp:Panel>
</div>
      
        <!-- ******************************************************** -->
 <div class="card">
  <div class="card-header">
    <div id="dPagos" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">PAGOS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iPagos" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div> <asp:Panel ID="pPagos" runat="server">
  <div class="card-body table-responsive">
   
                    <asp:GridView ID="gvPagos" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                        <Columns>
                            <asp:BoundField DataField="tipo_cuenta" HeaderText="Cuenta">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="medio_pago" HeaderText="Medio Pago">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nro_boleta" HeaderText="Boleta">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="importe_convertido" DataFormatString="$ {0}" 
                                HeaderText="Importe Convertido">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="importe_afectado" DataFormatString="$ {0}" 
                                HeaderText="Importe Afectado">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>
                        
                    </asp:GridView>
                                
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender9" runat="server" 
TargetControlID="pPagos" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dPagos" 
CollapseControlID="dPagos" 
ImageControlID="iPagos"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div></asp:Panel> 
</div>      


        <!-- ********************************************* -->
        
        <div class="card">
  <div class="card-header">
     <div id="dLiquidacion_Item" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">LIQUIDACION ITEMS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iLiquidacion_Item" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div>
  <asp:Panel ID="pLiquidacion_Item" runat="server"><div class="card-body table-responsive">
    
           <asp:GridView ID="gvLiquidacion_Item" runat="server" 
                AutoGenerateColumns="False" 
                CssClass="table table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                <Columns>
                    <asp:BoundField DataField="codigo_concepto" HeaderText="Codigo">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nombre_concepto" HeaderText="Nombre Concepto">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="tipo_obligacion" HeaderText="Tipo">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="motivo_garantia" HeaderText="Motivo">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="monto_concepto" DataFormatString="$ {0}" 
                        HeaderText="Monto">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="base_imponible" DataFormatString="{0}" 
                        HeaderText="Base Imponible">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="coeficiente" DataFormatString="{0}" 
                        HeaderText="Coeficiente">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                
            </asp:GridView>
                         
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender10" runat="server" 
TargetControlID="pLiquidacion_Item" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dLiquidacion_Item" 
CollapseControlID="dLiquidacion_Item" 
ImageControlID="iLiquidacion_Item"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div></asp:Panel>
</div>
    


    
    <%--<table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
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
            <img height="1" src="images/spacer.gif" width="1" /></td>
        <td bgcolor="#e9f1f6" class="texto" height="25">
            <img height="7" src="images/flecha_1.gif" width="4" /><font 
                class="text-uppercase">&nbsp;Observaciones&nbsp;</font></td>
        <td background="images/fondo3.gif" width="6">
            <img height="1" src="images/spacer.gif" width="1" /></td>
    </tr>
</table>

<table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
    <tr>
        <td background="images/fondo4.gif" width="6">
            &nbsp;</td>
        <td bgcolor="#e9f1f6">
            <asp:TextBox ID="txtObs" runat="server" Height="60px" ReadOnly="True" 
                TextMode="MultiLine" Width="100%"></asp:TextBox>
        </td>
        <td background="images/fondo3.gif" width="6">
            <img height="1" src="images/spacer.gif" width="1" /></td>
    </tr>
    <tr>
        <td height="6" width="6">
            <img height="6" src="images/cuadro2.gif" width="6" /></td>
        <td background="images/fondo2.gif" height="6">
            <img height="1" src="images/spacer.gif" width="1" /></td>
        <td height="6" width="6">
            <img height="6" src="images/cuadro3.gif" width="6" /></td>
    </tr>
</table>--%>


    
    <asp:Panel ID="Panel1" runat="server" Width="100%">
    
    <div class="card">
  <div class="card-header">
    <div id="dArchivos" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">ARCHIVOS</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iArchivos" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div>
  <asp:Panel ID="pArchivos" runat="server"><div class="card-body table-responsive">
      
                <asp:GridView ID="gvArchivos" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                    <Columns>
                        <asp:BoundField HeaderText="Archivo" DataField="alias" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Descripci&#243;n" DataField="descripcion" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cuit" HeaderText="Cuit" />
                        <asp:BoundField DataField="archivo" HeaderText="file" />
                    </Columns>                    
            <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                    
                </asp:GridView>
                
                <table style="width:100%;">
                    <tr>
                        <td>
                            </td>
                        <td style="text-align: center">
                            </td>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="text-align: center">
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/images/b_REPORTAR.GIF" 
                                ToolTip="Presione aquí para notificar que el archivo se encuentra dañado." />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="color:Red; text-align: center;">
                        <em>* Si algún archivo presenta error al intentar descargarlo, por favor presione el boton <strong>REPORTAR</strong> y reintente descargarlo en 30 minutos.</em> <br />Gracias.
                            &nbsp;</td>                                           
                    </tr>
                </table>
                           
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender11" runat="server" 
TargetControlID="pArchivos" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dArchivos" 
CollapseControlID="dArchivos" 
ImageControlID="iArchivos"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/> 
  </div></asp:Panel>  
</div>
    
    
 
    </asp:Panel>        
    
    
    <asp:Panel ID="Panel2" runat="server" Width="100%">
    
    <div class="card">
  <div class="card-header">
    <div id="dGridView1" style="cursor:pointer">
                    <table style="width:100%">
                        <tr>
                            <td style="width:4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">CONSUMOS DJAI/SIMI</font>        
                            </td>
                            <td style="text-align:right; vertical-align:text-bottom;">
                                <asp:Image ID="iGridView1" runat="server" />        
                            </td>
                        </tr>
                    </table>                    
                                        
                    </div>
  </div>
  <asp:Panel ID="pGridView1" runat="server">
  <div class="card-body table-responsive">
    
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-hover table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                    <Columns>
                        <asp:BoundField DataField="total" HeaderText="Cantidad Total" />
                        <asp:BoundField DataField="consumido" HeaderText="Cantidad Consumida" />
                        <asp:BoundField DataField="restante" HeaderText="Cantidad Restante" />
                        <asp:BoundField DataField="estado_declaracion" HeaderText="Status" />
                        <asp:BoundField DataField="descripcion_estado_decla" HeaderText="Descripción" />
                        <asp:BoundField DataField="vencimiento" HeaderText="Días Restantes" 
                            ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>                        
                    </Columns>                    
                    <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>                    
                </asp:GridView>
                         
                     <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender12" runat="server" 
TargetControlID="pGridView1" 
CollapsedSize="0" 
Collapsed="True" 
ExpandControlID="dGridView1" 
CollapseControlID="dGridView1" 
ImageControlID="iGridView1"
    ExpandedImage="images/collapse.jpg"
    CollapsedImage="images/expand.jpg" 
ExpandDirection="Vertical"/>    
  </div></asp:Panel> 
</div>
    
    
   

    </asp:Panel>
    <asp:HiddenField ID="fc" runat="server" Visible="False" />
</form>
</body>
</html>
