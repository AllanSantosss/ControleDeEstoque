Imports System.Data.SqlClient

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCadLoja_Click(sender As Object, e As EventArgs) Handles btnCadLoja.Click
        Dim connect As New SqlConnection("Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;TrustServerCertificate=True")

        Try
            Dim nome As String = txtboxCadLojaNome.Text
            Dim endereco As String = txtboxCadLojaEnd.Text
            Dim telefone As String = txtboxCadLojaTel.Text
            Dim nif As String = txtboxCadLojaNif.Text
            Dim email As String = txtboxCadLojaEmail.Text

            ' Check if all fields are filled
            If String.IsNullOrEmpty(nome) Or String.IsNullOrEmpty(endereco) Or String.IsNullOrEmpty(telefone) Or String.IsNullOrEmpty(nif) Or String.IsNullOrEmpty(email) Then
                MsgBox("Por favor preencha todos os campos", MsgBoxStyle.Information, "Error")
                Return
            End If

            ' Check if phone number is up to 9 digits
            If telefone.Length > 9 Then
                MsgBox("Numero de telefone incorreto", MsgBoxStyle.Information, "Error")
                Return
            End If

            ' Check if NIF meets the standards (assuming it should be 9 digits)
            If nif.Length <> 9 Then
                MsgBox("NIF incorreto", MsgBoxStyle.Information, "Error")
                Return
            End If

            Dim command As New SqlCommand("INSERT INTO Lojas (nome,endereco,telefone,nif,email) VALUES (@nome,@endereco,@telefone,@nif,@email)", connect)

            command.Parameters.AddWithValue("@nome", nome)
            command.Parameters.AddWithValue("@endereco", endereco)
            command.Parameters.AddWithValue("@telefone", telefone)
            command.Parameters.AddWithValue("@nif", nif)
            command.Parameters.AddWithValue("@email", email)

            connect.Open()
            command.ExecuteNonQuery()

            txtboxCadLojaNome.Text = String.Empty
            txtboxCadLojaEnd.Text = String.Empty
            txtboxCadLojaTel.Text = String.Empty
            txtboxCadLojaNif.Text = String.Empty
            txtboxCadLojaEmail.Text = String.Empty

            MsgBox("Loja Cadastrado com sucesso", MsgBoxStyle.Information, "Sucesso")
        Catch ex As Exception
            ' Exibe a caixa de mensagem de erro
            MsgBox("Erro ao inserir Loja: " & ex.Message, MsgBoxStyle.Critical, "Erro")
        Finally
            ' Certifique-se de que a conexão seja fechada mesmo se ocorrer uma exceção
            If connect.State = ConnectionState.Open Then
                connect.Close()
            End If
        End Try
    End Sub
End Class
