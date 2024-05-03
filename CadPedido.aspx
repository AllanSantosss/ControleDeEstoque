<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CadPedido.aspx.vb" Inherits="ProjetoDashBoard.CadPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td style="height: 68px"></td>
                <td style="height: 68px">
                    <asp:Label ID="lblTitleCadPedido" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Cadastrar Pedido" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
                </td>
                <td style="height: 68px"></td>
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
                                <td style="height: 24px"></td>
                                <td style="width: 215px; height: 24px;"></td>
                                <td style="width: 256px; height: 24px;"></td>
                                <td style="height: 24px"></td>
                                <td style="height: 24px"></td>
                                <td style="height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="height: 24px"></td>
                                <td style="width: 215px; height: 24px">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fornecedor:"></asp:Label>
                                </td>
                                <td style="width: 256px; height: 24px">
                                    <asp:DropDownList ID="DropDownFornPdd" runat="server"  DataTextField="nome" DataValueField="ID_fornecedor" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Fornecedor2" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome], [ID_fornecedor] FROM [Fornecedores]"></asp:SqlDataSource>
                                </td>
                                <td colspan="2" rowspan="5">
                                    <asp:Panel ID="Panel2" runat="server" BackColor="White" Height="274px" Width="100%" BorderStyle="Solid">
                                        <asp:GridView ID="GridViewCadProd" runat="server" Width="100%" Height="270px" BackColor="#CCCCCC">
                                            <HeaderStyle BackColor="Black" BorderColor="Black" Font-Bold="True" ForeColor="White" Height="20%" />
                                            <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </td>
                                <td style="height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="height: 37px"></td>
                                <td style="width: 215px; height: 37px">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Produto:"></asp:Label>
                                </td>
                                <td style="width: 256px; height: 37px">
                                    <asp:DropDownList ID="DropDownProdPdd" runat="server" DataSourceID="Produtos2" DataTextField="nome" DataValueField="ID_froduto" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Produtos2" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Produtos]"></asp:SqlDataSource>
                                </td>
                                <td style="height: 37px"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="width: 215px">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Quantidade:"></asp:Label>
                                </td>
                                <td style="width: 256px">
                                    <asp:TextBox ID="txtQuantidade" runat="server" CssClass="txtbox-custom" TextMode="Number" Width="100px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="width: 215px">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Data:"></asp:Label>
                                </td>
                                <td style="width: 256px">
                                    <asp:TextBox ID="txtDataPdd" runat="server" CssClass="txtbox-custom" TextMode="Date" Width="150px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="height: 61px"></td>
                                <td style="width: 215px; height: 61px;">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Data Entrega:"></asp:Label>
                                </td>
                                <td style="width: 256px; height: 61px;">
                                    <asp:TextBox ID="txtDataEntregaPdd" runat="server" CssClass="txtbox-custom" TextMode="Date" Width="150px"></asp:TextBox>
                                </td>
                                <td style="height: 61px"></td>
                            </tr>
                            <tr>
                                <td style="height: 36px"></td>
                                <td style="width: 215px; height: 36px;">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Status:"></asp:Label>
                                </td>
                                <td style="width: 256px; height: 36px;">
                                    <asp:DropDownList ID="DropDownStatusPdd0" runat="server" Width="150px">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Pendendente</asp:ListItem>
                                        <asp:ListItem>Concluida</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="height: 36px"></td>
                                <td style="height: 36px; text-align:right;">
                                    <asp:Button ID="btnCadPddPrd" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" ForeColor="White" Height="45px" Text="Cadastrar" Width="150px" />
                                </td>
                                <td style="height: 36px"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="width: 215px">&nbsp;</td>
                                <td style="width: 256px">
                                    <asp:ImageButton ID="ImageButton3" runat="server" Height="35px" ImageUrl="~/Imagem/mais.png" Width="35px" />
                                </td>
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
