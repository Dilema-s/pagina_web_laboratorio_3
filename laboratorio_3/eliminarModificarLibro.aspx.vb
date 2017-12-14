﻿Imports MySql.Data.MySqlClient

Public Class eliminarModificarLibro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("id_usuario") > 0 Then
                'Carga los datos de los libros en una tabla'
                actualizar()

                'Carga el dropDown de estado'
                Dim conexion1 As MySqlConnection
                conexion1 = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                Dim adp1 As MySqlDataAdapter = New MySqlDataAdapter("SELECT * FROM `estado`", conexion1)

                Dim dt1 As DataTable = New DataTable()
                adp1.Fill(dt1)

                If (dt1.Rows.Count > 0) Then
                    estado.DataSource = dt1
                    estado.DataTextField = "estado"
                    estado.DataValueField = "id_estado"
                    estado.DataBind()
                End If
                conexion1.Close()

                'llena el dropdown con los generos'

                Dim conexion As MySqlConnection
                conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                Dim adp As MySqlDataAdapter = New MySqlDataAdapter("SELECT `id_genero`, `genero` FROM `genero` WHERE baja=0", conexion)

                Dim dt As DataTable = New DataTable()
                adp.Fill(dt)

                If (dt.Rows.Count > 0) Then
                    genero.DataSource = dt
                    genero.DataTextField = "genero"
                    genero.DataValueField = "id_genero"
                    genero.DataBind()
                End If
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

        comando = New MySqlCommand(" UPDATE `libro` SET `titulo`=@titulo,`autor`=@autor,`genero`=@genero,`editor`=@editor,`anio`=@año,`descripcion`=@descripcion,`baja`=0,`estado`=@estado WHERE id_libro=@id_libro", conexion)

        comando.Parameters.AddWithValue("@titulo", titulo.Value)
        comando.Parameters.AddWithValue("@autor", autor.Value)
        comando.Parameters.AddWithValue("@genero", genero.SelectedItem.Value)
        comando.Parameters.AddWithValue("@editor", editor.Value)
        comando.Parameters.AddWithValue("@año", año.Value)
        comando.Parameters.AddWithValue("@descripcion", descripcion.Value)
        comando.Parameters.AddWithValue("@id_libro", id_libro.Value)
        comando.Parameters.AddWithValue("@estado", estado.SelectedItem.Value)



        Try
            conexion.Open()
            comando.ExecuteNonQuery()
            conexion.Close()

        Catch ex As Exception
            conexion.Close()
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                           "error", "error();", True)
        End Try
        actualizar()
    End Sub


    Private Sub actualizar()
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand
        Dim reader As MySqlDataReader

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("SELECT id_libro,descripcion,titulo,autor,editor,anio,e.estado,e.id_estado, g.genero,g.id_genero FROM `libro` l INNER JOIN genero g ON g.id_genero = l.genero INNER JOIN estado e On e.id_estado=l.estado WHERE l.baja = 0", conexion)

        Try
            conexion.Open()
            reader = comando.ExecuteReader
            repeater.DataSource = reader 'despues de un data source, q es el origen de los datos, hay que hacer un data bin para ejecutar el datasource'
            repeater.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                          "error", "error();", True)
        End Try
        conexion.Close()
    End Sub

    Private Sub eliminar_ServerClick(sender As Object, e As EventArgs) Handles eliminar.ServerClick
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
        comando = New MySqlCommand("UPDATE `libro` SET  `baja` =1 WHERE `id_libro`=@id_libro", conexion)
        comando.Parameters.AddWithValue("@id_libro", Text1.Value)

        Try
            conexion.Open()
            comando.ExecuteNonQuery()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType, "error", "error();", True)
        End Try
        conexion.Close()
        actualizar()
    End Sub
End Class