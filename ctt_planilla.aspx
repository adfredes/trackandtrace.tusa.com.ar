<%@ Page Title="CT&T - Planilla" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ctt_planilla.aspx.vb" Inherits="ctt_planilla" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">    
</script>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="pnlBuscador" runat="server" Wrap="true">        
        <table border="0" cellpadding="0" cellspacing="0" class="textoTitulo" style="width: 100%">
            <tr>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro1.gif" width="6" />
                </td>
                <td background="images/fondo1.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" />
                </td>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro4.gif" width="6" />
                </td>
            </tr>
            <tr>
                <td background="images/fondo4.gif" width="6">
                    <img height="1" src="images/spacer.gif" width="1" />
                </td>
                <td bgcolor="#e9f1f6" class="textoB" height="10">
                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="textoB">
                        <asp:ListItem Selected="True" Value="0">[TIPOS]</asp:ListItem>
                        <asp:ListItem>Importación</asp:ListItem>
                        <asp:ListItem>Exportación</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;<asp:DropDownList ID="ddlNumero" runat="server" CssClass="textoB">
                        <asp:ListItem Selected="True" Value="identificador_propio">Interno</asp:ListItem>
                        <asp:ListItem>Despacho</asp:ListItem>
                        <asp:ListItem Value ="ref_cliente">Referencia</asp:ListItem>
                        <asp:ListItem Value="guia_conocimiento">Doc Embarque</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:TextBox ID="txtNumero" runat="server" CssClass="textoB" 
                        Width="130px"></asp:TextBox>
                    &nbsp;
                    <asp:DropDownList ID="ddlFechas" runat="server" CssClass="textoB" onchange="javascript:enable_fecha();">
                        <asp:ListItem Value="0">[FECHAS]</asp:ListItem>
                        <asp:ListItem Selected="True" Value = "fecha_oficializacion">Oficialización</asp:ListItem>
                        <%--<asp:ListItem Value ="fecha_arribo">Arribo</asp:ListItem>
                        <asp:ListItem Value="fecha_entrega">Entrega/Carga</asp:ListItem>--%>
                    </asp:DropDownList>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txtDesde" ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesde"
                        ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtDesde" runat="server" CssClass="textoB" Width="105px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtDesde_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtDesde">
                    </cc1:CalendarExtender>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="txtHasta" ErrorMessage="*" ValidationExpression="^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9] |[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHasta"
                        ErrorMessage="*" ValidationExpression="[0-9][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtHasta" runat="server" CssClass="textoB" Width="105px"></asp:TextBox>
                    &nbsp;<cc1:CalendarExtender ID="txtHasta_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtHasta">
                    </cc1:CalendarExtender>
                    <asp:CheckBox ID="chkSimi" runat="server" CssClass="textoB" 
                        Text="DJAI/RJAI/SIMI" />
                </td>
                <td background="images/fondo3.gif" width="6">
                    <img height="1" src="images/spacer.gif" width="1" />
                </td>
            </tr>
            <tr>
                <td background="images/fondo4.gif" width="6">
                    &nbsp;
                </td>
                <td bgcolor="#e9f1f6" class="textoB" height="10">
                    
                </td>
                <td background="images/fondo3.gif" width="6">
                    &nbsp;
                </td>
                </tr>
                <tr>
                    <td background="images/fondo4.gif" width="6">
                        &nbsp;
                    </td>
                    <td bgcolor="#e9f1f6" class="textoB" height="10" style="vertical-align:middle;">
                        <asp:DropDownList ID="ddlDestinacion" runat="server" CssClass="textoB">
                            <asp:ListItem Selected="True">Destinacion</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlAduana" runat="server" CssClass="textoB">
                            <asp:ListItem Selected="True">Aduana</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlVia" runat="server" CssClass="textoB">
                            <asp:ListItem Selected="True">Via</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlCanal" runat="server" CssClass="textoB">
                            <asp:ListItem Selected="True">Canal</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlProcedencia" runat="server" CssClass="textoB" 
                            Visible="False">
                            <asp:ListItem Selected="True">Procedencia</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList ID="ddlEstados" runat="server" CssClass="textoB">
                            <asp:ListItem Selected="True">Estados</asp:ListItem>
                        </asp:DropDownList>
                        <asp:ImageButton ID="ibBuscar" runat="server" CssClass="textoB" Height="18px" 
                            ImageUrl="~/images/search.gif" Width="18px" />
                        <asp:ImageButton ID="ibCsv" runat="server" CssClass="textoB" Height="18px" 
                            ImageUrl="~/images/icono-csv.png" Width="18px" />
                        <asp:CheckBox ID="chkItem" runat="server" CssClass="textoB" 
                            Text="Agrupar Excel" Visible="False" />
                    </td>
                    <td background="images/fondo3.gif" width="6">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="6" width="6">
                        <img height="6" src="images/cuadro2.gif" width="6" />
                    </td>
                <td background="images/fondo2.gif" height="6">
                    <img height="1" src="images/spacer.gif" width="1" />
                </td>
                <td height="6" width="6">
                    <img height="6" src="images/cuadro3.gif" width="6" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    
    <br />    
    <div id="updateProgressDiv1" style="display: none; height: 100px; width: 100%; z-index: 400; text-align: center;">
                    <img src="images/LOADING.gif" />
    </div>
    <cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server"
    TargetControlID="UpdatePanel1" Enabled="True">
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
    

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate> 
                     
        <asp:Panel ID="Panel1" runat="server">
            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td height="6" width="6">
                <img height="6" src="images/cuadro1.gif" width="6" /></td>
            <td background="images/fondo1.gif" height="6">
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td height="6" width="6">
                <img height="6" src="images/cuadro4.gif" width="6" /></td>
        </tr>
                <tr bgcolor="#4a92bd">
                    <td background="images/fondo4.gif" width="6">
                        &nbsp; </td>
                    <td style="background-color: #e9f1f6;">
                        
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                            Font-Bold="False" AllowPaging="True" PageSize="50" 
                            onmouseover="document.body.style.cursor='pointer';" 
                            onmouseout="document.body.style.cursor='default';"  style="cursor:pointer">
                            <Columns>
                                <asp:BoundField DataField="Transporte" HeaderText="Transporte" />
                                <asp:BoundField DataField="Referencia Cliente" 
                                    HeaderText="Referencia Cliente" />
                                <asp:BoundField DataField="Referencia Tusa" HeaderText="Referencia Tusa" />
                                <asp:BoundField DataField="País Origen" HeaderText="País Origen" />
                                <asp:BoundField DataField="País Procedencia" HeaderText="País Procedencia" />
                                <asp:BoundField DataField="Nr. B/L or AWB" HeaderText="Nr. B/L or AWB" />
                                <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
                                <asp:BoundField DataField="Factura Comercial" HeaderText="Factura Comercial" />
                                <asp:BoundField DataField="Cantidad de mercadería" 
                                    HeaderText="Cantidad de mercadería" />
                                <asp:BoundField DataField="LCL Ocean/AIR" HeaderText="LCL Ocean/AIR" />
                                <asp:BoundField DataField="Moneda" HeaderText="Moneda" />
                                <asp:BoundField DataField="Total FOB" HeaderText="Total FOB" />
                                <asp:BoundField DataField="Incoterm" HeaderText="Incoterm" />
                                <asp:BoundField DataField="Fecha de arribo del transporte" 
                                    DataFormatString="{0:d}" HeaderText="Fecha de arribo del transporte" />
                                <asp:BoundField DataField="Fecha de Oficialización" DataFormatString="{0:d}" 
                                    HeaderText="Fecha de Oficialización" />
                                <asp:BoundField DataField="Nº de registro" HeaderText="Nº de registro" />
                                <asp:BoundField DataField="Posición Arancelaria" 
                                    HeaderText="Posición Arancelaria" />
                                <asp:BoundField DataField="Canal" HeaderText="Canal" />
                                <asp:BoundField DataField="SIMI" HeaderText="SIMI" />
                                <asp:BoundField DataField="STATUS SIMI" HeaderText="STATUS SIMI" />
                                <asp:BoundField DataField="Fecha Simi" DataFormatString="{0:d}" 
                                    HeaderText="Fecha Simi" />
                                <asp:BoundField DataField="Carpeta SIMI" HeaderText="Carpeta SIMI" />
                                <asp:BoundField DataField="CIF" HeaderText="CIF" />
                            </Columns>
                            <FooterStyle BackColor="#4691BD" />
                            <RowStyle BackColor="#E9F1F6" CssClass="texto" ForeColor="Black" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <HeaderStyle BackColor="#4691BD" CssClass="encabezadoTabla" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <PagerSettings FirstPageImageUrl="~/images/pagina1_activo.gif" LastPageImageUrl="~/images/pagina4_activo.gif"
                                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/images/pagina3_activo.gif" Position="TopAndBottom"
                                    PreviousPageImageUrl="~/images/pagina2_activo.gif"></PagerSettings>
                            <PagerStyle HorizontalAlign="Right" />
                        </asp:GridView>
                        
                    </td>
                    <td background="images/fondo3.gif" width="6">
                        &nbsp; </td>
                </tr>
       <tr bgcolor="#4a92bd">
            <td width="6" background="images/fondo4.gif">
                </td>
            <td style="background-color: #e9f1f6; text-align: right;">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="" 
                    Font-Size="10pt"></asp:Label>
                    </td>
            <td width="6" background="images/fondo3.gif">
                </td>
        </tr>
        <tr>
            <td width="6" height="6">
                <img height="6" src="images/cuadro2.gif" width="6" /></td>
            <td height="6" background="images/fondo2.gif" >
                <img height="1" src="images/spacer.gif" width="1" /></td>
            <td width="6" height="6">
                <img height="6" src="images/cuadro3.gif" width="6" /></td>
        </tr>
    </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ibBuscar" EventName="Click" />            
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging"/>
        </Triggers>
    </asp:UpdatePanel>   
</asp:Content>

