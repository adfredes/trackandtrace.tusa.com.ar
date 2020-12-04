<%@ Page Title="CT&T - Flow" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="ctt_flow.aspx.vb" Inherits="ctt_flow" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    

     <asp:Panel ID="pnlBuscador" runat="server" Wrap="true" CssClass="form-buscador" DefaultButton="ImageButton2">
        <div class="form-inline">
            
            <div class="form-group mr-1">                
                  <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="form-group mr-1">
               <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="%portación">[Tipo Operaci&#243;n]</asp:ListItem>
                            <asp:ListItem Value="Importación">Importaci&#243;n</asp:ListItem>
                            <asp:ListItem Value="Exportación">Exportaci&#243;n</asp:ListItem>
                        </asp:DropDownList>  
            </div>
            <div class="form-group mr-1">
                <asp:TextBox ID="txtReferencia" runat="server" CssClass="form-control form-control-sm" placeholder="Referencia"></asp:TextBox>
            </div>

 <div class="form-group mr-1">
                <asp:DropDownList ID="ddlChart" runat="server" AutoPostBack="True" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="1">BAR</asp:ListItem>
                    <asp:ListItem Value="2" Selected ="True">COLUMN</asp:ListItem>
                    <asp:ListItem Value="3">LINE</asp:ListItem>
                    <asp:ListItem Value="4">STACKEDBAR</asp:ListItem>
                    <asp:ListItem Value="5">STACKERCOLUMN</asp:ListItem>
                    <asp:ListItem Value="6">STACKEDBAR100</asp:ListItem>
                    <asp:ListItem Value="7">STACKERCOLUMN100</asp:ListItem>
                </asp:DropDownList>      
                </div>
                <div class="form-group mr-1">          
                <asp:DropDownList ID="ddl3d" runat="server" AutoPostBack="True" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="1">En 2D</asp:ListItem>
                    <asp:ListItem Value="2">En 3D</asp:ListItem>
                </asp:DropDownList>
                </div>
                <div class="form-group mr-1">
                <asp:DropDownList ID="ddlWidth" runat="server" AutoPostBack="true" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="25%">25%</asp:ListItem>
                    <asp:ListItem Selected="True" Value="50%">50%</asp:ListItem>
                    <asp:ListItem Value="75%">75%</asp:ListItem>
                    <asp:ListItem Value="100%">100%</asp:ListItem>
                </asp:DropDownList>
                </div>

            <div class="form-group ml-2">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/search.gif" class="botonBuscar botonBuscarGraficos"/>
                
            </div>      
        </div>            
    </asp:Panel>    

    <div ng-cloak>
  <md-content>
    <md-tabs md-dynamic-height md-border-bottom>
      <md-tab label="Operación" onClick="mostrar('dOpe')" id="tabInicio">
      </md-tab>
      <md-tab label="Transporte" onClick="mostrar('dTrp')">
      </md-tab>
      <md-tab label="Destinación" onClick="mostrar('dDes')">
      </md-tab>
      <md-tab label="Canal" onClick="mostrar('dCanal')">
      </md-tab>
      <md-tab label="Aduana" onClick="mostrar('dAduana')">
      </md-tab>
      <md-tab label="Base Imponible" onClick="mostrar('dBaseImponible')">
      </md-tab>
      <md-tab label="FOB" onClick="mostrar('dFob')">
      </md-tab>
      <md-tab label="CIF" onClick="mostrar('dCIF')">
      </md-tab>
      <md-tab label="Flete" onClick="mostrar('dFlete')">
      </md-tab>
      <md-tab label="PAGADO" onClick="mostrar('dGastos')">
      </md-tab>
      <md-tab label="Arribo-Oficialización" onClick="mostrar('dArriboOfi')">
      </md-tab>
      <md-tab label="Oficialización-Cancelado/Liberado" onClick="mostrar('dOfiEntrega')">
      </md-tab>
      <md-tab label="Arribo-Cancelado/Liberado" onClick="mostrar('dArriboEntrega')">
      </md-tab>      
        <md-tab label="TODOS" onClick="mostrar(null)">
      </md-tab>      
      </md-tabs>
      </md-content>      
      </div>

   
    <div id="updateProgressDiv1" style="display: none; height: 100px; width: 100%; z-index: 400; text-align: center;">
                    <br />
                    <img src="images/LOADING.gif" />
    </div>
  
    <div style="text-align: center">
        <cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server"
            TargetControlID="UpdatePanel2" Enabled="True">
            <animations>
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
      </OnUpdated></animations>    
        </cc1:UpdatePanelAnimationExtender>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
            
            <asp:Panel ID="pGraficos" runat="server">            
                <div id="dOpe" style="page-break-after: always;" class="MostrarDivGrafico">
                <fieldset>                    
                    <h4 class="p-4 d-none">x TIPO OPERACIÓN</h4>
                    <asp:GridView ID="GridView6" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart1" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                       
                    <hr class="d-none" /></fieldset>                
                </div>
                
                <div id="dTrp" style="page-break-after: always;" class="OcultarDivGrafico">
                <fieldset>         
                    <h4 class="p-4 d-none">x TIPO TRANSPORTE</h4>
                    <asp:GridView ID="GridView7" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart2" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>                
                </div>
                
                <div id="dDes" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>                    
                        <h4 class="p-4 d-none">x DESTINACIÓN</h4>
                    <asp:GridView ID="GridView8" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart3" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>                
                </div>
                
                <div id="dCanal" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>              
                        <h4 class="p-4 d-none">x CANAL</h4>
                    <asp:GridView ID="GridView9" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart4" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>                
                </div>
                
                <div id="dAduana" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>           
                        <h4 class="p-4 d-none">x ADUANA</h4>
                    <asp:GridView ID="GridView10" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart5" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>                
                </div>

                <div id="dBaseImponible" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>                    
                        <h4 class="p-4 d-none">BASE IMPONIBLE</h4>
                    <asp:GridView ID="GridView12" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart12" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>             
                </div>


                <div id="dFob" style="page-break-after: always;" class="OcultarDivGrafico">                    
                    <fieldset>                    
                        <h4 class="p-4 d-none">TOTAL FOB </h4>
                    <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart9" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>             
                </div>

                 <div id="dCIF" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>    
                        <h4 class="p-4 d-none">TOTAL CIF</h4>
                    <asp:GridView ID="GridView4" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart10" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>             
                </div>

                 <div id="dFlete" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>        
                        <h4 class="p-4 d-none">TOTAL FLETE</h4>
                    <asp:GridView ID="GridView5" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart11" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" /></fieldset>             
                </div>

                <div id="dGastos" style="page-break-after: always;" class="OcultarDivGrafico">
                    <fieldset>                    
                        <h4 class="p-4 d-none">PAGADO X CONCEPTO</h4>
                    <asp:GridView ID="GridView13" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart13" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    <hr class="d-none" />

                    </fieldset>             
                </div>

                
                <div id="dArriboOfi" style="page-break-after: always;" class="OcultarDivGrafico">
                <fieldset>     
                    <h4 class="p-4 d-none">ARRIBO-OFICIALIZACIÓN </h4>
                    <asp:GridView ID="GridView11" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart6" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart> 
                    <hr class="d-none" />
                    </fieldset>
                </div>
                
                <div id="dOfiEntrega" class="OcultarDivGrafico">                
                <fieldset>  
                    <h4 class="p-4 d-none">OFICIALIZACIÓN-CANCELADO/LIBERADO</h4>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart7" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>   
                    <hr class="d-none" />
                    </fieldset>
                </div>
                
                <div id="dArriboEntrega" class="OcultarDivGrafico">                
                <fieldset>                    
                    <h4 class="p-4 d-none">ARRIBO-CANCELADO/LIBERADO</h4>
                    <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="20" Width="100%">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00aadd" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:Chart ID="Chart8" runat="server" Width="627px" EnableViewState="True">
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>                    
                    </fieldset>
                </div>
                
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ImageButton2" EventName="Click" />                
                <asp:AsyncPostBackTrigger ControlID="ddlChart" EventName="SelectedIndexChanged" />                
                <asp:AsyncPostBackTrigger ControlID="ddl3d" EventName="SelectedIndexChanged" />   
                <asp:AsyncPostBackTrigger ControlID="ddlWidth" EventName="SelectedIndexChanged" />                                
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <script language="javascript" type="text/javascript">
        function onUpdating(control) {
            var updateProgressDiv = $get(control);
            updateProgressDiv.style.display = '';
        }
        function onUpdated(control) {
            var updateProgressDiv = $get(control);
            updateProgressDiv.style.display = 'none';
        }

        mostrar('dOpe');

        document.querySelector('.botonBuscarGraficos').addEventListener('click', function(e){            
            ResetTab();
        });

        function mostrar(divid) {
            if (divid) {
                let divsAOcultar = document.querySelectorAll('.MostrarDivGrafico');
                let divAMostrar = document.querySelector('#' + divid);
                divsAOcultar.forEach(div => div.className = 'OcultarDivGrafico');                
                divAMostrar.className = 'MostrarDivGrafico';
                let hr = divAMostrar.querySelector('hr');
                let h4 = divAMostrar.querySelector('h4');
                hr.classList.add('d-none');
                h4.classList.add('d-none');                
            }
            else {                
                let divsAMostrar = document.querySelectorAll('.OcultarDivGrafico');
                console.dir(divsAMostrar);
                divsAMostrar.forEach(div => div.className = 'MostrarDivGrafico');    
                let elementosAMostrar = document.querySelectorAll('.d-none');
                elementosAMostrar.forEach(div => div.classList.remove('d-none'));    
            }
        }

        function ResetTab(){            
            let tab = document.querySelector('#tabInicio');            
            tab.click();
        }
    </script>

</asp:Content>
