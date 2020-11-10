<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="admin.aspx.vb" Inherits="admin" title="Sistema - Administración de Usuarios" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>  
        <asp:Panel ID="pnlBuscador" runat="server" Wrap="true" CssClass="form-buscador" DefaultButton="ibBuscar">
        <div class="form-inline">
        
           
            <div class="form-group mr-1">
                <md-input-container>
        <label>Usuario</label>
        <asp:TextBox ID="txtUsuario" runat="server"
                        Width="130px"></asp:TextBox>
      </md-input-container>
            </div>

            <div class="form-group mr-1">
                <md-input-container>
        <label>Empresa</label>
        <asp:TextBox ID="txtEmpresa" runat="server"
                        Width="230px"></asp:TextBox>
      </md-input-container>
            </div>
            
            <div class="form-group mr-1 d-none">
                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Selected="True">Estados</asp:ListItem>
                </asp:DropDownList>
            </div>            
            <div class="form-group mr-1">
                <asp:ImageButton ID="ibBuscar" runat="server" ImageUrl="~/images/search.gif"/>                
            </div>
            
        </div>        
    </asp:Panel>


   
    <br />
    <asp:Panel ID="Panel1" runat="server" CssClass="div-listado">
        <div class="table-responsive">
        
    <asp:GridView ID="gvListado" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-sm table-condensed small-top-margin table-borderless w-100" Font-Bold="False"
                        AllowPaging="True" PageSize="25" RowStyle-CssClass="GridItem" HeaderStyle-CssClass="GridEncabezado" PagerStyle-CssClass="GridPager" 
                        PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom"> 
                    
                    <Columns>
                        <asp:BoundField DataField="Nameid" HeaderText="Usuario" />
                        <asp:BoundField DataField="enterprise" HeaderText="Empresa" />
                        <%--<asp:BoundField DataField="email" HeaderText="E-Mail">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>--%>
                        <asp:ImageField DataImageUrlField="activo" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Activo">
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="tyt" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Track &amp; Trace">
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="di" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Dashboard">
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="cc" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Cuentas Corrientes">
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="ff" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Freight Forwarding">
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="admin" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Administrador">
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="admincuenta" DataImageUrlFormatString="images/{0}-block.gif"
                            HeaderText="Adm. Cuenta">
                        </asp:ImageField>
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/trash.gif" DeleteText=""
                            EditImageUrl="~/images/edit.gif" EditText="" InsertVisible="False" ShowCancelButton="False"
                            ShowDeleteButton="True" ShowEditButton="True">                            
                        </asp:CommandField>
                    </Columns>                    
                </asp:GridView>
                </div>
                </asp:Panel>
             
</asp:Content>

