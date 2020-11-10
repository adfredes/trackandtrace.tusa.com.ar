<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ctt_detalle_djai.aspx.vb"
    Inherits="ctt_detalle_djai" Title="CT&T - Detalle DJAI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CT&T - Detalle SIMI</title>
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
  <div class="card-header" id="dFechas" style="cursor:pointer">        
        <img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase">Historial Fechas</font>
  </div>
  <asp:Panel ID="pFechas" runat="server">
  <div class="card-body table-responsive">
    <asp:GridView ID="gvFechas" runat="server" AutoGenerateColumns="False" 
    CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom"
                        Width="100%" EmptyDataText="No se encontraron intervenciones.">                        
                        
                        
                        <Columns>
                            <asp:BoundField DataField="fecha_oficializada" HeaderText="Oficializada" DataFormatString="{0:d}">
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_presentada" HeaderText="Presentada" DataFormatString="{0:d}">
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_precumplida" DataFormatString="{0:d}" HeaderText="Pre Cumplida" />
                            <asp:BoundField DataField="fecha_cumplida" HeaderText="Cumplida" DataFormatString="{0:d}">
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_salida" HeaderText="Salida" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="fecha_observado" DataFormatString="{0:d}" HeaderText="Observada" />
                            <asp:BoundField DataField="fecha_autorizada" DataFormatString="{0:d}" HeaderText="Autorizada" />
                            <asp:BoundField DataField="fecha_cancelada" DataFormatString="{0:d}" HeaderText="Cancelada" />
                        </Columns>                        
                    </asp:GridView>
                   
                  
    </div>  
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="server" 
TargetControlID="pFechas" 
CollapsedSize="0" 
Collapsed="false" 
ExpandControlID="dFechas" 
CollapseControlID="dFechas" 
ExpandDirection="Vertical"/> 
</div>
    
    <div class="card">
  <div class="card-header" id="dCambios" style="cursor:pointer">
	<img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase">Historial de Cambios</font>
  </div>
  <asp:Panel ID="pCambios" runat="server">
  <div class="card-body table-responsive">
            <asp:GridView ID="gvCambios" runat="server" AutoGenerateColumns="False"
            CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom"
                    EmptyDataText="No se encontraron cambios.">
                    
                    <Columns>
                        <asp:BoundField DataField="estado" HeaderText="Estado"></asp:BoundField>
                        <asp:BoundField DataField="fecha_estado" HeaderText="Fecha Estado" DataFormatString="{0:d}">
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha Actualización"></asp:BoundField>
                        <asp:BoundField DataField="estado_anterior" HeaderText="Estado Anterior" />
                    </Columns>                    
                </asp:GridView>        
                  
    </div>  
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
TargetControlID="pCambios" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="dCambios" 
CollapseControlID="dCambios" 
ExpandDirection="Vertical"/> 
</div>
    
    <div class="card">
  <div class="card-header" id="dIntervenciones" style="cursor:pointer">
	<img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase">Historial Organismos Intervinientes </font>
  </div>
  <asp:Panel ID="pIntervenciones" runat="server">
  <div class="card-body table-responsive">
          <asp:GridView ID="gvInterv" runat="server" AutoGenerateColumns="False" 
          CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom"
                    EmptyDataText="No se encontraron intervenciones.">                    
                    <Columns>
                        <asp:BoundField DataField="descripcion" HeaderText="Organismo Interv"></asp:BoundField>
                        <asp:BoundField DataField="fecha_iniciado" HeaderText="Iniciado" DataFormatString="{0:d}">
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha_finalizado" DataFormatString="{0:d}" HeaderText="Finalizado">
                        </asp:BoundField>
                        <asp:BoundField DataField="estado" HeaderText="Estado"></asp:BoundField>
                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones"></asp:BoundField>
                        <asp:BoundField DataField="fecha_denegado" DataFormatString="{0:d}" HeaderText="Denegado" />
                        <asp:BoundField DataField="motivo_rechazo" HeaderText="Motivo" />
                    </Columns>                    
                </asp:GridView>          
                  
    </div>  
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" 
TargetControlID="pIntervenciones" 
CollapsedSize="0" 
Collapsed="true" 
ExpandControlID="dIntervenciones" 
CollapseControlID="dIntervenciones" 
ExpandDirection="Vertical"/> 
</div>
    
    <div class="card">
  <div class="card-header" id="dItemsDeclarados" style="cursor:pointer">
	<img height="7" src="images/flecha_1.gif" width="4" /><font class="text-uppercase">Detalle Items Declarados </font>
  </div>
  <asp:Panel ID="pItemsDeclarados" runat="server">
  <div class="card-body table-responsive">
           <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" 
           CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                    
                    <Columns>
                        <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/images/search.gif"/>
                        <asp:BoundField HeaderText="Nro Item" DataField="nro_item" />
                        <asp:BoundField HeaderText="Pos. Arancelaria" DataField="posicion_arancelaria" />
                        <asp:BoundField HeaderText="Tipo Unidad" DataField="unidad_declarada"></asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad Total" DataField="cantidad_total">
                            <ControlStyle CssClass="text" ForeColor="DarkBlue" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cantidad_consumida" HeaderText="Cantidad Consumida">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="restante" HeaderText="Cantidad Restante">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fob_total" HeaderText="Valor Fob">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="saldo_fob" HeaderText="Saldo Fob">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>                    
                </asp:GridView>          
                <br />
                <div id="updateProgressDiv" style="display: none; height: 40px; width: 300px; z-index: 400;
                    left: 300px;">
                    <img src="../Img/LOADING.gif" />
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
                        <asp:Label ID="lblItem" runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="Small"></asp:Label><br />
                        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False"
                            AllowPaging="True" PageSize="25" EmptyDataText="No se encontraron consumos"
                            CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100" 
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" 
                        PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">                            
                            <Columns>
                                <asp:BoundField HeaderText="Fecha" DataField="fecha_oficializacion" />
                                <asp:BoundField HeaderText="Despacho" DataField="despacho" />
                                <asp:BoundField HeaderText="Interno" DataField="identificador_propio" />
                                <asp:BoundField HeaderText="Nro Item" DataField="nro_item" />
                                <asp:BoundField HeaderText="Pos. Arancelaria" DataField="posicion_arancelaria" />
                                <asp:BoundField HeaderText="Tipo Unidad" DataField="unidad_declarada"></asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad_declarada">
                                    <ControlStyle CssClass="text" ForeColor="DarkBlue" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="monto_fob_dol" HeaderText="Valor Fob">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>                            
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvItems" EventName="SelectedIndexChanging">
                        </asp:AsyncPostBackTrigger>
                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>  
    </div>  
  </asp:Panel>
  <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" 
TargetControlID="pItemsDeclarados" 
CollapsedSize="0" 
Collapsed="false" 
ExpandControlID="dItemsDeclarados" 
CollapseControlID="dItemsDeclarados" 
ExpandDirection="Vertical"/> 
</div>
    
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
            
    <!-- Tabla de movimiento entre resultados -->
    <br />
    <div id="Boton" align="center">
        <asp:ImageButton ID="ImageButton2" runat="server" Height="28px" ImageUrl="~/images/icono-csv.png"
            Width="28px" Visible="False" />
        </div>
    </form>
</body>
</html>
