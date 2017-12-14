Imports MySql.Data.MySqlClient

Public Class dvd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (IsPostBack) Then
            If Session("id_usuario") > 0 Then
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

    Private Sub boton_Click(sender As Object, e As EventArgs) Handles boton.Click
        Dim conexion As MySqlConnection
        Dim comando As MySqlCommand

        conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))

        comando = New MySqlCommand(" INSERT INTO `dvd` VALUES (null,@titulo, @director,@publicado,@año, @genero, @descripcion,1,0)", conexion)

        comando.Parameters.AddWithValue("@titulo", titulo.Value)
        comando.Parameters.AddWithValue("@director", director.Value)
        comando.Parameters.AddWithValue("@genero", genero.SelectedItem.Value)
        comando.Parameters.AddWithValue("@publicado", publicado.Value)
        comando.Parameters.AddWithValue("@año", año.Value)
        comando.Parameters.AddWithValue("@descripcion", descripcion.Value)




        Try
            conexion.Open()
            comando.ExecuteNonQuery()
            conexion.Close()
            Response.Redirect("menu.aspx")
        Catch ex As Exception
            conexion.Close()
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                           "error", "error();", True)
        End Try

    End Sub
End Class