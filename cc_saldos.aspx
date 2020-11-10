<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="cc_saldos.aspx.vb" Inherits="cc_saldos" title="Cuentas Corrientes - Saldos Finales" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:Panel ID="pnlBuscador" runat="server" Wrap="true" CssClass="form-buscador">
        <div class="form-inline"  oninit="MM_showHideLayers('Saldos','','show')">
        
           
            <div class="form-group mr-1">
              <img height="7" src="images/flecha_1.gif" width="4" class="mr-2" />
                Cuentas Corrientes - Saldos (al día del corriente, <font color="red">
                    <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label>)</font>
            </div>

       
            
            
        </div>       
    </asp:Panel>


    <br /> 
        <div id="updateProgressDiv1" style="display: none; height: 20px; width: 100%; z-index: 400; text-align: center;">
                    <img src="images/LOADING.gif" width=200px height= 10px />
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
                <table border="0" cellpadding="0" cellspacing="1" width="98%" class="table table-sm table-condensed small-top-margin table-bordered">
                    <tr align="middle" bgcolor="#4c91bd" class="GridEncabezado">
                        <td>
                        </td>
                        <td>
                            Débito</td>
                        <td>
                            Crédito</td>
                        <td>
                            Saldo</td>
                    </tr>
                    <tr class="GridItem">
                        <td align="middle">
                            Cuentas Corrientes:</td>
                        <td align="right">
                            <asp:Label ID="D1" runat="server"></asp:Label></td>
                        <td align="right">
                            <asp:Label ID="C1" runat="server"></asp:Label></td>
                        <td align="right">
                            <asp:Label ID="S1" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="GridItem">
                        <td align="middle">
                            Anticipos:</td>
                        <td align="right">
                            <asp:Label ID="D2" runat="server"></asp:Label></td>
                        <td align="right">
                            <asp:Label ID="C2" runat="server"></asp:Label></td>
                        <td align="right">
                            <asp:Label ID="S2" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="GridItem">
                        <td align="middle">
                            <b>Total a cobrar:</b></td>
                        <td align="right">
                            <b>
                                <asp:Label ID="D3" runat="server"></asp:Label></b></td>
                        <td align="right">
                            <b>
                                <asp:Label ID="C3" runat="server"></asp:Label></b></td>
                        <td align="right">
                            <b>
                                <asp:Label ID="S3" runat="server"></asp:Label></b></td>
                    </tr>                    
                </table>
    
    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ImageButton1" EventName="Click" />                        
        </Triggers>
    </asp:UpdatePanel>    
    <br />
    <br />    
    <div style="text-align:center">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/b_consultar.gif"
                                EnableViewState="False" Visible="False" /></td>
    </div>
</asp:Content>

