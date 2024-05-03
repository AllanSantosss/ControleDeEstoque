Imports System.Data.SqlClient
Imports System.IO

Public Class CadProd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCadLoja_Click(sender As Object, e As EventArgs) Handles btnCadProd.Click
        If FileUploadCP.HasFile Then
            Dim fileName As String = Path.GetFileName(FileUploadCP.FileName)
            Dim directoryPath As String = Server.MapPath("~/Imagem/")

            If Not Directory.Exists(directoryPath) Then
                Directory.CreateDirectory(directoryPath)
            End If

            Dim imagePath As String = Path.Combine(directoryPath, fileName)

            FileUploadCP.SaveAs(imagePath)

            Dim connect As New SqlConnection("Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;TrustServerCertificate=True")

            Try
                Dim nome As String = txtboxCadProdNome.Text
                Dim descricao As String = txtboxCadProdDesc.Text
                Dim preco As Decimal
                Dim categoria As String = DropDowCatProd.SelectedValue
                Dim quantidade As Integer
                Dim fornecedor As String = DropDownFornProd.SelectedValue
                Dim imagem As String = "~/Imagem/" + fileName

                If String.IsNullOrEmpty(nome) Or String.IsNullOrEmpty(descricao) Or String.IsNullOrEmpty(categoria) Or String.IsNullOrEmpty(fornecedor) Then
                    MsgBox("Preencha todos os campos", MsgBoxStyle.Information, "Error")
                    Return
                End If

                If Not Decimal.TryParse(txtboxCadProdPreco.Text, preco) Then
                    MsgBox("o Preco deve ter um valor numerico", MsgBoxStyle.Information, "Error")
                    Return
                End If

                If Not Integer.TryParse(txtboxCadProdQtdd.Text, quantidade) Then
                    MsgBox("Quantidade deve ter um valor numerico", MsgBoxStyle.Information, "Error")
                    Return
                End If

                Dim command As New SqlCommand("INSERT INTO Produtos (nome, descricao, preco, categoria, ID_fornecedor, imagem, quantidade) VALUES (@nome, @descricao, @preco, @categoria, @fornecedor, @imagem, @quantidade)", connect)

                command.Parameters.AddWithValue("@nome", nome)
                command.Parameters.AddWithValue("@descricao", descricao)
                command.Parameters.AddWithValue("@preco", preco)
                command.Parameters.AddWithValue("@categoria", categoria)
                command.Parameters.AddWithValue("@fornecedor", fornecedor)
                command.Parameters.AddWithValue("@imagem", imagem)
                command.Parameters.AddWithValue("@quantidade", quantidade) ' Adicionando a quantidade ao comando SQL

                connect.Open()
                command.ExecuteNonQuery()

                txtboxCadProdNome.Text = String.Empty
                txtboxCadProdDesc.Text = String.Empty
                txtboxCadProdPreco.Text = String.Empty
                txtboxCadProdQtdd.Text = String.Empty

                MsgBox("Produto cadastrado com sucesso", MsgBoxStyle.Information, "Sucesso")

                ' Produto inserido com sucesso
                ' Redirecionar para uma página de sucesso, se necessário
            Catch ex As SqlException
                ' Trate exceções específicas do SQL aqui
                Console.WriteLine("Erro ao inserir o produto: " & ex.Message)
                ' Exibir mensagem de erro para o usuário
            Catch ex As Exception
                ' Trate outras exceções aqui
                Console.WriteLine("Erro ao inserir o produto: " & ex.Message)
                ' Exibir mensagem de erro para o usuário
            Finally
                connect.Close()
            End Try
        Else
            ' Exibir mensagem de erro informando que nenhum arquivo foi selecionado
        End If
    End Sub


End Class