<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CadLoja.aspx.vb" Inherits="ProjetoDashBoard.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="3">
                    <asp:Label ID="lblTitle" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Cadastro de Lojas" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px" colspan="2"></td>
                <td colspan="3" style="height: 25px"></td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px" colspan="2">&nbsp;</td>
                <td style="height: 25px; width: 1168px;">
                    
    <!-- Seus controles aqui -->


                    <asp:Panel ID="PnlCadL" runat="server" Height="275px" style="margin-left: 0px; border-radius:10px;" Width="100%" BackColor="#F0F0F0">
                        <table style="width: 100%" border="0">
                            <tr>
                                <td rowspan="5" style="width: 45px">&nbsp;</td>
                                <td style="height: 27px">
                                    </td>
                                <td style="width: 476px; height: 27px;">
                                    </td>
                                <td style="height: 27px">
                                    </td>
                                <td style="width: 415px; height: 27px;">
                                    </td>
                                <td rowspan="5" style="width: 45px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="height: 40px">
                                    <asp:Label ID="lblCLnome" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nome:"></asp:Label>
                                </td>
                                <td style="width: 476px; height: 40px;">
                                    <asp:TextBox ID="txtboxCadLojaNome" runat="server" Width="350px" CssClass="txtbox-custom" Height="40px"></asp:TextBox>
                                </td>
                                <td style="height: 40px">
                                    <asp:Label ID="lblCLnif" runat="server" Font-Bold="True" Font-Size="X-Large" Text="NIF:"></asp:Label>
                                </td>
                                <td style="width: 415px; height: 40px;">
                                    <asp:TextBox ID="txtboxCadLojaNif" runat="server" Width="300px" CssClass="txtbox-custom" Height="40px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCLEnd" runat="server" Text="Endereco:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                </td>
                                <td style="width: 476px">
                                    <asp:TextBox ID="txtboxCadLojaEnd" runat="server" Width="350px" CssClass="txtbox-custom" Height="40px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblCLemail" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Email:"></asp:Label>
                                </td>
                                <td style="width: 415px">
                                    <asp:TextBox ID="txtboxCadLojaEmail" runat="server" CssClass="txtbox-custom" Height="40px" TextMode="Email" ToolTip="exemplo@exemplo.com" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCLtel" runat="server" Text="Telefone:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                </td>
                                <td style="width: 476px">
                                    <asp:TextBox ID="txtboxCadLojaTel" runat="server" Width="350px" CssClass="txtbox-custom" Height="40px" TextMode="Phone" ViewStateMode="Disabled"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td style="width: 415px; text-align:center;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="width: 476px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="width: 415px; text-align:center;">
                                    <asp:Button ID="btnCadLoja" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" style="border-radius: 20px;" Text="Cadastrar" OnClick="btnCadLoja_Click" Width="150px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                        
                </td>
                <td style="height: 25px; width: 50px" colspan="2">&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
