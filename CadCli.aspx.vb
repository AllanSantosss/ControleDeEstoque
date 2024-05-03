Imports System.Data.SqlClient

Public Class CadCli
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnCadCli_Click(sender As Object, e As EventArgs) Handles btnCadCli.Click
        Dim connect As New SqlConnection("Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;TrustServerCertificate=True")


        Try
            Dim nome As String = txtNome.Text
            Dim endereco As String = txtEnd.Text
            Dim codpost As String = txtZip.Text
            Dim telefone As String = txtTel.Text
            Dim nif As String = txtNif.Text
            Dim datanasc As DateTime = DateTime.Parse(txtData.Text)
            Dim email As String = txtEmail.Text

            Dim command As New SqlCommand("INSERT INTO clientes (nomecliente, endereco, telefone, codpost, nif, datanasc, email) VALUES (@nome, @endereco, @telefone, @codpost, @nif, @datanasc, @email)", connect)

            command.Parameters.AddWithValue("@nome", nome)
            command.Parameters.AddWithValue("@endereco", endereco)
            command.Parameters.AddWithValue("@telefone", telefone)
            command.Parameters.AddWithValue("@codpost", codpost)
            command.Parameters.AddWithValue("@nif", nif)
            command.Parameters.AddWithValue("@datanasc", datanasc)
            command.Parameters.AddWithValue("@email", email)

            connect.Open()
            command.ExecuteNonQuery()

            txtNome.Text = String.Empty
            txtEnd.Text = String.Empty
            txtZip.Text = String.Empty
            txtTel.Text = String.Empty
            txtNif.Text = String.Empty
            txtData.Text = String.Empty
            txtEmail.Text = String.Empty

            MsgBox("Cliente Cadastrado com sucesso", MsgBoxStyle.Information, "Sucesso")
        Catch ex As Exception
            ' Exibe a caixa de mensagem de erro
            MsgBox("Erro ao inserir cliente: " & ex.Message, MsgBoxStyle.Critical, "Erro")
        Finally
            ' Certifique-se de que a conexão seja fechada mesmo se ocorrer uma exceção
            If connect.State = ConnectionState.Open Then
                connect.Close()
            End If
        End Try
    End Sub

End Class