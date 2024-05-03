<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConsLoja.aspx.vb" Inherits="ProjetoDashBoard.ConsLoja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="3">
                    <asp:Label ID="lblTitleConsL" runat="server" BackColor="#0E2238" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Consultar  Loja" Width="100%" Style="border-radius: 10px;" CssClass="title-custom"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px" colspan="2"></td>
                <td colspan="3" style="height: 25px"></td>
            </tr>
            <tr>
                <td style="height: 81px; width: 50px" colspan="2"></td>
                <td style="height: 81px; width: 1168px;">
                    
    <!-- Seus controles aqui -->


                    <asp:Panel ID="PnlCadL" runat="server" Height="100%" style="margin-left: 0px; border-radius:10px;" Width="100%" BackColor="#F0F0F0" HorizontalAlign="Center">
                        <table style="width: 100%" border="0">
                            <tr>
                                <td rowspan="5" style="width: 45px">&nbsp;</td>
                                <td style="height: 27px; width: 107px;">
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
                                <td style="height: 40px; width: 107px;">
                                    <asp:Label ID="lblConsLnome" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nome:"></asp:Label>
                                </td>
                                <td style="width: 476px; height: 40px;">
                                    <asp:TextBox ID="txtboxConsLojaNome" runat="server" Width="350px" CssClass="txtbox-custom" Height="40px"></asp:TextBox>
                                </td>
                                <td style="height: 40px">
                                    &nbsp;</td>
                                <td style="width: 415px; height: 40px; text-align:right;">
                                    <asp:Button ID="btnConsLoja" runat="server" BackColor="#0066FF" BorderColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" OnClick="btnCadLoja_Click" style="border-radius: 20px;" Text="Consultar" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 107px">
                                    &nbsp;</td>
                                <td style="width: 476px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td style="width: 415px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="height: 25px;" colspan="4">
                                    <asp:GridView ID="GridConsL" runat="server" OnRowEditing="GridConsL_RowEditing" AutoGenerateColumns="False" DataKeyNames="ID_loja" Width="100%" AllowPaging="True" BorderColor="Black" BorderStyle="Groove" ForeColor="Black" Height="100%" HorizontalAlign="Center" CssClass="Gridview-custom">
                                        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="ID_loja" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_loja" />
                                            <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
                                            <asp:BoundField DataField="ENDERECO" HeaderText="ENDERECO" SortExpression="ENDERECO" />
                                            <asp:BoundField DataField="TELEFONE" HeaderText="TELEFONE" SortExpression="TELEFONE" />
                                            <asp:BoundField DataField="NIF" HeaderText="NIF" SortExpression="NIF" />
                                            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Editar" CssClass="editButton" />
                                                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Eliminar" CssClass="deleteButton" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Atualizar" CssClass="updateButton" />
                                                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="cancelButton" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <EditRowStyle BorderStyle="Groove" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <RowStyle BorderColor="Black" BorderStyle="Groove" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SelectedRowStyle BackColor="#0066FF" BorderStyle="Groove" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SortedAscendingCellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SortedAscendingHeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SortedDescendingCellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="ConsultaLojas" runat="server" ConnectionString="Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT ID_loja AS ID,nome AS NOME,endereco AS ENDERECO,telefone AS TELEFONE,nif AS NIF,email AS EMAIL FROM Lojas"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 107px">&nbsp;</td>
                                <td style="width: 476px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="width: 415px; text-align:center;">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                        
                </td>
                <td style="height: 81px; width: 50px" colspan="2"></td>
            </tr>
        </table>
    </p>



</asp:Content>
