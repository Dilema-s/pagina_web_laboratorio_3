
Imports MySql.Data.MySqlClient



Public Class Reportes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("id_usuario") > 0 Then
            tabla0.Visible = False
            tabla11.Visible = False
            tabla22.Visible = False
            tabla33.Visible = False
            desde.Value = "2000-01-01"
            hasta.Value = Today.Year.ToString + "-" + Today.Month.ToString + "-" + Today.Day.ToString

        Else
            MsgBox("DEBE INGRESAR CON CUENTA DE USUARIO", MsgBoxStyle.OkOnly, "DEBE INGRESAR CON CUENTA DE USUARIO")
            Response.Redirect("login.aspx")
        End If

    End Sub


    Private Sub listaSocios_ServerClick(sender As Object, e As EventArgs) Handles listaSocios.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader


        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT `id_usuario`, `nombre`, `apllido`, `num_documento`, `calle`, `numero`, `mail`, `localidad` FROM `socio` WHERE baja = 1", conexion)

        Try

            conexion.Open()
            reader = comando.ExecuteReader
            tabla0.Visible = False
            tabla11.Visible = True
            tabla22.Visible = False
            tabla33.Visible = False
            repeater1.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater1.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                          "error", "error();", True)
        End Try
        conexion.Close()
    End Sub

    Private Sub listaDVD_ServerClick(sender As Object, e As EventArgs) Handles listaDVD.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT id_dvd,descripcion,titulo,director,publicado,anio,e.estado,e.id_estado, g.genero,g.id_genero FROM `dvd` d INNER JOIN genero g ON g.id_genero = d.genero INNER JOIN estado e ON e.id_estado=d.estado WHERE d.baja = 0", conexion)

        Try
            conexion.Open()
            reader = comando.ExecuteReader
            tabla0.Visible = True
            tabla11.Visible = False
            tabla22.Visible = False
            tabla33.Visible = False
            repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                          "error", "error();", True)
        End Try
        conexion.Close()
    End Sub



    Private Sub fechas_ServerClick(sender As Object, e As EventArgs) Handles fechas.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT `id_reserva`, `id_item`, concat(s.nombre, ' ', s.apllido) as nombre , `fecha` FROM reserva r INNER JOIN socio s on s.id_usuario = r.id_usuario WHERE fecha BETWEEN @desde AND @hasta", conexion)
        If desde.Value.Trim = "" Then

            desde.Value = "2000-01-01"
        End If
        If hasta.Value.Trim = "" Then
            hasta.Value = Today.Year.ToString + "-" + Today.Month.ToString + "-" + Today.Day.ToString
        End If
        comando.Parameters.AddWithValue("@desde", desde.Value)
        comando.Parameters.AddWithValue("@hasta", hasta.Value)
        Try
            conexion.Open()
            reader = comando.ExecuteReader
            tabla0.Visible = False
            tabla11.Visible = False
            tabla22.Visible = True
            tabla33.Visible = False
            repeater2.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater2.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                          "error", "error();", True)
        End Try
        conexion.Close()
    End Sub

    Private Sub listaLibros_ServerClick(sender As Object, e As EventArgs) Handles listaLibros.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT `id_libro`, `titulo`, `autor`, `genero`, `editor`, `anio`, `descripcion`, e.estado FROM libro l INNER JOIN estado e on e.id_estado = l.estado where l.baja = 0", conexion)

        Try
            conexion.Open()
            reader = comando.ExecuteReader
            tabla0.Visible = False
            tabla11.Visible = False
            tabla22.Visible = False
            tabla33.Visible = True
            repeater3.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater3.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                          "error", "error();", True)
        End Try
        conexion.Close()
    End Sub

End Class