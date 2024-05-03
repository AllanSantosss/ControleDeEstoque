Imports System.Data.SqlClient

Public Class ConsLoja
    Inherits System.Web.UI.Page

    ' Conexão com o banco de dados
    Dim connect As New SqlConnection("Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;TrustServerCertificate=True")

    ' Método chamado quando a página é carregada
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Verifica se a página está sendo carregada pela primeira vez
        If Not IsPostBack Then
            GridConsL.PageSize = 8
            ' Se sim, popula o GridView com os dados das lojas
            BindDataConsL()
        End If
    End Sub

    ' Método chamado quando o botão de consulta é clicado
    Protected Sub btnCadLoja_Click(sender As Object, e As EventArgs) Handles btnConsLoja.Click
        ' Atualiza os dados do GridView após a consulta
        BindDataConsL()
    End Sub

    ' Método para popular o GridView com os dados das lojas
    Private Sub BindDataConsL()
        ' Recupera o nome da loja inserido no campo de texto
        Dim nomeLoja As String = txtboxConsLojaNome.Text
        Dim command As SqlCommand

        ' Verifica se foi inserido um nome de loja para a consulta
        If String.IsNullOrEmpty(nomeLoja) Then
            ' Se não, cria um comando SQL para selecionar todas as lojas
            command = New SqlCommand("SELECT ID_loja, nome, endereco, telefone, nif, email FROM Lojas", connect)
        Else
            ' Se sim, cria um comando SQL para selecionar a loja pelo nome
            command = New SqlCommand("SELECT ID_loja, nome, endereco, telefone, nif, email FROM Lojas WHERE nome = @nome", connect)
            command.Parameters.AddWithValue("@nome", nomeLoja)
        End If

        ' Cria um adaptador de dados e uma tabela para armazenar os resultados da consulta
        Dim adapterConsL As New SqlDataAdapter(command)
        Dim tableConL As New DataTable()

        ' Preenche a tabela com os dados da consulta
        adapterConsL.Fill(tableConL)

        ' Define a fonte de dados do GridView e o exibe
        GridConsL.DataSource = tableConL
        GridConsL.DataBind()
    End Sub

    ' Método chamado quando uma linha do GridView entra em modo de edição
    Protected Sub GridConsL_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridConsL.RowEditing
        ' Define a linha selecionada como modo de edição
        GridConsL.EditIndex = e.NewEditIndex
        ' Reexibe o GridView para mostrar a linha em modo de edição
        BindDataConsL()
    End Sub

    ' Método chamado quando uma linha do GridView é atualizada
    Protected Sub GridConsL_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridConsL.RowUpdating
        ' Recupera o ID da loja que está sendo editada
        Dim id As Integer = Convert.ToInt32(GridConsL.DataKeys(e.RowIndex).Values(0))

        ' Recupera os novos valores inseridos nos campos de edição
        Dim nome As String = e.NewValues("NOME").ToString()
        Dim endereco As String = e.NewValues("ENDERECO").ToString()
        Dim telefone As String = e.NewValues("TELEFONE").ToString()
        Dim nif As String = e.NewValues("NIF").ToString()
        Dim email As String = e.NewValues("EMAIL").ToString()

        ' Cria um novo comando SQL para atualizar os dados da loja
        Dim command As New SqlCommand("UPDATE Lojas SET nome = @nome, endereco = @endereco, telefone = @telefone, nif = @nif, email = @email WHERE ID_loja = @id", connect)
        command.Parameters.AddWithValue("@id", id)
        command.Parameters.AddWithValue("@nome", nome)
        command.Parameters.AddWithValue("@endereco", endereco)
        command.Parameters.AddWithValue("@telefone", telefone)
        command.Parameters.AddWithValue("@nif", nif)
        command.Parameters.AddWithValue("@email", email)

        ' Abre a conexão com o banco de dados, executa o comando de atualização e fecha a conexão
        connect.Open()
        command.ExecuteNonQuery()
        connect.Close()

        ' Retorna o GridView ao modo de exibição normal
        GridConsL.EditIndex = -1

        ' Reexibe o GridView com os dados atualizados
        BindDataConsL()
    End Sub

    ' Método chamado quando a edição de uma linha do GridView é cancelada
    Protected Sub GridConsL_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridConsL.RowCancelingEdit
        ' Retorna o GridView ao modo de exibição normal
        GridConsL.EditIndex = -1
        ' Reexibe o GridView para mostrar a linha no modo de exibição normal
        BindDataConsL()
    End Sub

    ' Método chamado quando uma linha do GridView é vinculada aos dados
    Protected Sub GridConsL_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridConsL.RowDataBound
        ' Verifica se a linha é do tipo DataRow e não está em modo de edição
        If e.Row.RowType = DataControlRowType.DataRow And e.Row.RowState <> DataControlRowState.Edit Then
            ' Encontra o botão de exclusão na linha e adiciona o atributo onclick para confirmar a exclusão
            Dim deleteButton As Button = DirectCast(e.Row.FindControl("btnDelete"), Button)
            If deleteButton IsNot Nothing Then
                deleteButton.Attributes.Add("onclick", "return confirm('Tem certeza de que deseja eliminar os dados desta loja?');")
            End If
        End If
    End Sub

    ' Método chamado quando uma linha do GridView é excluída
    Protected Sub GridConsL_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridConsL.RowDeleting
        ' Recupera o ID da loja que está sendo excluída
        Dim id As Integer = Convert.ToInt32(GridConsL.DataKeys(e.RowIndex).Values(0))

        ' Cria um novo comando SQL para excluir a loja
        Dim command As New SqlCommand("DELETE FROM Lojas WHERE ID_loja = @id", connect)
        command.Parameters.AddWithValue("@id", id)

        ' Abre a conexão com o banco de dados, executa o comando de exclusão e fecha a conexão
        connect.Open()
        command.ExecuteNonQuery()
        connect.Close()

        ' Reexibe o GridView com os dados atualizados
        BindDataConsL()
    End Sub

    Protected Sub GridConsL_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles GridConsL.PageIndexChanging
        ' Define o índice da página selecionada
        GridConsL.PageIndex = e.NewPageIndex
        ' Reexibe os dados para a nova página
        BindDataConsL()
    End Sub

End Class

