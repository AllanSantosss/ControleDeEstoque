Imports System.Data.SqlClient
Imports System.Runtime.InteropServices.ComTypes

Public Class ConsPedido
    Inherits System.Web.UI.Page

    Dim connectionString As String = "Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;"

    Dim connect As New SqlConnection(connectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Preencher o DropDownFornPdd com todos os fornecedores quando a página é carregada
            DropDownConsPddForn.DataSource = FornecedorPedido
            DropDownConsPddForn.DataTextField = "nome"
            DropDownConsPddForn.DataValueField = "ID_fornecedor"
            DropDownConsPddForn.DataBind()
        End If
    End Sub

    Protected Sub DropDownConsPddForn_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownConsPddForn.SelectedIndexChanged
        Dim selectedFornecedor As String = DropDownConsPddForn.SelectedValue
        ProdutoPedido.SelectParameters.Clear()
        DropDownConsPddPdd.Items.Clear() ' Limpar itens existentes
        DropDownConsPddPdd.DataTextField = "nome" ' Definir o campo de texto para o nome do produto
        DropDownConsPddPdd.DataValueField = "ID_froduto" ' Definir o campo de valor para o ID do produto

        If String.IsNullOrEmpty(selectedFornecedor) Then
            ' Se o fornecedor selecionado estiver vazio, selecione todos os produtos
            ProdutoPedido.SelectCommand = "SELECT [ID_froduto], [nome] FROM [Produtos]"
        Else
            ' Se o fornecedor selecionado não estiver vazio, selecione os produtos desse fornecedor
            ProdutoPedido.SelectCommand = "SELECT [ID_froduto], [nome] FROM [Produtos] WHERE [ID_fornecedor] = @fornecedor"
            ProdutoPedido.SelectParameters.Add("fornecedor", selectedFornecedor)
        End If

        ProdutoPedido.DataBind()
        DropDownConsPddPdd.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub


End Class