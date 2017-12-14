Imports MySql.Data.MySqlClient

Public Class historialReservas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("id_usuario") > 0 Then
                Dim conexion As MySqlConnection
                Dim comando As MySqlCommand
                Dim reader As MySqlDataReader

                conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                comando = New MySqlCommand("SELECT * FROM `reserva` WHERE id_usuario=@id", conexion)
                comando.Parameters.AddWithValue("@id", Session("id_usuario"))
                conexion.Open()
                'id_usuario = Request.QueryString("id_usuario")
                Try

                    reader = comando.ExecuteReader
                    repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
                    repeater.DataBind()

                Catch ex As Exception

                End Try
                conexion.Close()
            Else
                MsgBox("DEBE INGRESAR CON CUENTA DE USUARIO", MsgBoxStyle.OkOnly, "DEBE INGRESAR CON CUENTA DE USUARIO")
                Response.Redirect("login.aspx")
            End If




        End If
    End Sub

End Class