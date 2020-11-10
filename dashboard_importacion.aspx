<%@ Page Title="Dashboard Importación" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="dashboard_importacion.aspx.vb" Inherits="dashboard_importacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/Dashboard.css" rel="stylesheet" />        
    <script src="Scripts/Angular/Service/XhrService.js"></script>
    <script src="Scripts/Angular/Directive/MdDraggableDirective.js"></script>
    <script src="Scripts/Angular/Component/DashboardComponent.js"></script>
    <script src="Scripts/Angular/Component/DashboardItemComponent.js"></script>
    <script src="Scripts/Angular/Component/DashboardPieComponent.js"></script>
    <div class="m-2">

    
        <div class="row m-0 p-0">
            <div class="col-md-12 pl-0 pr-1 pl-1">
         <div class="card w-100 ml-1 mr-1">
            <div class="card-header text-uppercase">
                <h5 class="card-title">Operaciones Pendientes de Oficialización</h5>
            </div>
            <div class="card-body p-0 w-100 dashboard">
                <div md-draggable style="height: 100px; background-color: blue;"></div>
                <dash-board></dash-board>
            </div>
        </div>
                </div>
            </div>
        
        <div class="row m-0 p-0 mt-2">
            <div class="col-md-6 pl-0 pr-1 pl-1">
                <div class="card mt-2">
                    <div class="card-header text-uppercase">
                        <h5 class="card-title">Cantidad de Despachos</h5>
                    </div>
                    <div class="card-body row ">
                        <div class="p-0 text-center col-xl-6">
                            <asp:Chart ID="ChartTotalOperaciones" runat="server" CssClass="img-fluid" CanResize="true" Width="400px" Height="250px" EnableViewState="True">
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                        <div class="p-0 table-responsive text-center col-xl-6">
                            <asp:GridView ID="GridTotalOperaciones" runat="server" AutoGenerateColumns="True"
                                CssClass="w-auto table table-sm" Font-Bold="False"
                                RowStyle-CssClass="col-1 GridItem" HeaderStyle-CssClass="GridEncabezado">                                
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-md-6 pr-0 pl-1 pr-1">
                <div class="card mt-2">
                    <div class="card-header text-uppercase">
                        <h5 class="card-title">Valor Base Imponible</h5>
                    </div>
                    <div class="card-body row ">
                        <div class="p-0 col-xl-6 text-center">
                            <asp:Chart ID="ChartTotalImponible" runat="server" CssClass="img-fluid" CanResize="true" Width="400px" Height="250px" EnableViewState="True">
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                        <div class="p-0 table-responsive text-center col-xl-6">
                            <asp:GridView ID="GridTotalImponible" runat="server" AutoGenerateColumns="True"
                                CssClass="w-auto table table-sm" Font-Bold="False"
                                RowStyle-CssClass="col-1 GridItem" HeaderStyle-CssClass="GridEncabezado">                                
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        


        <div class="row d-none">
            <div class="col-md-4">
                <div class="card mt-4">
                    <div class="card-header text-uppercase">
                        <h5 class="card-title">Canales</h5>
                    </div>
                    <div class="card-body text-center">                        
                        
                            <asp:GridView ID="GridTotalCanales" runat="server" AutoGenerateColumns="True"
                                CssClass="w-auto table table-sm" Font-Bold="False"
                                RowStyle-CssClass="col-1 GridItem" HeaderStyle-CssClass="">                                
                            </asp:GridView>
                        
                    </div>

                </div>
            </div>

            <div class="col-md-4">
                <div class="card mt-4">
                    <div class="card-header text-uppercase">
                        <h5 class="card-title"></h5>
                    </div>
                    <div class="card-body">
                        
                    </div>

                </div>
            </div>

            <div class="col-md-4">
                <div class="card mt-4">
                    <div class="card-header text-uppercase">
                        <h5 class="card-title"></h5>
                    </div>
                    <div class="card-body">
                        
                    </div>

                </div>
            </div>
        </div>
</div>    










     <script>
         window.addEventListener('load', e => {
             let chartImponible = document.querySelector("[id$='ChartTotalImponible']");
             chartImponible.style.width = "auto";
             chartImponible.style.height = "auto";             

             let chartTotalOperaciones = document.querySelector("[id$='ChartTotalOperaciones']");
             chartTotalOperaciones.style.width = "auto";
             chartTotalOperaciones.style.height = "auto";
         });
        

     </script>
</asp:Content>

