<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pruebas.aspx.vb" Inherits="pruebas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
    Fecha: <asp:TextBox ID="TextBox1" runat="server" Width="80"></asp:TextBox> 

<asp:Panel ID="Panel1" runat="server" Height="50px" Width="300px" BackColor="Transparent">
hola
    <asp:Image ID="Image1" runat="server" ImageUrl="images/collapse.jpg" onclick="javascript:$find('PopupControlExtender2').hidePopup();" />   
</asp:Panel>

<ajaxToolkit:PopupControlExtender ID="PopupControlExtender2" runat="server" 
TargetControlID="Image1"
PopupControlID="Panel1" Position="Right"
DynamicControlID="Panel1"
DynamicServiceMethod="GetDynamicContent"
DynamicContextKey='<%#Eval("idReclamo") %>'
>
                            </ajaxToolkit:PopupControlExtender>
                            
                             
<%--<ajaxToolkit:ModalPopupExtender ID="PopupControlExtender1" runat="server" 
TargetControlID="TextBox1" 
PopupControlID="Panel1" 
CancelControlID="Image1"/> 
--%>
    </div>
    </form>
</body>
</html>
