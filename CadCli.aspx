<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CadCli.aspx.vb" Inherits="ProjetoDashBoard.CadCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Cadastro de Clientes"></asp:Label>
        <br />
        <div class="table-responsive" style="background-color: #f2f2f2;">
            <table class="table" style="width: 100%">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Nome:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNome" runat="server" Width="300px" CssClass="txtbox-custom"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" Text="NIF:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNif" runat="server" CssClass="txtbox-custom"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 31px">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Endereco:"></asp:Label>
                </td>
                <td style="height: 31px">
                    <asp:TextBox ID="txtEnd" runat="server" Width="300px" CssClass="txtbox-custom"></asp:TextBox>
                </td>
                <td style="height: 31px">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" Text="Data Nasc:"></asp:Label>
                </td>
                <td style="height: 31px">
                    <asp:TextBox ID="txtData" runat="server" TextMode="Date" CssClass="txtbox-custom"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 29px">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Cod Postal:"></asp:Label>
                </td>
                <td style="height: 29px">
                    <asp:TextBox ID="txtZip" runat="server" TextMode="Number" CssClass="txtbox-custom"></asp:TextBox>
                </td>
                <td style="height: 29px">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" Text="Email:"></asp:Label>
                </td>
                <td style="height: 29px">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="300px" CssClass="txtbox-custom"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 31px">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="Telefone:"></asp:Label>
                </td>
                <td style="height: 31px" colspan="3">
                    <asp:TextBox ID="txtTel" runat="server" TextMode="Phone" CssClass="txtbox-custom"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;" >
                    &nbsp;</td>
                <td style="text-align:right;" >
                    &nbsp;</td>
                <td style="text-align:right;" >
                    &nbsp;</td>
                <td style="text-align:center;" >
                    <asp:Button ID="btnCadCli" runat="server" Text="Cadastrar" BackColor="#0066FF" BorderStyle="None" Font-Bold="True" ForeColor="White" Height="39px" Width="150px" />
                </td>
            </tr>
       </table>
        </div>
    </p>
</asp:Content>