Imports MySql.Data.MySqlClient

Public Class misReservas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("id_usuario") > 0 Then

                Dim conexion As MySqlConnection
                Dim comando As MySqlCommand
                Dim reader As MySqlDataReader

                conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                comando = New MySqlCommand("SELECT * FROM `reserva` WHERE baja=0 and id_usuario=@id", conexion)
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

    Private Sub aceptar_ServerClick(sender As Object, e As EventArgs) Handles aceptar.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("UPDATE `reserva` SET `baja`=1  WHERE`id_reserva`=@id_reserva", conexion)
        comando.Parameters.AddWithValue("@id_reserva", id_reserva.Value)

        conexion.Open()
        Try
            comando.ExecuteNonQuery()

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                           "error", "error();", True)
        End Try

        moificarEstadoItem()

        Dim reader As MySqlDataReader


        comando = New MySqlCommand("SELECT * FROM `reserva` WHERE baja=0", conexion)


        Try

            reader = comando.ExecuteReader
            repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater.DataBind()

        Catch ex As Exception

        End Try
        conexion.Close()




    End Sub

    Private Sub moificarEstadoItem()


        Dim conexion2 As MySqlConnection
        Dim comando2 As MySqlCommand
        Dim reader2 As MySqlDataReader

        conexion2 = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando2 = New MySqlCommand(" SELECT `estado` FROM `libro` WHERE `titulo`=@titulo AND baja=0 ", conexion2)
        comando2.Parameters.AddWithValue("@titulo", titulo.Value)



        Try
            conexion2.Open()
            reader2 = comando2.ExecuteReader
            If (reader2.Read()) Then
                If (reader2("estado") = 3) Then

                    Dim conexion As MySqlConnection
                    Dim comando As MySqlCommand
                    Dim reader As MySqlDataReader
                    Dim c As Int16 = 0
                    conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                    comando = New MySqlCommand(" SELECT `id_reserva` FROM `reserva` WHERE `id_item` =@titulo AND baja=0 ", conexion)
                    comando.Parameters.AddWithValue("@titulo", titulo.Value)
                    comando.Parameters.AddWithValue("@id_usuario", Session("id_usuario"))

                    Try
                        conexion.Open()
                        reader = comando.ExecuteReader
                        If (reader.Read()) Then

                            'Saber si tiene reservas pendientes'

                            c = c + 1

                        End If



                        If (c = 0) Then
                            Dim conexion1 As MySqlConnection
                            Dim comando1 As MySqlCommand
                            conexion1 = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                            'si no tiene pasa a estado disponible'

                            'If (item2.Value Like "dvd") Then
                            '    comando = New MySqlCommand(" UPDATE `dvd` SET `estado`=1 WHERE titulo=@id_item", conexion)
                            '    comando.Parameters.AddWithValue("@id_item", titulo.Value)
                            'Else

                            comando1 = New MySqlCommand(" UPDATE `libro` SET estado=1 WHERE `titulo`=@titulo", conexion1)
                            comando1.Parameters.AddWithValue("@titulo", titulo.Value)
                            'End If
                            conexion1.Open()
                            comando1.ExecuteNonQuery()
                            conexion1.Close()

                        End If



                    Catch ex As Exception
                        ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)

                        conexion.Close()
                    End Try


                End If
            End If
            conexion2.Close()
        Catch ex As Exception
            conexion2.Close()
        End Try


    End Sub

End Class