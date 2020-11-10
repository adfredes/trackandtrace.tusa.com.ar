<%@ Page Language="VB" AutoEventWireup="false" CodeFile="factura.aspx.vb" Inherits="factura" title="Detalle Factura" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CT&T - Detalle Factura</title>    
    <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />    
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <div class="p-1 container">
        <div class="row">
            <div class="col-6 border"><img src="images/logo_factura.jpg" class="img-fluid"/></div>
            <div class="col-6 border">
                <div class="row pl-2">
                    <span>Factura Nº</span> <asp:Label ID="lblS" runat="server" CssClass="texto ml-2"></asp:Label> - <asp:Label ID="lblFA" runat="server" CssClass="texto"></asp:Label>
                </div>
                <div class="row pl-2">
                    <span>Fecha:</span> <asp:Label ID="lblF" runat="server" CssClass="texto ml-2"></asp:Label>
                </div>
                <div class="row pl-2">
                    C.U.I.T. 30-52254431-7
                </div>
                <div class="row pl-2">
                    ING. BRUTOS C.M. 901.185418-9
                </div>
                <div class="row pl-2">
                    FECHA INIC. ACT.: 21-12-71
                </div>
                <div class="row pl-2">
                    <span>Vencimiento:</span><asp:Label ID="lblFacVto" runat="server" CssClass="texto ml-2"></asp:Label>
                </div>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-7 border">
                <div class="row pl-2">
                    <asp:Label ID="lblCli" runat="server" CssClass="texto"></asp:Label>
                </div>
                <div class="row pl-2">
                    <asp:Label ID="lblDomi" runat="server" CssClass="texto"></asp:Label>
                </div>
                <div class="row pl-2">
                    <asp:Label ID="lblDomi2" runat="server" CssClass="texto"></asp:Label>
                </div>
                <div class="row pl-2">
                    <asp:Label ID="lblCuit" runat="server" CssClass="texto"></asp:Label>
                </div>
            </div>
            <div class="col-5 border">
                <div class="row pl-2">
                    <span>No. Cta. Cte.:</span><asp:Label ID="lblCta" runat="server" CssClass="texto ml-2"></asp:Label>
                </div>
                <div class="row pl-2">
                    <asp:Label ID="lblTF" runat="server" CssClass="texto"></asp:Label>
                </div>
                <div class="row pl-2">
                    <asp:Label ID="Label5" runat="server" CssClass="texto ml-2"></asp:Label>
                </div>
                <div class="row pl-2">
                    <asp:Label ID="Label6" runat="server" CssClass="texto ml-2"></asp:Label>
                </div>
            </div>
        </div>

        <div class="row border-left border-right border-top mt-2">
            <div class="col-12"><asp:Label ID="lblr1" runat="server" CssClass="texto"></asp:Label></div>            
        </div>
        <div class="row border-left border-right">
            <div class="col-12"><asp:Label ID="lblr2" runat="server" CssClass="texto"></asp:Label></div>            
        </div>
        <div class="row border-left border-right">
            <div class="col-12"><asp:Label ID="lblr3" runat="server" CssClass="texto"></asp:Label></div>            
        </div>
        <div class="row border-left border-right">
            <div class="col-12"><asp:Label ID="lblr4" runat="server" CssClass="texto"></asp:Label></div>            
        </div>
        <div class="row border-left border-right border-bottom">
            <div class="col-12"><asp:Label ID="lblr5" runat="server" CssClass="texto"></asp:Label></div>            
        </div>

        
        
            <div class="row border-left border-right border-top mt-2">
                    <div class="col-8">
                        
                    </div>                    
                    <div class="col-4 text-center border-left">                
                        <asp:Label ID="lblD" runat="server" CssClass="texto"></asp:Label>
                    </div>
                </div>

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <div class="row border-left border-right">
                <div class="col-8">
                    <asp:Label ID="label1" runat="server" Text='<%# string.Format("{0} {1}",Eval("gas_codigo"), Eval("fac_descripcion1")) %>'></asp:Label>
                </div>
                <div class="col-4 text-right border-left">                
                    <asp:Label ID="label2" runat="server" Text='<%# string.Format("{0:C}",Eval("fac_imptotal")) %>'></asp:Label>
                </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>      
                  
                <div class="row border-left border-right">
                    <div class="col-4 pt-5">
                        Esta liquidación:
                    </div>
                    <div class="col-4 pt-5">
                        <asp:Label ID="lblLiquidacion" runat="server" CssClass="texto"></asp:Label>
                    </div>
                    <div class="col-4 text-right border-left pt-5">                
                        
                    </div>
                </div>
                <div class="row border-left border-right">
                    <div class="col-4">
                        Vuestro Anticipo
                    </div>
                    <div class="col-4">
                        <asp:Label ID="lblRA" runat="server" CssClass="texto"></asp:Label>
                    </div>
                    <div class="col-4 text-right border-left">                
                    
                    </div>
                </div>
                <div class="row border-left border-right">
                    <div class="col-4">
                        Dif. a N/Favor
                    </div>
                    <div class="col-4">
                        <asp:Label ID="lblAFavor" runat="server" CssClass="texto"></asp:Label>
                    </div>
                    <div class="col-4 text-right border-left">                
                    
                    </div>
                </div>

                <div class="row border-left border-right">
                    <div class="col-8 font-italic">
                        Lugar de Pago: Avda. Belgrano 615 Piso 9. Capital Federal
                    </div>                    
                    <div class="col-4 text-right border-left">                
                    
                    </div>
                </div>

                <div class="row border-left border-right">
                    <div class="col-8 text-right text-uppercase pt-5">
                        subtotal
                    </div>                    
                    <div class="col-4 text-right border-left pt-5">                
                        <asp:Label ID="lblRS" runat="server" CssClass="texto"></asp:Label>
                    </div>
                </div>

                <div class="row border-left border-right">
                    <div class="col-8  text-right  text-uppercase">
                        I.V.A.
                    </div>                    
                    <div class="col-4 text-right border-left">                
                        <asp:Label ID="lblRI" runat="server" CssClass="texto"></asp:Label>
                    </div>
                </div>
                <div class="row border-left border-right border-bottom">
                    <div class="col-8 text-right  text-uppercase">
                        total
                    </div>                    
                    <div class="col-4 text-right border-left border-top">                
                        <asp:Label ID="lblRT" runat="server" CssClass="texto"></asp:Label>
                    </div>
                </div>
                
            
                      
        </div>

    
    <br />    
</form>
</body>
</html>

