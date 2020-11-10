<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" Title="Sistema - Bienvenida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="d-flex flex-row align-items-stretch h-100 flex-wrap">
       <div class="col-md-4 p-1 h-50">
           <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">Importaciones de hoy</h5>
                </div>
                <div class="card-body p-0 table-responsive text-center">         
                    <asp:Label ID="lblImpo" runat="server" Text="" CssClass="text-uppercase  font-italic" Visible="false"></asp:Label>
                     <asp:GridView ID="GridImpo" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-sm w-100" Font-Bold="False"
                         RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" >                        
                        <Columns>
                            <asp:BoundField HeaderText="Despacho" DataField="despacho" />  
                            <asp:BoundField HeaderText="Ref" DataField="identificador_cliente" />                                                      
                            <asp:BoundField HeaderText="Turno Pto" DataField="TurnoPuerto"></asp:BoundField>                            
                            <asp:BoundField HeaderText="Canal" DataField="Canal"></asp:BoundField>                     
                            
                        </Columns>                                                
                    </asp:GridView>
                </div>

            </div>   
       </div>

        <div class="col-md-4 p-1 h-50">
           <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">Exportaciones de hoy</h5>
                </div>
                <div class="card-body p-0 table-responsive text-center">                    
                    <asp:Label ID="lblExpo" runat="server" Text="" CssClass="text-uppercase   font-italic" Visible="false"></asp:Label>
                     <asp:GridView ID="GridExpo" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-sm w-100" Font-Bold="False"
                         RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" >
                        <Columns>
                            <asp:BoundField HeaderText="Despacho" DataField="despacho" />  
                            <asp:BoundField HeaderText="Ref" DataField="identificador_cliente" />                                                      
                            <asp:BoundField HeaderText="Aduana" DataField="AduanaDestino"></asp:BoundField>                            
                            <asp:BoundField HeaderText="Canal" DataField="Canal"></asp:BoundField>                     
                            
                        </Columns>                                                
                    </asp:GridView>
                </div>

            </div>   
       </div>

        <div class="col-md-4 p-1 h-50">
           <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">Simis de hoy</h5>
                </div>
                <div class="card-body p-0 table-responsive text-center">       
                    <asp:Label ID="lblSimi" runat="server" Text="" CssClass="text-uppercase font-italic" Visible="false"></asp:Label>
                     <asp:GridView ID="GridSimi" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-sm w-100" Font-Bold="False"
                         RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" >
                        <Columns>
                            <asp:BoundField HeaderText="Despacho" DataField="despacho" />  
                            <asp:BoundField HeaderText="Ref" DataField="identificador_cliente" />                                                      
                            <asp:BoundField HeaderText="Aduana" DataField="AduanaOrigen"></asp:BoundField>                            
                            <asp:BoundField HeaderText="Estado" DataField="estado_declaracion"></asp:BoundField>                     
                            
                        </Columns>                                                
                    </asp:GridView>
                </div>

            </div>   
       </div>

       <div class="col-md-4 p-1">
            <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">Importaciones <%= DateTime.Now.Year.ToString() %></h5>
                </div>
                <div class="card-body table-responsive text-center">                    
                    <asp:Chart ID="ChartImpo" runat="server" CssClass="img-fluid chart" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart> 
                
                </div>

            </div>    
        </div>

        <div class="col-md-4 p-1">
            <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">Exportaciones <%= DateTime.Now.Year.ToString() %></h5>
                </div>
                <div class="card-body table-responsive text-center">                    
                    <asp:Chart ID="ChartExpo" runat="server" CssClass="img-fluid chart" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart> 
                
                </div>

            </div>    
        </div>

        <div class="col-md-4 p-1">
            <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">SIMIs <%= DateTime.Now.Year.ToString() %></h5>
                </div>
                <div class="card-body table-responsive text-center">                    
                    <asp:Chart ID="ChartSimis" runat="server" CssClass="img-fluid chart" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart> 
                
                </div>

            </div>    
        </div>

          <div class="col-md-6 p-1 d-none">
            <div class="card h-100">
                <div class="card-header text-center text-uppercase">
                    <h5 class="card-title">Comparativa</h5>
                </div>
                <div class="card-body table-responsive text-center">                    
                    <asp:Chart ID="ChartComparativa" runat="server" CssClass="img-fluid chart" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart> 
                
                </div>

            </div>    
        </div>

    </div>

     <script>
         let charts = document.querySelectorAll('.chart');         
         for (let i = 0; i < charts.length - 1; i++) {             
             charts[i].style.width = "auto";
             charts[i].style.height = "auto";
         }             

         let actualizar = () => {
             console.log('actualizado');
             //location.reload(true);
         };

         setInterval(actualizar, 400000);
     </script>
</asp:Content>

