<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ctt_carpeta.aspx.vb" Inherits="ctt_carpeta" %>

<!DOCTYPE html>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CT&T - Detalle Operacion</title>
    <link href="css/estilos.css" type="text/css" rel="stylesheet" />


    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Content/angular-material.min.css" rel="stylesheet" />    
        
  
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
    <script src="Scripts/Angular/Directive/MdDraggableDirective.js"></script>       

</head>
<body ng-app="tytApp" modal-handle>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


        <div class="card">
            <div class="card-header">
                <div id="dDetalleDespacho" style="cursor: pointer">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">DETALLE CARPETA</font>
                            </td>
                            <td style="text-align: right; vertical-align: text-bottom;">
                                <asp:Image ID="iDetalleDespacho" runat="server" />
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
            <asp:Panel ID="pDetalleDespacho" runat="server">
                <div class="card-body table-responsive container-fluid">
                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Código Interno</div>
                        <div class="col-3">
                            <asp:Label ID="identificador_propio" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Referencia Cliente</div>
                        <div class="col-3">
                            <asp:Label ID="referencia_cliente" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Tipo Operación </div>
                        <div class="col-3">
                            <asp:Label ID="tipooperacion" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Alta Carpeta</div>
                        <div class="col-3">
                            <asp:Label ID="fechaaltacarpeta" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Aduana</div>
                        <div class="col-3">
                            <asp:Label ID="aduana" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Agente de Carga </div>
                        <div class="col-3">
                            <asp:Label ID="agentecarga" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Arribo</div>
                        <div class="col-3">
                            <asp:Label ID="arribo" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Ata</div>
                        <div class="col-3">
                            <asp:Label ID="ata" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Bandera</div>
                        <div class="col-3">
                            <asp:Label ID="bandera" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">CID</div>
                        <div class="col-3">
                            <asp:Label ID="cid" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Cantidad Bultos</div>
                        <div class="col-3">
                            <asp:Label ID="cantidadbultos" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">CantidadEmbalajes</div>
                        <div class="col-3">
                            <asp:Label ID="cantidadembalajes" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Carga</div>
                        <div class="col-3">
                            <asp:Label ID="carga" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Descripcion</div>
                        <div class="col-3">
                            <asp:Label ID="descripcion" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Doc. Transporte </div>
                        <div class="col-3">
                            <asp:Label ID="doctransporte" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Embalaje</div>
                        <div class="col-3">
                            <asp:Label ID="embalaje" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Embarcador</div>
                        <div class="col-3">
                            <asp:Label ID="embarcador" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Embarque</div>
                        <div class="col-3">
                            <asp:Label ID="embarque" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Estado Manifiesto</div>
                        <div class="col-3">
                            <asp:Label ID="estadomanifiesto" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Lugar Entrega</div>
                        <div class="col-3">
                            <asp:Label ID="lugarentrega" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Lugar Giro</div>
                        <div class="col-3">
                            <asp:Label ID="lugargiro" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Manifiesto</div>
                        <div class="col-3">
                            <asp:Label ID="manifiesto" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Nombre Transporte</div>
                        <div class="col-3">
                            <asp:Label ID="nombretransporte" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Peso Bruto KG </div>
                        <div class="col-3">
                            <asp:Label ID="pesobrutokg" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Peso Guia</div>
                        <div class="col-3">
                            <asp:Label ID="pesoguia" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">PickUp</div>
                        <div class="col-3">
                            <asp:Label ID="pickup" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Present Mani</div>
                        <div class="col-3">
                            <asp:Label ID="presentmani" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Reg Mani</div>
                        <div class="col-3">
                            <asp:Label ID="regmani" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Transbordo</div>
                        <div class="col-3">
                            <asp:Label ID="transbordo" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Transportista</div>
                        <div class="col-3">
                            <asp:Label ID="transportista" runat="server" CssClass="texto"></asp:Label></div>
                    </div>

                    <div class="row pb-1">
                        <div class="col-3 font-italic font-weight-bold">Via</div>
                        <div class="col-3">
                            <asp:Label ID="via" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Volumen</div>
                        <div class="col-3">
                            <asp:Label ID="volument" runat="server" CssClass="texto"></asp:Label></div>
                    </div>
                    
                    <div class="row">
                        <div class="col-3 font-italic font-weight-bold">Lugar Entrega</div>
                        <div class="col-3">
                            <asp:Label ID="lblLE" runat="server" CssClass="texto"></asp:Label></div>
                        <div class="col-3 font-italic font-weight-bold">Giro del medio</div>
                        <div class="col-3">
                            <asp:Label ID="lblGM" runat="server" CssClass="texto"></asp:Label></div>
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
                    ExpandDirection="Vertical" />

            </asp:Panel>

        </div>

        <!-- fin del cuadrito de titulo de la tabla con datos -->

        <div class="card">
            <div class="card-header">
                <div id="dInformacion_Complementarias" style="cursor: pointer">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 4px">
                                <img height="7" src="images/flecha_1.gif" width="4" />
                            </td>
                            <td>
                                <font class="text-uppercase">INFORMACION COMPLEMENTARIA</font>
                            </td>
                            <td style="text-align: right; vertical-align: text-bottom;">
                                <asp:Image ID="iInformacion_Complementarias" runat="server" />
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
            <asp:Panel ID="pInformacion_Complementarias" runat="server">
                <div class="card-body table-responsive">

                    <asp:GridView ID="gvCamposPersonalizados" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table- table-sm table-condensed small-top-margin table-borderless w-100"
                        Font-Bold="False"
                        RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado"
                        PagerStyle-CssClass="GridPager"
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom">
                        <Columns>
                            <asp:BoundField DataField="nombre" HeaderText="Campo">
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
                        ExpandDirection="Vertical" />
                </div>
            </asp:Panel>
        </div>

    </form>
</body>
</html>
