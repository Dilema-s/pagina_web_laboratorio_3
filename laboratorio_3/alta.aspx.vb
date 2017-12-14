Imports MySql.Data.MySqlClient

Public Class alta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub boton_Click(sender As Object, e As EventArgs) Handles boton.Click
        If condiciones.Checked Then

            Dim conexion As MySqlConnection
            Dim comando As MySqlCommand

            conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))

            comando = New MySqlCommand(" INSERT INTO socio VALUES (null,@nombre, @apellido, @documento,@calle, @numero,@mail,@localidad,@contraseña,1)", conexion)

            comando.Parameters.AddWithValue("@apellido", apellid.Value)
            comando.Parameters.AddWithValue("@nombre", nombr.Value)
            comando.Parameters.AddWithValue("@documento", deni.Value)
            comando.Parameters.AddWithValue("@calle", callee.Value)
            comando.Parameters.AddWithValue("@numero", num.Value)
            comando.Parameters.AddWithValue("@mail", mail.Value)
            comando.Parameters.AddWithValue("@localidad", local.Value)
            comando.Parameters.AddWithValue("@contraseña", pas.Value)


            conexion.Open()
            Try
                comando.ExecuteNonQuery()
            Catch ex As Exception

            End Try
            conexion.Close()
            Response.Redirect("login.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                            "condicion", "condicion();", True)
        End If


    End Sub
End Class