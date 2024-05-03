<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConsCli.aspx.vb" Inherits="ProjetoDashBoard.ConsCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Consulta Cliente"></asp:Label>
        <br />
    </p>
    <table >
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Nome:" Font-Bold="True" Font-Size="Large"></asp:Label>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtCliNome" runat="server" Width="300px" CssClass="textbox-custom"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" Height="20px" ImageUrl="~/Imagem/lupa.jpeg" Width="27px" />
            </td>
            <td style="text-align:right;" class="auto-style3">
                    <asp:Button ID="btnConsultar" runat="server" BackColor="#0066FF" BorderStyle="None" Font-Bold="True" ForeColor="White" Height="35px" Text="Consultar" Width="150px" />
            </td>
        </tr>

        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="clienteid" Width="1179px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="clienteid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="clienteid">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nomecliente" HeaderText="Nome" SortExpression="nomecliente">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="endereco" HeaderText="Endereco" SortExpression="endereco">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="telefone" HeaderText="Telefone" SortExpression="telefone">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="codpost" HeaderText="Cod Postal" SortExpression="codpost">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nif" HeaderText="NIF" SortExpression="nif">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="datanasc" HeaderText="Data Nascimento" SortExpression="datanasc">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email">
                        <ControlStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("clienteid") %>' style="font-weight:bold; background-color:#ffd000; border:0;"/>
                                <asp:Button ID="btnExcluir" runat="server" Text="Excluir" CommandName="Excluir" CommandArgument='<%# Eval("clienteid") %>' OnClientClick="return confirm('Tem certeza que deseja excluir este cliente?');" style="font-weight:bold; background-color:#fd0304; border:0;"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="ProjetoDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:new_siteConnectionString2 %>" ProviderName="<%$ ConnectionStrings:new_siteConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [clientes] ORDER BY [clienteid], [nomecliente], [datanasc]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>

    <style>

        .auto-style2 {
            width: 55px;
            height: 51px;
        }
        .auto-style3 {
            height: 51px;
        }

    </style>
</asp:Content>
