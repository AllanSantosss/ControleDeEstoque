Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub SaberMais_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim button As Button = CType(sender, Button)
        Dim commandName As String = button.CommandName

        Select Case commandName
            Case "Produtos"
                ' Configurar a fonte de dados do GridView para exibir os dados dos produtos
                GridHome.DataSourceID = "Home2"
                lblTitle.Text = "Produtos"

            Case "Clientes"
                ' Configurar a fonte de dados do GridView para exibir os dados dos clientes
                GridHome.DataSourceID = "Home1"
                lblTitle.Text = "Lojas"

            Case "Fornecedores"
                ' Configurar a fonte de dados do GridView para exibir os dados dos fornecedores
                GridHome.DataSourceID = "Home3"
                lblTitle.Text = "Fornecedores"
        End Select

        ' Atualizar o GridView com os novos dados
        GridHome.DataBind()
    End Sub


    Private Sub BindClientesData()
        Dim query As String = "SELECT * FROM clientes"
        BindGridView(query)
    End Sub

    Private Sub BindProdutosData()
        Dim query As String = "SELECT * FROM produtos"
        BindGridView(query)
    End Sub

    Private Sub BindFornecedoresData()
        Dim query As String = "SELECT * FROM fornecedores"
        BindGridView(query)
    End Sub

    Private Sub BindGridView(ByVal query As String)
        Dim connectionString As String = "Data Source=DESKTOP-5M73QD3;Initial Catalog=new_site;Integrated Security=True;"
        Dim dataTable As New DataTable()

        Using connection As New SqlConnection(connectionString)
            Using adapter As New SqlDataAdapter(query, connection)
                adapter.Fill(dataTable)
            End Using
        End Using

        GridHome.DataSource = dataTable
        GridHome.DataBind()
    End Sub



End Class
