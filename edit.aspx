<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="edit.aspx.vb" Inherits="edit" title="Sistema - Alta/Edición de usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="pnlBuscador" runat="server" Wrap="true" CssClass="form-buscador">
        <div class="form-inline"  oninit="MM_showHideLayers('Saldos','','show')">
        
           
            <div class="form-group mr-1">
              <img height="7" src="images/flecha_1.gif" width="4" class="mr-2" />
                Alta/Modificación de usuario</font>
            </div>

       
            
            
        </div>       
    </asp:Panel>
    <br />
    
                    <table border="0" cellpadding="0" cellspacing="1" class="table table-sm table-condensed small-top-margin table-bordered w-50 ml-auto mr-auto">
                        <tr>
                            <td style="width: 425px">
                                <table border="0" cellpadding="0" cellspacing="0" class="texto" style="width: 100%">
                                    <tr>
                                        <td align="left" class="texto" style="width: 60em; height: 18px;">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Nombre de usuario</td>
                                        <td width="80" style="height: 18px">
                                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                                                ErrorMessage="Debe ingresar el nombre del usuario.">*</asp:RequiredFieldValidator></td>
                                        <td valign="center" width="80" style="height: 18px">
                                            <asp:TextBox ID="txtNombre" runat="server" Width="418px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" height="18" width="80">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Contraseña</td>
                                        <td height="18" width="80">
                                            &nbsp;</td>
                                        <td height="18" width="80">
                                            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" Width="418px"></asp:TextBox><br />
                                            <asp:CheckBox ID="chkClave" runat="server" Text="Cambiar" Visible="False" Width="88px" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" height="18" valign="center">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Empresa</td>
                                        <td height="18">
                                            &nbsp;</td>
                                        <td height="18">
                                            <asp:DropDownList ID="ddlEmpresa" runat="server" Width="425px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="left" height="18" width="78">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Activo</td>
                                        <td height="18" width="70">
                                            &nbsp;</td>
                                        <td align="left">
                                            <asp:CheckBox ID="activo" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" height="18" width="80">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            E-mail</td>
                                        <td height="18" width="80">
                                            &nbsp;</td>
                                        <td height="18" width="80">
                                            <asp:TextBox ID="txtMail" runat="server" Width="418px"></asp:TextBox></td>
                                    </tr>                                    
                                    <tr>
                                        <td colspan="3">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="6">
                                            <img height="1" src="images/spacer.gif" width="1" />Permisos :</td>
                                        <br />
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="texto" colspan="2" height="18" width="120">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Customs Track &amp; Trace</td>
                                        <td>
                                            <asp:CheckBox ID="tyt" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="texto" colspan="2" height="18" width="120">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Dashboard Importación</td>
                                        <td>
                                            <asp:CheckBox ID="di" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="texto" colspan="2" height="18" width="100">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Freight Forwarding</td>
                                        <td>
                                            <asp:CheckBox ID="ff" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="texto" colspan="2" height="18" width="100">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Cuentas Corrientes</td>
                                        <td>
                                            <asp:CheckBox ID="cc" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="texto" colspan="2" height="18" width="100">
                                            <img height="7" src="images/flecha_1.gif" width="4" />
                                            Administracion</td>
                                        <td>
                                            <asp:CheckBox ID="admin" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>                                        
                                        <td align="right" colspan="3">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_aceptar.gif" />&nbsp;</td>
                                            <%--<img onclick="history.back(-1);" src="images/b_cancelar.gif" style="cursor:pointer" height="22" width="52"/>--%>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" Text="El usuario ya existe."
                                    Visible="False"></asp:Label></td>
                        </tr>
                    </table>
    
</asp:Content>

