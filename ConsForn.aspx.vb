Imports System.Data.SqlClient

Public Class ConsForn
    Inherits System.Web.UI.Page


    Dim connectionString As String = "Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;"

    Dim connect As New SqlConnection(connectionString)


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Se não for uma postback, popula o GridView com os dados das lojas
            DataBindConsForn(False)
        End If
    End Sub

    Protected Sub btnConsForn_Click(sender As Object, e As EventArgs) Handles btnConsForn.Click
        DataBindConsForn(True)
    End Sub

    Private Sub DataBindConsForn(ByVal applyfilters As Boolean)
        Try
            Dim selectCommand As String = "SELECT Fornecedores.ID_fornecedor, Fornecedores.nome, Fornecedores.endereco, Fornecedores.contato, Fornecedores.email, Fornecedores.nif_forn FROM Fornecedores INNER JOIN Produtos ON Fornecedores.ID_fornecedor = Produtos.ID_fornecedor WHERE 1=1"

            ' Limpa os parâmetros existentes
            Fornecedores.SelectParameters.Clear()

            If applyfilters Then
                Dim nomeForn As String = DropDownFornNome.SelectedValue
                Dim prodForn As String = DropDownFornProd.SelectedValue

                If Not String.IsNullOrEmpty(nomeForn) Then
                    selectCommand &= " AND Fornecedores.nome = @nomeForn"
                    Fornecedores.SelectParameters.Add("nomeForn", nomeForn)
                End If

                If Not String.IsNullOrEmpty(prodForn) Then
                    selectCommand &= " AND Produtos.nome = @prodForn"
                    Fornecedores.SelectParameters.Add("prodForn", prodForn)
                End If
            End If

            Fornecedores.SelectCommand = selectCommand
            Fornecedores.ConnectionString = connectionString
            GridViewForn.DataBind()

        Catch ex As Exception
            MsgBox("Não foi possível realizar consulta: " & ex.Message)
        End Try
    End Sub

    Protected Sub GridViewForn_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridViewForn.RowEditing
        GridViewForn.EditIndex = e.NewEditIndex
        DataBindConsForn(True)
    End Sub

    'Cancela a Edicao do GridView
    Protected Sub GridViewForn_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridViewForn.RowCancelingEdit
        GridViewForn.EditIndex = -1
        DataBindConsForn(False)
    End Sub

    Protected Sub GridViewForn_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridViewForn.RowUpdating

        Try
            Dim idForn As Integer = Convert.ToInt32(GridViewForn.DataKeys(e.RowIndex).Values(0))

            ' Verifica se os novos valores não são nulos antes de tentar acessá-los
            Dim nomeForn As String = e.NewValues("nome").ToString()
            Dim enderecoForn As String = e.NewValues("endereco").ToString()
            Dim contatoForn As Integer = Convert.ToInt32(e.NewValues("contato"))
            Dim emailForn As String = e.NewValues("email").ToString()
            Dim nifForn As Integer = Convert.ToInt32(e.NewValues("nif_forn"))

            Dim command As New SqlCommand("UPDATE Fornecedores SET nome = @nome, endereco = @endereco, contato = @contato, email = @email, nif_forn = @nif_forn WHERE ID_fornecedor = @id", connect)

            command.Parameters.AddWithValue("@id", idForn)
            command.Parameters.AddWithValue("@nome", nomeForn)
            command.Parameters.AddWithValue("@endereco", enderecoForn)
            command.Parameters.AddWithValue("@contato", contatoForn)
            command.Parameters.AddWithValue("@email", emailForn)
            command.Parameters.AddWithValue("@nif_forn", nifForn)

            connect.Open()
            command.ExecuteNonQuery()
            connect.Close()

            GridViewForn.EditIndex = -1

            DataBindConsForn(False)

            e.Cancel = True

            Dim script As String = "alert('Fornecedor Atualizado com sucesso');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "UpdateSuccess", script, True)

        Catch ex As Exception
            MsgBox("Erro ao atualizar fornecedor: " & ex.Message)
        End Try

    End Sub


End Class