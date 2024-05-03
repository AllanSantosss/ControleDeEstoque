<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CadProd.aspx.vb" Inherits="ProjetoDashBoard.CadProd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=FileUploadCP.ClientID%>").change(function () {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#<%=ImageCP.ClientID%>").attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            });
        });
    </script>
    <table style="width: 100%">
        <tr>
            <td>&nbsp;</td>
            <td style="width: 1103px">
                <asp:Label ID="lblTitleCadProd" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Cadastrar Produto" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 2px"></td>
            <td style="width: 1103px; height: 2px"></td>
            <td style="height: 2px"></td>
        </tr>
        <tr>
            <td style="height: 388px"></td>
            <td style="width: 1103px; height: 388px">
                <asp:Panel ID="PanelCadCli" runat="server" BackColor="#F0F0F0">
                    <table style="width: 100%; height: 336px">
                        <tr>
                            <td style="width: 22px">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td style="width: 389px">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 22px; " rowspan="6"></td>
                            <td style="height: 66px">
                                <asp:Label ID="lblCPnome0" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nome:"></asp:Label>
                            </td>
                            <td style="height: 66px; width: 389px;">
                                <asp:TextBox ID="txtboxCadProdNome" runat="server" CssClass="txtbox-custom" Height="40px" Width="370px"></asp:TextBox>
                            </td>
                            <td colspan="2" rowspan="3">
                                <asp:Panel ID="PanelCadProd" runat="server" BackColor="Black" Height="190px">
                                    <asp:Image ID="ImageCP" runat="server" Height="100%" Width="100%" />
                                </asp:Panel>
                            </td>
                            <td style="height: 66px"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCPDesc3" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Descricao:"></asp:Label>
                            </td>
                            <td style="width: 389px">
                                <asp:TextBox ID="txtboxCadProdDesc" runat="server" CssClass="txtbox-custom" Height="40px" Width="370px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="height: 66px">
                                <asp:Label ID="lblCPPreco0" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Preco:"></asp:Label>
                            </td>
                            <td style="width: 389px; height: 66px;">
                                <asp:TextBox ID="txtboxCadProdPreco" runat="server" CssClass="txtbox-custom" Height="40px" Width="370px"></asp:TextBox>
                            </td>
                            <td style="height: 66px"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCPDesc8" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Categoria:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDowCatProd" runat="server" CssClass="dropdownlist-custom">
                                    <asp:ListItem>Sala</asp:ListItem>
                                    <asp:ListItem>Quarto</asp:ListItem>
                                    <asp:ListItem>Cozinha</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:center; ">
                                <asp:FileUpload ID="FileUploadCP" runat="server" Height="33px" />

                            </td>
                            <td style="heigth: 30px; width: 14px;" rowspan="4"></td>
                        </tr>
                        <tr>
                            <td style="height: 14px">
                                <asp:Label ID="lblCPDesc9" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fornecedor:"></asp:Label>
                            </td>
                            <td cssclass="txtbox-custom" style="height: 14px; width: 389px;">
                                <asp:DropDownList ID="DropDownFornProd" runat="server" CssClass="dropdownlist-custom" DataSourceID="Fornecedor" DataTextField="nome" DataValueField="ID_fornecedor">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: center; height: 14px; "></td>
                        </tr>
                        <tr>
                            <td style="height: 48px">
                                <asp:Label ID="lblCPDesc10" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Quantidade:"></asp:Label>
                            </td>
                            <td style="width: 389px; height: 48px;">
                                <asp:SqlDataSource ID="Fornecedor" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [nome], [ID_fornecedor] FROM [Fornecedores]"></asp:SqlDataSource>

                                <asp:TextBox ID="txtboxCadProdQtdd" runat="server" CssClass="txtbox-custom" Height="40px" TextMode="Number" Width="200px"></asp:TextBox>

                            </td>
                            <td style="text-align: center; height: 48px; ">
                                <asp:Button ID="btnCadProd" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" OnClick="btnCadLoja_Click" Style="border-radius: 20px;" Text="Cadastrar" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 22px">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td style="width: 389px">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="height: 388px"></td>
        </tr>
    </table>

</asp:Content>
