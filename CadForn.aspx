<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CadForn.aspx.vb" Inherits="ProjetoDashBoard.CadForn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
    <br />
    <table style="width: 100%">
        <tr>
            <td>&nbsp;</td>
            <td>
                    <asp:Label ID="lblTitleForn" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Cadastro de Fornecedor" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
                </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="#F0F0F0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 94px">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 94px">&nbsp;</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nome:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCadFornNome" runat="server" CssClass="txtbox-custom" Width="300px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Email:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCadFornEmail" runat="server" CssClass="txtbox-custom" Width="300px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 94px">&nbsp;</td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Endereco:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCadFornEnd" runat="server" CssClass="txtbox-custom" Width="300px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nif:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCadFornNif" runat="server" CssClass="txtbox-custom" TextMode="Number"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 94px"></td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Telefone:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCadFornTel" runat="server" CssClass="txtbox-custom" TextMode="Phone"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 94px">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td style="text-align:center">
                                <asp:Button ID="btnCadForn" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="Cadastrar" Height="45px" Width="150px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 94px">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</p>

</asp:Content>
