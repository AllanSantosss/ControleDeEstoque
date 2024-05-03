Imports System.Data.SqlClient

Public Class ConsCli
    Inherits System.Web.UI.Page

    Dim connect As New SqlConnection("Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;TrustServerCertificate=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub btnConsultar_Click(sender As Object, e As EventArgs) Handles btnConsultar.Click
        BindData()
    End Sub

    Private Sub BindData()
        Dim nome2 As String = txtCliNome.Text
        Dim command As SqlCommand

        If String.IsNullOrEmpty(nome2) Then
            ' Se o campo txtNomeCli estiver vazio, seleciona todos os clientes
            command = New SqlCommand("SELECT * FROM clientes", connect)
        Else
            ' Se o campo txtNomeCli não estiver vazio, seleciona o cliente com o nome correspondente
            command = New SqlCommand("SELECT * FROM clientes WHERE nomecliente = @nome", connect)
            command.Parameters.AddWithValue("@nome", nome2)
        End If

        Dim adapter As New SqlDataAdapter(command)
        Dim table As New DataTable()

        adapter.Fill(table)

        GridView1.DataSource = table
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Excluir" Then
            Dim clienteid As String = e.CommandArgument.ToString()
            ExcluirCliente(clienteid)
        End If


    End Sub

    Private Sub ExcluirCliente(ByVal clienteid As String)
        ' Abra a conexão
        connect.Open()

        ' Crie o comando SQL para excluir o cliente
        Dim command As New SqlCommand("DELETE FROM clientes WHERE clienteid = @clienteid", connect)
        command.Parameters.AddWithValue("@clienteid", clienteid)

        ' Execute o comando
        command.ExecuteNonQuery()

        MsgBox("Cliente excluído com sucesso", MsgBoxStyle.Information, "Sucesso")


        ' Feche a conexão
        connect.Close()

        ' Reexiba os dados no GridView
        BindData()
    End Sub

End Class