Imports System.Data.SqlClient

Public Class CadForn
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCadForn_Click(sender As Object, e As EventArgs) Handles btnCadForn.Click
        Dim connect As New SqlConnection("Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;TrustServerCertificate=True")


        Try
            Dim nomeforn As String = txtCadFornNome.Text
            Dim enderecoForn As String = txtCadFornEnd.Text
            Dim contatoForn As String = txtCadFornTel.Text
            Dim emailForn As String = txtCadFornEmail.Text
            Dim nifForn As String = txtCadFornNif.Text

            If String.IsNullOrEmpty(nomeforn) Or String.IsNullOrEmpty(enderecoForn) Or String.IsNullOrEmpty(contatoForn) Or String.IsNullOrEmpty(emailForn) Or String.IsNullOrEmpty(nifForn) Then
                MsgBox("Peencha todos os campos", MsgBoxStyle.Information, "Error")
                Return
            End If

            If contatoForn.Length > 9 Then
                MsgBox("Numero de telefone incorreto", MsgBoxStyle.Information, "Error")
                Return
            End If

            If nifForn.Length <> 9 Then
                MsgBox("Nif incorreto", MsgBoxStyle.Information, "Error")
                Return
            End If


            Dim command As New SqlCommand("INSERT INTO Fornecedores(nome, endereco,contato,email,nif_forn) VALUES (@nomeforn,@enderecoForn,@contatoForn,@emailForn,@nifForn)", connect)


            command.Parameters.AddWithValue("@nomeforn", nomeforn)
            command.Parameters.AddWithValue("@enderecoForn", enderecoForn)
            command.Parameters.AddWithValue("@contatoForn", contatoForn)
            command.Parameters.AddWithValue("@emailForn", emailForn)
            command.Parameters.AddWithValue("@nifForn", nifForn)


            connect.Open()
            command.ExecuteNonQuery()

            txtCadFornNome.Text = String.Empty
            txtCadFornEnd.Text = String.Empty
            txtCadFornTel.Text = String.Empty
            txtCadFornEmail.Text = String.Empty
            txtCadFornNif.Text = String.Empty


            MsgBox("Fornecedor Cadastrado com sucesso", MsgBoxStyle.Information, "Sucesso")
        Catch ex As Exception
            MsgBox("Erro ao inserir Fornecedor: " & ex.Message, MsgBoxStyle.Critical, "Erro")
        Finally

            If connect.State = ConnectionState.Open Then
                connect.Close()
            End If
        End Try
    End Sub
End Class