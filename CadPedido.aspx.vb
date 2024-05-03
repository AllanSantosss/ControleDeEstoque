Imports System.Data.SqlClient

Public Class CadPedido
    Inherits System.Web.UI.Page


    Dim connectionString As String = "Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;"
    Dim connect As New SqlConnection(connectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Preencher o DropDownFornPdd com todos os fornecedores quando a página é carregada
            DropDownFornPdd.DataSource = Fornecedor2
            DropDownFornPdd.DataTextField = "nome"
            DropDownFornPdd.DataValueField = "ID_fornecedor"
            DropDownFornPdd.DataBind()
        End If
    End Sub

    Protected Sub DropDownFornPdd_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownFornPdd.SelectedIndexChanged
        Dim selectedFornecedor As String = DropDownFornPdd.SelectedValue
        Produtos2.SelectCommand = "SELECT [ID_froduto], [nome] FROM [Produtos] WHERE [ID_fornecedor] = @fornecedor"
        Produtos2.SelectParameters.Clear()
        Produtos2.SelectParameters.Add("fornecedor", selectedFornecedor)
        DropDownProdPdd.Items.Clear() ' Limpar itens existentes
        DropDownProdPdd.DataTextField = "nome" ' Definir o campo de texto para o nome do produto
        DropDownProdPdd.DataValueField = "ID_froduto" ' Definir o campo de valor para o ID do produto
        Produtos2.DataBind()
        DropDownProdPdd.DataBind()
    End Sub


    Protected Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click

        ' Verificar se todos os campos estão preenchidos
        If DropDownFornPdd.SelectedIndex = -1 OrElse DropDownProdPdd.SelectedIndex = -1 OrElse String.IsNullOrEmpty(txtQuantidade.Text) OrElse String.IsNullOrEmpty(txtDataPdd.Text) OrElse String.IsNullOrEmpty(txtDataEntregaPdd.Text) OrElse DropDownStatusPdd0.SelectedIndex = -1 OrElse DropDownStatusPdd0.SelectedIndex = 0 Then
            ' Exibir uma mensagem de erro informando que todos os campos devem ser preenchidos
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Script", "<script>alert('Todos os campos devem ser preenchidos');</script>")
            Return ' Sai do método
        End If

        ' Crie um novo DataTable se ainda não existir um no ViewState
        If ViewState("Pedidos") Is Nothing Then
            Dim dt As New DataTable()
            dt.Columns.Add("ID_froduto")
            dt.Columns.Add("Fornecedor")
            dt.Columns.Add("Produto")
            dt.Columns.Add("Quantidade")
            dt.Columns.Add("Data")
            dt.Columns.Add("Data_Entrega")
            dt.Columns.Add("Status")
            ViewState("Pedidos") = dt
        End If

        ' Adicione a nova linha ao DataTable
        Dim dtPedidos As DataTable = DirectCast(ViewState("Pedidos"), DataTable)
        Dim row As DataRow = dtPedidos.NewRow()

        ' Verifica se o valor selecionado em DropDownProdPdd pode ser convertido em um número inteiro
        Dim idProduto As Integer
        If Integer.TryParse(DropDownProdPdd.SelectedValue, idProduto) Then
            ' O valor selecionado pode ser convertido em um número inteiro
            row("ID_froduto") = idProduto
        Else
            ' O valor selecionado não é um número inteiro válido
            ' Você pode lidar com isso de acordo com a lógica do seu aplicativo
        End If

        row("Fornecedor") = DropDownFornPdd.SelectedItem.Text ' Aqui você pode precisar acessar o texto selecionado em vez do valor
        row("Produto") = DropDownProdPdd.SelectedItem.Text ' Aqui você pode precisar acessar o texto selecionado em vez do valor
        row("Quantidade") = txtQuantidade.Text
        row("Data") = txtDataPdd.Text
        row("Data_Entrega") = txtDataEntregaPdd.Text
        row("Status") = DropDownStatusPdd0.SelectedItem.Text ' Aqui você pode precisar acessar o texto selecionado em vez do valor

        ' Limpar o DataTable antes de adicionar uma nova linha
        dtPedidos.Rows.Clear()

        ' Adicionar a nova linha ao DataTable
        dtPedidos.Rows.Add(row)

        ' Atualize o GridView
        GridViewCadProd.DataSource = dtPedidos
        GridViewCadProd.DataBind()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnCadPddPrd.Click
        Try
            ' Obter os dados do pedido dos controles na página
            Dim idFornecedor As Integer = Integer.Parse(DropDownFornPdd.SelectedValue) ' Obter o ID do fornecedor selecionado no DropDownList
            Dim dataPedido As Date = Date.Parse(txtDataPdd.Text) ' Obter a data do pedido do controle de texto
            Dim dataEntregaEsperada As Date = Date.Parse(txtDataEntregaPdd.Text) ' Obter a data de entrega esperada do controle de texto

            ' Definir a consulta SQL para inserir o pedido na tabela Pedidos
            Dim sql As String = "INSERT INTO Pedidos (ID_Fornecedor, Data_Pedido, Data_Entrega_Esperada) OUTPUT INSERTED.ID_Pedido VALUES (@ID_Fornecedor, @Data_Pedido, @Data_Entrega_Esperada)"

            ' Criar um novo comando SQL com a consulta e a conexão
            Using cmd As New SqlCommand(sql, connect)
                ' Adicionar os parâmetros ao comando
                cmd.Parameters.AddWithValue("@ID_Fornecedor", idFornecedor) ' Adicionar o ID do fornecedor como parâmetro
                cmd.Parameters.AddWithValue("@Data_Pedido", dataPedido) ' Adicionar a data do pedido como parâmetro
                cmd.Parameters.AddWithValue("@Data_Entrega_Esperada", dataEntregaEsperada) ' Adicionar a data de entrega esperada como parâmetro

                ' Abrir a conexão com o banco de dados
                connect.Open()

                ' Executar o comando e obter o ID do pedido inserido
                Dim idPedido As Integer = Convert.ToInt32(cmd.ExecuteScalar())

                ' Agora, para cada linha no GridViewCadProd, vamos inserir um novo item de pedido na tabela Itens_Pedido
                For Each row As GridViewRow In GridViewCadProd.Rows
                    Dim idProduto As Integer = Convert.ToInt32(row.Cells(0).Text)
                    Dim quantidade As Integer = Convert.ToInt32(row.Cells(3).Text) ' Ajustar para a coluna correta

                    ' Definir a consulta SQL para inserir o item do pedido na tabela Itens_Pedido
                    sql = "INSERT INTO Itens_Pedido (ID_Pedido, ID_froduto, Quantidade) VALUES (@ID_Pedido, @ID_froduto, @Quantidade)"

                    ' Criar um novo comando SQL com a consulta e a conexão
                    cmd.CommandText = sql

                    ' Limpar os parâmetros anteriores do comando
                    cmd.Parameters.Clear()

                    ' Adicionar os parâmetros ao comando
                    cmd.Parameters.AddWithValue("@ID_Pedido", idPedido) ' Adicionar o ID do pedido como parâmetro
                    cmd.Parameters.AddWithValue("@ID_froduto", idProduto) ' Adicionar o ID do produto como parâmetro
                    cmd.Parameters.AddWithValue("@Quantidade", quantidade) ' Adicionar a quantidade como parâmetro

                    ' Executar o comando
                    cmd.ExecuteNonQuery()
                Next

                ' Exibir a mensagem "Pedido adicionado com sucesso"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "Script", "<script>alert('Pedido adicionado com sucesso');</script>")
            End Using

            ' Limpar os campos de entrada
            DropDownFornPdd.ClearSelection()
            DropDownProdPdd.ClearSelection()
            txtDataPdd.Text = String.Empty
            txtDataEntregaPdd.Text = String.Empty
            txtQuantidade.Text = String.Empty
            txtDataPdd.Text = String.Empty
            txtDataEntregaPdd.Text = String.Empty
            DropDownStatusPdd0.ClearSelection()


            ' Limpar o GridView
            GridViewCadProd.DataSource = Nothing
            GridViewCadProd.DataBind()
        Catch ex As Exception
            ' Exibir o erro
            Console.WriteLine("Erro: " & ex.Message)
        Finally
            ' Fechar a conexão com o banco de dados
            If connect.State = ConnectionState.Open Then
                connect.Close()
            End If
        End Try
    End Sub
End Class