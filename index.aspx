<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema - Ingreso al Sistema</title>
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale:1"/>
    <link  rel="icon"   href="images/favicon.ico" type="image/ico" />
    <link href="css/estilos.css" type="text/css" rel="stylesheet" />
    <link href="css/fontello.css" type="text/css" rel="stylesheet" />
    <%--<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap"
        rel="stylesheet">--%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
</head>
<body style="min-width:600px;">
    <form id="form1" runat="server" style="min-width:600px;">
        <header class="m-0 container-fluid" style="left: 0px; width: 100%;">
        
            <div class="row">
                
                <div class="col">
                                        <img class="logo" src="images/logo_dark.png" title="Logo Tusa" />
                </div>

                <div class="col text-right font-italic">                          
                          <h4 class="text-uppercase">Track & Trace</h4>    
                          <h6>Ingreso al sistema</h6>        
                </div>
            </div>
        
    </header>

        <div style="padding-top: 150px;" class="container">
            <div class="row" id="login">
                <div class="col-4"></div>
                <div class="col-4 border border-dark" style="border-radius:0.5rem;">
                    <div class="form-group">
                        <label for="txtUser" class="col-3 col-form-label font-weight-bold text-uppercase">Usuario</label>
                        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPas" class="col-3 col-form-label  font-weight-bold text-uppercase">Password</label>
                        <asp:TextBox ID="txtPas" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group row">
                        
                            <div class="col text-left font-italic">
                            <asp:Label ID="lblError" runat="server" CssClass="Texto" ForeColor="Red"></asp:Label>
                                </div>
                            <div class="col text-right">
                            <asp:LinkButton ID="ImageButton1" runat="server" CssClass="btn btn-success"><span class="icon-login"></span>Login</asp:LinkButton>
                                </div>
                        
                    </div>
                </div>
                <div class="col-4"></div>
            </div>
            <div class="row p-4" id="alerta" style="display:none;">
                <div class="col-4 p-4"></div>
                <div class="col-4 p-4 border border-dark w-100 text-danger font-weight-bold text-center" style="border-radius:0.5rem;">
                    
                        Su navegador no es compatible con esta página. Por favor utilize Chrome, Edge o Firefox.
                    
                </div>
                <div class="col-4 p-4"></div>
            </div>

         
            
            
        </div>
    </form>
    <script>        
        var IE10 = Boolean(this.navigator.userAgent.match(/(MSIE)/i)),
            IE11 = Boolean(this.navigator.userAgent.match(/(Trident)/i));

        var login = document.getElementById("login");
        var alerta = document.getElementById("alerta");

        if (IE10 || IE11) {
            login.style.display = 'none';
            alerta.style.display = 'flex';            
        }

    </script>
</body>
</html>
