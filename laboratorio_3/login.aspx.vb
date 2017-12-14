Imports MySql.Data.MySqlClient


Public Class login
    Inherits System.Web.UI.Page
    Public aux As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If


    End Sub

    Private Sub validarUsuario_Click(sender As Object, e As EventArgs) Handles validarUsuario.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT `id_usuario`, `mail`, `contrasenia` FROM `socio` WHERE mail=@mail and contrasenia=@contraseña and baja=1", conexion)
        comando.Parameters.AddWithValue("@mail", mail.Value)
        comando.Parameters.AddWithValue("@contraseña", contraseña.Value)


        Try
            conexion.Open()
            reader = comando.ExecuteReader()


            If (reader.Read()) Then 'Devuelve true si hay datos, false si no hay datos'
                'Dim id As Long = reader.GetInt64("id_usuario")
                'Session("id_usuario") = reader("id_usuario")
                Session("id_usuario") = reader.GetInt32("id_usuario")
                'Response.Redirect("menu.aspx?id_usuario=" & reader.GetInt64("id_usuario"))
                Response.Redirect("menu.aspx")
            Else

                'Label1.Text = "Contraseña incorreta"
                ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                            "sass", "sass();", True)
                'aux = "#exampleModal"


            End If


        Catch ex As Exception

        End Try



    End Sub

    Private Sub crearCuenta_Click(sender As Object, e As EventArgs) Handles crearCuenta.Click
        Response.Redirect("alta.aspx")
    End Sub


End Class