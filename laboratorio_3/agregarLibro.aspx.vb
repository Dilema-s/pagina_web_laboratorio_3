Imports MySql.Data.MySqlClient

Public Class agregarLibro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not (IsPostBack) Then
            If Session("id_usuario") > 0 Then
                Dim conexion As MySqlConnection
                'Dim comando As MySqlCommand

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

        comando = New MySqlCommand(" INSERT INTO `libro` VALUES (null,@titulo, @autor, @genero,@editor, @año,@descripcion,0,1)", conexion)

        comando.Parameters.AddWithValue("@titulo", titulo.Value)
        comando.Parameters.AddWithValue("@autor", Autor.Value)
        comando.Parameters.AddWithValue("@genero", genero.SelectedItem.Value)
        comando.Parameters.AddWithValue("@editor", editor.Value)
        comando.Parameters.AddWithValue("@año", año.Value)
        comando.Parameters.AddWithValue("@descripcion", descripcion.Value)



        conexion.Open()
        Try
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