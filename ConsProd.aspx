<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConsProd.aspx.vb" Inherits="ProjetoDashBoard.ConsProd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lblTitleConsProd" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Consultar Produto" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px"></td>
                <td style="height: 25px">
                    <asp:Panel ID="Panel1" runat="server" style="margin-left: 0px; border-radius:10px;" Width="100%" BackColor="#F0F0F0" HorizontalAlign="Center">
                        <table style="width: 100%">
                            <tr>
                                <td style="height: 24px"></td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px">
                                    </td>
                                <td style="height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="height: 70px"></td>
                                <td style="height: 70px">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nome:"></asp:Label>
                                </td>
                                <td style="height: 70px">
                                    <asp:TextBox ID="txtConsPNome" runat="server" CssClass="txtbox-custom" Width="200px"></asp:TextBox>
                                </td>
                                <td style="height: 70px">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Preco:"></asp:Label>
                                </td>
                                <td style="height: 70px">
                                    <asp:TextBox ID="txtConsPPreco" runat="server" CssClass="txtbox-custom" TextMode="Number" Width="200px"></asp:TextBox>
                                </td>
                                <td style="height: 70px">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Categoria:"></asp:Label>
                                </td>
                                <td style="height: 70px">
                                    <asp:DropDownList ID="DropDownProdCat" runat="server" CssClass="dropdownlist-custom" Width="200px">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Sala</asp:ListItem>
                                        <asp:ListItem>Quarto</asp:ListItem>
                                        <asp:ListItem>Cozinha</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="height: 70px">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fornecedor:"></asp:Label>
                                </td>
                                <td style="height: 70px">
                                    <asp:DropDownList ID="DropDownProdForn" runat="server" CssClass="dropdownlist-custom" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="ID_fornecedor" Width="200px" AppendDataBoundItems="True">
                                        <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome], [ID_fornecedor] FROM [Fornecedores]"></asp:SqlDataSource>
                                </td>
                                <td style="height: 70px"></td>
                            </tr>
                            <tr>
                                <td style="height: 50px"></td>
                                <td style="height: 50px"></td>
                                <td style="height: 50px"></td>
                                <td style="height: 50px"></td>
                                <td style="height: 50px"></td>
                                <td style="height: 50px"></td>
                                <td style="height: 50px"></td>
                                <td style="height: 50px; text-align: right;" colspan="2">
                                    <asp:Button ID="btnConsProd" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" OnClick="btnCadLoja_Click" style="border-radius: 20px;" Text="Consultar" Width="150px" />
                                </td>
                                <td style="height: 50px"></td>
                            </tr>
                            <tr>
                                <td colspan="10">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Produtos" Width="100%">
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                            <asp:BoundField DataField="PRODUTO" HeaderText="PRODUTO" SortExpression="PRODUTO" />
                                            <asp:BoundField DataField="DESCRICAO" HeaderText="DESCRICAO" SortExpression="DESCRICAO" />
                                            <asp:BoundField DataField="PRECO" HeaderText="PRECO" SortExpression="PRECO" />
                                            <asp:BoundField DataField="CATEGORIA" HeaderText="CATEGORIA" SortExpression="CATEGORIA" />
                                            <asp:BoundField DataField="QUANTIDADE" HeaderText="QUANTIDADE" SortExpression="QUANTIDADE" />
                                            <asp:BoundField DataField="FORNECEDOR" HeaderText="FORNECEDOR" SortExpression="FORNECEDOR" />
                                            <asp:ImageField DataImageUrlField="FOTO" HeaderText="FOTO" SortExpression="FOTO">
                                                <ControlStyle Width="50px" Height="50px" BorderColor="Black" />
                                            </asp:ImageField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEditProd" runat="server" CommandName="Edit" Text="Editar" CssClass="editButton" />
                                                    <asp:Button ID="btnDeleteProd" runat="server" CommandName="Delete" Text="Eliminar" CssClass="deleteButton" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Button ID="btnUpdateProd" runat="server" CommandName="Update" Text="Atualizar" CssClass="updateButton" />
                                                    <asp:Button ID="btnCancelProd" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="cancelButton" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="X-Large" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="Produtos" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Produtos.ID_froduto AS ID, Produtos.nome AS PRODUTO, Produtos.descricao AS DESCRICAO, Produtos.preco AS PRECO, Produtos.categoria AS CATEGORIA, Produtos.quantidade AS QUANTIDADE, Fornecedores.nome AS FORNECEDOR, Produtos.imagem AS FOTO FROM Produtos INNER JOIN Fornecedores ON Produtos.ID_fornecedor = Fornecedores.ID_fornecedor"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td style="height: 25px"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>

</asp:Content>
