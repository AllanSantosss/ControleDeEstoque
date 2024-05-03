<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ProjetoDashBoard._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="content px-3 py-4">
        <div class="container-fluid">
            <div class="mb-3">
                <h1 class="fw-bold fs-1 mb-5">Controle administrativo</h1>
                <div class="row">

                    <div class="row">
                        <!-- Início do Card de Controle de Produtos -->
                        <div class="col-12 col-md-6">
                            <div class="card border-0 bg-info bg-opacity-50">
                                <div class="card-body py-4 text-center">
                                    <h5 class="mb-2 fw-bold custom-class">Controle de Produtos</h5>
                                    <div class="mb-0">
                                        <span class="badge text-success me-2">+9.0%</span>
                                        <span class=" fw-bold">Ultimo Mês</span>
                                    </div>
                                    <!-- Botão "Saber mais" para Vendas -->
                                    <asp:Button ID="btnSaberMaisProdutos" runat="server" Text="Saber mais" CommandName="Produtos" OnClick="SaberMais_Click" CssClass="btn btn-success btn-sm mt-4" />
                                </div>
                            </div>
                        </div>
                        <!-- Fim do Card de Controle de Produtos -->

                        <!-- Início do Card de Controle de Clientes -->
                        <div class="col-12 col-md-6">
                            <div class="card border-0 bg-info bg-opacity-50">
                                <div class="card-body py-4 text-center">
                                    <h5 class="mb-2 fw-bold custom-class">Controle de Lojas</h5>
                                    <div class="mb-0">
                                        <span class="badge text-success me-2">+9.0%</span>
                                        <span class=" fw-bold">Ultimo Mês</span>
                                    </div>
                                    <!-- Botão "Saber mais" para Clientes -->
                                    <asp:Button ID="btnSaberMaisLojas" runat="server" Text="Saber mais" CommandName="Clientes" OnClick="SaberMais_Click" CssClass="btn btn-success btn-sm mt-4" />
                                </div>
                            </div>
                        </div>
                        <!-- Fim do Card de Controle de Clientes -->
                    </div>

                    <div class="row">
                        <!-- Início do Card de Controle de Fornecedores -->
                        <div class="col-12 col-md-6">
                            <div class="card border-0 bg-info bg-opacity-50">
                                <div class="card-body py-4 text-center">
                                    <h5 class="mb-2 fw-bold custom-class">Controle de Fornecedores</h5>
                                    <div class="mb-0">
                                        <span class="badge text-success me-2">+9.0%</span>
                                        <span class="fw-bold">Ultimo Mês</span>
                                    </div>
                                    <!-- Botão "Saber mais" para Fornecedores -->
                                    <asp:Button ID="btnSaberMaisFornecedores" runat="server" Text="Saber mais" CommandName="Fornecedores" OnClick="SaberMais_Click" CssClass="btn btn-success btn-sm mt-4" />
                                </div>
                            </div>
                        </div>
                        <!-- Fim do Card de Controle de Fornecedores -->

                        <!-- Início do Card de Controle de Outro Controle -->
                        <div class="col-12 col-md-6">
                            <div class="card border-0 bg-info bg-opacity-50">
                                <div class="card-body py-4 text-center">
                                    <h5 class="mb-2 fw-bold custom-class">Controle de Fornecedores</h5>
                                    <div class="mb-0">
                                        <span class="badge text-success me-2">+9.0%</span>
                                        <span class="fw-bold">Ultimo Mês</span>
                                    </div>
                                    <!-- Botão "Saber mais" para Fornecedores -->
                                    <asp:Button ID="Button1" runat="server" Text="Saber mais" CommandName="Fornecedores" OnClick="SaberMais_Click" CssClass="btn btn-success btn-sm mt-4" />
                                </div>
                            </div>
                        </div>
                        <!-- Fim do Card de Controle de Outro Controle -->
                    </div>                       
                    
                    <!-- Tabela de dados -->
                    <table style="width: 100%">
                        <tr>
                            <td style="height: 25px" colspan="2"></td>
                        </tr>
                        <tr>
                            <td style="width: 19px">
                                <br />
                            </td>
                            <td>
                                <asp:Label ID="lblTitle" runat="server" Text="        " Font-Size="XX-Large" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <div class="row justify-content-center">
                        <!-- GridView para exibir dados -->
                        <asp:GridView ID="GridHome" runat="server" AutoGenerateColumns="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="1231px" AllowPaging="True" PageSize="8">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="Home1" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT 
    ID_loja AS [ID], 
    nome AS [LOJA], 
    endereco AS [ENDERECO], 
    telefone AS [TELEFONE],       
    nif AS [NIF],     
    email AS [EMAIL] 
FROM [Lojas];
"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="Home2" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Produtos.* FROM Produtos"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="Home3" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Fornecedores]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            </div>
    </main>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);

        function endRequestHandler(sender, args) {
            var gridViewId = '<%= GridHome.ClientID %>'; // Obtém o ID do GridView

        if ($('#' + gridViewId).length > 0) { // Verifica se o GridView está sendo exibido
            var rows = $('#' + gridViewId + ' tr'); // Obtém todas as linhas do GridView
            rows.each(function() { // Loop através de cada linha
                var cells = $(this).find('td'); // Obtém todas as células da linha
                cells.each(function() { // Loop através de cada célula
                    var cellText = $(this).text().trim(); // Obtém o texto da célula
                    if (cellText.startsWith('~/Imagem/')) { // Verifica se o texto é um URL de imagem
                        var imageUrl = '<%= ResolveUrl("' + cellText + '") %>'; // Obtém o URL absoluto da imagem
                        $(this).html('<img src="' + imageUrl + '" width="50" height="50" />'); // Substitui o texto pela imagem
                    }
                });
            });
            }
        }
    </script>


</asp:Content>
