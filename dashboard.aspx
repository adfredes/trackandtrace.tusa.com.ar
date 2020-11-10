<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dashboard.aspx.vb" Inherits="dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script>
        window.location.href = 'dashboard_importacion.aspx';
    </script>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Content/angular-material.min.css" rel="stylesheet" />
    <link href="Content/chart.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.slim.js" type="text/jscript"></script>
    
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

    <script src="Scripts/Angular/Module/DashboardModule.js"></script>
    <script src="Scripts/Angular/Service/XhrService.js"></script>
    <script src="Scripts/Angular/Directive/MdDraggableDirective.js"></script>
    <script src="Scripts/Angular/Component/DashboardComponent.js"></script>
    <script src="Scripts/Angular/Component/DashboardItemComponent.js"></script>
    <script src="Scripts/Angular/Component/DashboardPieComponent.js"></script>
    <style type="text/css">
        header {
            background: rgba(51, 117, 119, 0.68);
            /*position: sticky;*/
            padding: 10px;
            color: white;
            margin-bottom: 1rem;
            /*height: 85px;*/
        }

            header img {
                height: 70px;
            }

        h1 {
            text-align: center;
            font-family: Roboto, sans-serif;
            text-shadow: 2px 2px 2px #333;
        }

        .dashboard .c0, .c1:hover, .c2:hover, .c3:hover {
            cursor: pointer;
        }

        .dashboard .c0, .c1, .c2, .c3 {
            border-radius: 50%;
            color: #fff;
            display: inline-block;
            height: 20px;
            width: 20px;
            text-align: center;
            font-weight: bold;
            line-height: 20px;
        }

        .dashboard .c0 {
            background-color: #0069D9;
        }

        .dashboard .c1 {
            background-color: #6bb16b;
        }

        .dashboard .c2 {
            background-color: #fed821;
        }

        .dashboard .c3 {
            background-color: red;
        }

        .dashboard table {
            border-collapse: collapse;
            font-size: .8rem;
            font-family: Roboto, Verdana, sans-serif;
        }

            .dashboard table tr td:nth-child(2) {
                text-align: right;
                padding-right: 5px;
                border-right: 1px solid #000;
                width: calc(12% - 50px);
            }

            .dashboard table tr td:nth-child(1) {
                text-align: right;
                padding-right: 5px;
                border-left: 1px solid #000;
                width: 50px;
            }

            .dashboard table tfoot tr:last-child td:first-child {
                border-left: none;
            }

        .dashboard .trBorder td {
            /*padding-top: 5px;
            padding-bottom: 5px;*/
            border-collapse: collapse;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .dashboard .cd {
            display: block;
            height: 20px;
            width: 20px;
            text-align: center;
        }

        .dashboard tbody tr td:nth-child(2) {
            width: auto;
            font-family: Roboto, Verdana, sans-serif;
            font-size: .7rem;
            font-weight: 900;
            Line-height: 25px;
        }

        .dashboard tbody tr td {
            width: 2.2%;
            text-align: center;
        }

        .dashboard tfoot tr td {
            width: 2.2%;
            font-family: Roboto, Verdana, sans-serif;
            font-size: .7rem;
            font-weight: 900;
            Line-height: 25px;
            text-align: center;
        }


        .dashboard md-tabs-canvas {
            background-color: rgba(51, 117, 119, 0.02);
        }


        .GridEncabezado {
            /*background: rgba(51, 117, 119, 0.80);*/
            /*font-family: Tahoma;
    font-size: 2rem;*/
            background: rgba(51, 117, 119, 0.1);
            text-transform: uppercase;
            /*color: White;*/
            text-decoration: none;
            text-align: center;
            font-size: 0.8rem;
        }

            .GridEncabezado > th {
                padding: 0.3rem !important;
            }


        .GridItem {
            /*font-family: Tahoma;
    font-size: 11px;*/
            color: Black;
            text-decoration: none;
            font-size: 0.7rem;
            white-space: nowrap;
            width: auto;
        }

            .GridItem > td {
                padding: 0.1rem !important;
            }
    </style>
</head>
<body ng-app="dashboardApp">
    <header class="m-0">
        <div class="container-fluid">
            <div class="row">
                <div class="pt-2 w-50 pl-4">
                    <h1 class="text-left">Dashboard Importación</h1>
                </div>
                <div class="w-50 pr-4 text-right">
                    <a href="/home.aspx"><img class="logo" src="images/logo_dark.png" title="Logo Tusa" /></a>                    
                </div>
            </div>
        </div>

    </header>
    <form runat="server" class="container-fluid p-1 m-0">

        <div class="card w-100">
            <div class="card-header text-uppercase">
                <h5 class="card-title">Operaciones Pendientes de Oficialización</h5>
            </div>
            <div class="card-body p-0 w-100 dashboard">
                <div md-draggable style="height: 100px; background-color: blue;"></div>
                <dash-board></dash-board>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card mt-4">
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

            <div class="col-md-6">
                <div class="card mt-4">
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
                                RowStyle-CssClass="col-1 GridItem" HeaderStyle-CssClass="GridEncabezado">                                
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


    </form>

    <script>
        let chartImponible = document.querySelector("#ChartTotalImponible");
        chartImponible.style.width = "auto";
        chartImponible.style.height = "auto";

        let chartTotalOperaciones = document.querySelector("#ChartTotalOperaciones");
        chartTotalOperaciones.style.width = "auto";
        chartTotalOperaciones.style.height = "auto";

    </script>

</body>
</html>
