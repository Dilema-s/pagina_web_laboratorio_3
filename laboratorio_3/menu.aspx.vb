Imports MySql.Data.MySqlClient

Public Class menu
    Inherits System.Web.UI.Page
    Public id_usuario As Long

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

    Private Sub baj_Click(sender As Object, e As EventArgs) Handles baj.Click

        Dim result As Integer = MsgBox("Esta seguro que desea dar de baja su cuenta?", MsgBoxStyle.OkCancel, "Confirmar Baja")
        If result = MsgBoxResult.Ok Then

            Dim conexion As MySqlConnection
            Dim comando As MySqlCommand

            conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
            comando = New MySqlCommand(" UPDATE socio SET baja=0  WHERE id_usuario=@id_usuario", conexion)
            comando.Parameters.AddWithValue("@id_usuario", Session("id_usuario"))


            Try
                conexion.Open()
                comando.ExecuteNonQuery()
                ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                            "ok", "ok();", True)
                conexion.Close()
                Response.Redirect("login.aspx")
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                               "error", "error();", True)
                conexion.Close()
            End Try
        End If
    End Sub

    Private Sub button_ServerClick(sender As Object, e As EventArgs) Handles button.ServerClick
        If (cantidadReservas()) Then
            If (reservas()) Then
                Dim conexion As MySqlConnection
                Dim comando As MySqlCommand

                conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                comando = New MySqlCommand(" INSERT INTO reserva (`id_reserva`, `id_item`, `id_usuario`, `fecha`, `baja`) VALUES (null,@titulo,@id_usuario,@fecha,0)", conexion)
                comando.Parameters.AddWithValue("@titulo", Text1.Value)
                comando.Parameters.AddWithValue("@id_usuario", Session("id_usuario"))
                comando.Parameters.AddWithValue("@fecha", Date.Now())
                Try
                    conexion.Open()
                    comando.ExecuteNonQuery()
                    conexion.Close()


                    If (estado.Value = 1) Then
                        Try
                            Dim conexion1 As MySqlConnection
                            Dim comando1 As MySqlCommand
                            conexion1 = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))

                            If (item2.Value Like "dvd") Then
                                comando1 = New MySqlCommand(" UPDATE `dvd` SET `estado`=3 WHERE id_dvd=@id_item", conexion1)
                                comando1.Parameters.AddWithValue("@id_item", id_item.Value)
                            Else

                                comando1 = New MySqlCommand(" UPDATE `libro` SET `estado`=3 WHERE id_libro=@id_item", conexion1)
                                comando1.Parameters.AddWithValue("@id_item", id_item.Value)
                            End If
                            conexion1.Open()
                            comando1.ExecuteNonQuery()
                            conexion1.Close()
                            actualizar()
                        Catch ev As Exception
                            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
                        End Try
                    End If

                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
                End Try

            Else
                ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "reservas", "reservas();", True)
            End If

        Else
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "cantidadReservas", "cantidadReservas();", True)
        End If
    End Sub
    'funcion que hace que consulta  la cantidad de reservas activas del usuario si es menor a cuatro devuelve true, si no false'
    Private Function cantidadReservas() As Boolean
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader
        Dim c As Int16 = 0
        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT * FROM `reserva` WHERE baja=0 and id_usuario=@id", conexion)
        comando.Parameters.AddWithValue("@id", Session("id_usuario"))


        Try
            conexion.Open()
            reader = comando.ExecuteReader

            If (reader.Read()) Then
                c = c + 1
            End If

            conexion.Close()

            If (c > 4) Then
                Return False
            Else
                Return True
            End If

        Catch ex As Exception
            conexion.Close()
            Return False
        End Try
    End Function



    'Verifica que la reserva que se quiere hacer no este ya activa, devuelve true si la reserva no existe ya y false en caso contrario'

    Private Function reservas() As Boolean
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader
        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand(" SELECT `id_reserva` FROM `reserva` WHERE `id_item` =@titulo AND baja=0 AND `id_usuario`=@id_usuario", conexion)
        comando.Parameters.AddWithValue("@titulo", Text1.Value)
        comando.Parameters.AddWithValue("@id_usuario", Session("id_usuario"))

        Try
            conexion.Open()
            reader = comando.ExecuteReader

            If (reader.Read()) Then
                conexion.Close()
                Return False
            Else
                conexion.Close()
                Return True
            End If


        Catch ex As Exception
            conexion.Close()
            Return False
        End Try

    End Function

    Private Sub actualizar()
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT id_libro,titulo,autor,editor,anio, g.genero,e.estado,e.id_estado FROM `libro` l INNER JOIN genero g ON g.id_genero = l.genero  INNER JOIN estado e ON e.id_estado=l.estado WHERE l.baja = 0", conexion)

        Try
            conexion.Open()
            reader = comando.ExecuteReader
            repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'

            repeater.DataBind()
            reader.Close()
        Catch ex As Exception

        End Try
        conexion.Close()



        Dim conexion1 As MySqlConnection
        Dim comando1 As MySqlCommand
        Dim reader1 As MySqlDataReader

        conexion1 = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando1 = New MySqlCommand("SELECT id_dvd,descripcion,titulo,director,publicado,anio,e.estado,e.id_estado, g.genero FROM `dvd` d INNER JOIN genero g ON g.id_genero = d.genero INNER JOIN estado e ON e.id_estado=d.estado WHERE d.baja = 0", conexion1)

        Try
            conexion1.Open()
            reader1 = comando1.ExecuteReader
            repeater1.DataSource = reader1 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater1.DataBind()
            reader1.Close()
        Catch ex As Exception

        End Try
        conexion1.Close()
    End Sub

    Private Sub cerrarSesion_ServerClick(sender As Object, e As EventArgs) Handles cerrarSesion.ServerClick
        Session.Clear()
        Response.Redirect("principal.aspx")
    End Sub
End Class