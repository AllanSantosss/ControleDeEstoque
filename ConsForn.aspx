<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConsForn.aspx.vb" Inherits="ProjetoDashBoard.ConsForn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lblTitleConsProd" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Consultar Fornecedor" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
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
                                <td style="height: 68px"></td>
                                <td style="text-align:right; height: 68px;">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nome:"></asp:Label>
                                </td>
                                <td style="height: 68px">
                                    <asp:DropDownList ID="DropDownFornNome" runat="server" DataSourceID="Forn" DataTextField="nome" DataValueField="nome" AppendDataBoundItems="True">
                                        <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Forn" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome] FROM [Fornecedores]"></asp:SqlDataSource>
                                </td>
                                <td style="text-align:right; height: 68px;">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Produto:"></asp:Label>
                                </td>
                                <td style="height: 68px">
                                    <asp:DropDownList ID="DropDownFornProd" runat="server" DataSourceID="Prod" DataTextField="nome" DataValueField="nome" AppendDataBoundItems="True">
                                    <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Prod" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome] FROM [Produtos]"></asp:SqlDataSource>
                                </td>
                                <td style="height: 68px"></td>
                            </tr>
                            <tr>
                                <td style="heigth: 90px">&nbsp;</td>
                                <td style="heigth: 90px">&nbsp;</td>
                                <td style="heigth: 90px">&nbsp;</td>
                                <td style="heigth: 90px;">&nbsp;</td>
                                <td style="height: 45px; text-align: center; vertical-align: middle;">
                                    <asp:Button ID="btnConsForn" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" Style="border-radius: 20px;" Text="Consultar" Width="150px" />
                                </td>
                                <td style="heigth: 90px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="heigth: 30px">&nbsp;</td>
                                <td style="heigth: 30px">&nbsp;</td>
                                <td style="heigth: 30px">&nbsp;</td>
                                <td style="heigth: 30px">&nbsp;</td>
                                <td style="height: 30px">&nbsp;</td>
                                <td style="heigth: 30px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td colspan="4">
                                    <asp:GridView ID="GridViewForn" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_fornecedor" DataSourceID="Fornecedores" Width="100%" AllowPaging="True" PageSize="8">
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                        <Columns>
                                            <asp:BoundField DataField="ID_fornecedor" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_fornecedor" />
                                            <asp:BoundField DataField="nome" HeaderText="NOME" SortExpression="nome" />
                                            <asp:BoundField DataField="endereco" HeaderText="ENDERECO" SortExpression="endereco" />
                                            <asp:BoundField DataField="contato" HeaderText="TELEFONE" SortExpression="contato" />
                                            <asp:BoundField DataField="email" HeaderText="E-MAIL" SortExpression="email" />
                                            <asp:BoundField DataField="nif_forn" HeaderText="NIF" SortExpression="nif_forn" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEditForn" runat="server" CommandName="Edit" Text="Editar" CssClass="editButton" />
                                                    <asp:Button ID="btnDeleteForn" runat="server" CommandName="Delete" Text="Eliminar" CssClass="deleteButton" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Button ID="btnUpdateForn" runat="server" CommandName="Update" Text="Atualizar" CssClass="updateButton" />
                                                    <asp:Button ID="btnCancelForn" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="cancelButton" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="Black" BorderColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="Fornecedores" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Fornecedores.ID_fornecedor, Fornecedores.nome, Fornecedores.endereco, Fornecedores.contato, Fornecedores.email, Fornecedores.nif_forn FROM Fornecedores INNER JOIN Produtos ON Fornecedores.ID_fornecedor = Produtos.ID_fornecedor WHERE (Produtos.nome = 'Nome do Produto')"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td colspan="4">&nbsp;</td>
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
