Imports System.Data.SqlClient ' Importe este namespace para utilizar SqlConnection

Public Class ConsProd
    Inherits System.Web.UI.Page



    Dim connectionString As String = "Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;"

    Dim connect As New SqlConnection(connectionString)

    Protected Sub btnCadLoja_Click(sender As Object, e As EventArgs) Handles btnConsProd.Click
        BindDataConsProd(True)
    End Sub

    Private Sub BindDataConsProd(ByVal applyFilters As Boolean)

        Try
            Dim selectCommand As String = "SELECT ID_froduto AS ID, nome AS PRODUTO, descricao AS DESCRICAO, preco AS PRECO, categoria AS CATEGORIA, quantidade AS QUANTIDADE, ID_fornecedor AS FORNECEDOR, imagem AS FOTO FROM Produtos WHERE 1=1"

            If applyFilters Then
                ' Recupera os valores dos controles de entrada do usuário
                Dim nomeprod As String = txtConsPNome.Text
                Dim precoprod As Decimal
                Dim categoprod As String = DropDownProdCat.SelectedValue
                Dim fornecedorprod As Integer

                If Not String.IsNullOrEmpty(DropDownProdForn.SelectedValue) AndAlso Integer.TryParse(DropDownProdForn.SelectedValue, fornecedorprod) Then
                    ' Adiciona uma condição de filtro para o fornecedor do produto
                    selectCommand &= " AND ID_fornecedor = @fornecedor"
                End If

                ' Adiciona condições à consulta com base nos valores dos filtros
                If Not String.IsNullOrEmpty(nomeprod) Then
                    ' Adiciona uma condição de filtro para o nome do produto
                    selectCommand &= " AND nome LIKE @nome"
                End If

                If Not String.IsNullOrEmpty(txtConsPPreco.Text) AndAlso Decimal.TryParse(txtConsPPreco.Text, precoprod) Then
                    ' Adiciona uma condição de filtro para o preço do produto
                    selectCommand &= " AND preco = @preco"
                End If

                If Not String.IsNullOrEmpty(categoprod) Then
                    ' Adiciona uma condição de filtro para a categoria do produto
                    selectCommand &= " AND categoria = @categoria"
                End If

                ' Configura os parâmetros da consulta
                Produtos.SelectParameters.Clear()
                If Not String.IsNullOrEmpty(nomeprod) Then
                    Produtos.SelectParameters.Add("nome", "%" & nomeprod & "%")
                End If
                If Not String.IsNullOrEmpty(txtConsPPreco.Text) AndAlso Decimal.TryParse(txtConsPPreco.Text, precoprod) Then
                    Produtos.SelectParameters.Add("preco", precoprod)
                End If
                If Not String.IsNullOrEmpty(categoprod) Then
                    Produtos.SelectParameters.Add("categoria", categoprod)
                End If
                If fornecedorprod <> 0 Then
                    Produtos.SelectParameters.Add("fornecedor", fornecedorprod.ToString())
                End If
            End If

            ' Define a consulta SQL modificada para o SqlDataSource
            Produtos.SelectCommand = selectCommand

            ' Configura a string de conexão para o SqlDataSource
            Produtos.ConnectionString = connectionString

            ' Atualiza o controle GridView para refletir os resultados filtrados
            GridView1.DataBind()
        Catch ex As Exception
            ' Trata exceções aqui, por exemplo, exibindo uma mensagem de erro para o usuário
            MsgBox("Ocorreu um erro ao buscar os produtos: " & ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Se não for uma postback, popula o GridView com os dados das lojas
            BindDataConsProd(False)
        End If
    End Sub


    'Método chamado quando uma linha do GridView entra em modo de edição, faz com que a tabela nao se atualize quandoclicamos em editar
    Protected Sub GridConsL_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        ' Define a linha selecionada como modo de edição
        GridView1.EditIndex = e.NewEditIndex
        ' Reexibe o GridView para mostrar a linha em modo de edição
        BindDataConsProd(True)
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        ' Recupera o ID do produto que está sendo editado
        Dim idProd As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))

        ' Recupera os novos valores inseridos nos campos de edição
        Dim nomeProd As String = e.NewValues("PRODUTO").ToString()
        Dim descricaoProd As String = e.NewValues("DESCRICAO").ToString()
        Dim precoProd As Decimal = Convert.ToDecimal(e.NewValues("PRECO"))
        Dim categoriaProd As String = e.NewValues("CATEGORIA").ToString()
        Dim quantidadeProd As Integer = Convert.ToInt32(e.NewValues("QUANTIDADE"))
        Dim fornecedor As Integer = Convert.ToInt32(e.NewValues("FORNECEDOR"))
        Dim imagem As String = e.NewValues("FOTO").ToString()

        ' Cria um novo comando SQL para atualizar os dados do produto
        Dim command As New SqlCommand("UPDATE Produtos SET nome = @nome, descricao = @descricao, preco = @preco, categoria = @categoria, quantidade = @quantidade, ID_fornecedor = @fornecedor, imagem = @foto WHERE ID_froduto = @id", connect)
        command.Parameters.AddWithValue("@id", idProd)
        command.Parameters.AddWithValue("@nome", nomeProd)
        command.Parameters.AddWithValue("@descricao", descricaoProd)
        command.Parameters.AddWithValue("@preco", precoProd)
        command.Parameters.AddWithValue("@categoria", categoriaProd)
        command.Parameters.AddWithValue("@quantidade", quantidadeProd)
        command.Parameters.AddWithValue("@fornecedor", fornecedor)
        command.Parameters.AddWithValue("@foto", imagem)

        ' Abre a conexão com o banco de dados, executa o comando de atualização e fecha a conexão
        connect.Open()
        command.ExecuteNonQuery()
        connect.Close()

        ' Retorna o GridView ao modo de exibição normal
        GridView1.EditIndex = -1

        ' Reexibe o GridView com os dados atualizados
        BindDataConsProd(False)

        ' Cancela o evento de atualização para evitar que o SqlDataSource tente atualizar os dados
        e.Cancel = True

        ' Registra um script para exibir uma caixa de mensagem após a atualização
        Dim script As String = "alert('Produto Atualizado com sucesso');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "UpdateSuccess", script, True)
    End Sub

    ' Método chamado quando uma linha do GridView é vinculada aos dados
    Protected Sub GGridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        ' Verifica se a linha é do tipo DataRow e não está em modo de edição
        If e.Row.RowType = DataControlRowType.DataRow And e.Row.RowState <> DataControlRowState.Edit Then
            ' Encontra o botão de exclusão na linha e adiciona o atributo onclick para confirmar a exclusão
            Dim deleteButton As Button = DirectCast(e.Row.FindControl("btnDeleteProd"), Button)
            If deleteButton IsNot Nothing Then
                deleteButton.Attributes.Add("onclick", "return confirm('Tem certeza de que deseja eliminar os dados deste produto?');")
            End If
        End If
    End Sub

    ' Método chamado quando uma linha do GridView é excluída
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        ' Recupera o ID da loja que está sendo excluída
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))

        ' Cria um novo comando SQL para excluir a lojae
        Dim command As New SqlCommand("DELETE FROM Produtos WHERE ID_froduto = @id", connect)
        command.Parameters.AddWithValue("@id", id)

        ' Abre a conexão com o banco de dados, executa o comando de exclusão e fecha a conexão
        connect.Open()
        command.ExecuteNonQuery()
        connect.Close()

        ' Reexibe o GridView com os dados atualizados
        BindDataConsProd(False)
    End Sub

    Protected Sub GridConsL_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        ' Define o índice da página selecionada
        GridView1.PageIndex = e.NewPageIndex
        ' Reexibe os dados para a nova página
        BindDataConsProd(False)
    End Sub




End Class
