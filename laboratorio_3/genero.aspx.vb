Imports MySql.Data.MySqlClient

Public Class genero
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("id_usuario") > 0 Then
                actualizar()
            Else
                MsgBox("DEBE INGRESAR CON CUENTA DE USUARIO", MsgBoxStyle.OkOnly, "DEBE INGRESAR CON CUENTA DE USUARIO")
                Response.Redirect("login.aspx")
            End If

        End If
    End Sub

    Private Sub aceptar_ServerClick(sender As Object, e As EventArgs) Handles aceptar.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("UPDATE `genero` SET  `genero` =@genero WHERE `id_genero`=@id_genero", conexion)
        comando.Parameters.AddWithValue("@genero", gen.Value)
        comando.Parameters.AddWithValue("@id_genero", id_gener.Value)

        Try
            conexion.Open()
            reader = comando.ExecuteReader
            repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater.DataBind()

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
        End Try
        conexion.Close()
        actualizar()

    End Sub


    Private Sub eliminar_ServerClick(sender As Object, e As EventArgs) Handles eliminar.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand


        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("UPDATE `genero` SET  `baja` =1 WHERE `id_genero`=@id_genero", conexion)
        comando.Parameters.AddWithValue("@id_genero", Text1.Value)

        Try
            conexion.Open()
            comando.ExecuteNonQuery()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
        End Try
        conexion.Close()
        actualizar()

    End Sub

    Private Sub boton_Click(sender As Object, e As EventArgs) Handles boton.Click

        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand(" INSERT INTO genero VALUES (null,@genero,0)", conexion)
        comando.Parameters.AddWithValue("@genero", genero.Value)

        Try
            conexion.Open()
            comando.ExecuteNonQuery()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
        End Try
        conexion.Close()
        genero.Value = ""
        actualizar()
    End Sub

    Private Sub actualizar()
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT `id_genero`, `genero`, `baja` FROM `genero` WHERE baja=0", conexion)
        Try
            conexion.Open()
            reader = comando.ExecuteReader
            repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater.DataBind()

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
        End Try
        conexion.Close()
    End Sub
End Class