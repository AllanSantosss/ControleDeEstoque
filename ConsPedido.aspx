<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConsPedido.aspx.vb" Inherits="ProjetoDashBoard.ConsPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lblTitleConsPedido" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Consultar Pedido" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="height: 69px"></td>
                                <td style="height: 69px">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="fornecedor:"></asp:Label>
                                </td>
                                <td style="height: 69px">
                                    <asp:DropDownList ID="DropDownConsPddForn" runat="server"  DataTextField="nome" DataValueField="ID_fornecedor" Width="200px" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Text ="" Value=""/>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="FornecedorPedido" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome], [ID_fornecedor] FROM [Fornecedores]"></asp:SqlDataSource>
                                </td>
                                <td style="height: 69px">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Produto:"></asp:Label>
                                </td>
                                <td style="height: 69px">
                                    <asp:DropDownList ID="DropDownConsPddPdd" runat="server" DataSourceID="ProdutoPedido" DataTextField="nome" DataValueField="ID_froduto" Width="200px" AppendDataBoundItems="true" AutoPostBack="True">
                                        <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="ProdutoPedido" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome], [ID_froduto] FROM [Produtos]"></asp:SqlDataSource>
                                </td>
                                <td style="height: 69px">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="De:"></asp:Label>
                                </td>
                                <td style="height: 69px">
                                    <asp:TextBox ID="txtboxDe" runat="server" TextMode="Date">

                                    </asp:TextBox>
                                </td>
                                <td style="height: 69px">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Ate:"></asp:Label>
                                </td>
                                <td style="height: 69px">
                                    <asp:TextBox ID="txtboxAte" runat="server" TextMode="Date"></asp:TextBox>
                                </td>
                                <td style="height: 69px"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" BackColor="#0066FF" BorderColor="#0066FF" BorderStyle="Dotted" Font-Bold="True" ForeColor="White" Height="45px" style="border-radius: 20px;" Text="Consultar" Width="150px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td colspan="8">
                                    <asp:Panel ID="Panel2" runat="server">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ConsultaPedido" Width="100%">
                                            <AlternatingRowStyle BackColor="#CCCCCC" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                                <asp:BoundField DataField="Fornecedor" HeaderText="Fornecedor" SortExpression="Fornecedor" />
                                                <asp:BoundField DataField="Data Pedido" HeaderText="Data Pedido" SortExpression="Data Pedido" />
                                                <asp:BoundField DataField="Data Entrega" HeaderText="Data Entrega" SortExpression="Data Entrega" />
                                                <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" SortExpression="Quantidade" />
                                                <asp:BoundField DataField="Produto" HeaderText="Produto" SortExpression="Produto" />
                                            </Columns>
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <SelectedRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="ConsultaPedido" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT 
    P.ID_pedido AS 'ID',
    F.nome AS 'Fornecedor',
    P.Data_pedido AS 'Data Pedido',
    P.Data_entrega_esperada AS 'Data Entrega',
    IP.quantidade AS 'Quantidade',
    PR.nome AS 'Produto'
FROM 
    Pedidos P
JOIN 
    Fornecedores F ON P.ID_fornecedor = F.ID_fornecedor
JOIN 
    Itens_pedido IP ON P.ID_pedido = IP.ID_pedido
JOIN 
    Produtos PR ON IP.ID_froduto = PR.ID_froduto;
"></asp:SqlDataSource>
                                    </asp:Panel>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>

</asp:Content>
