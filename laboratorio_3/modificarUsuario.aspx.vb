Imports MySql.Data.MySqlClient

Public Class modificarUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Session("id_usuario") > 0 Then
                Dim conexion As MySqlConnection
                Dim comando As MySqlCommand
                Dim reader As MySqlDataReader

                conexion = New MySqlConnection(ConfigurationManager.AppSettings("conexionDB"))
                comando = New MySqlCommand("SELECT * FROM `socio` WHERE id_usuario=@id_usuario and baja=1 ", conexion)
                comando.Parameters.AddWithValue("@id_usuario", Session("id_usuario"))

                conexion.Open()

                Try

                    reader = comando.ExecuteReader()


                    If (reader.Read()) Then 'Devuelve true si hay datos, false si no hay datos'
                        nombr.Value = reader.GetString("nombre")
                        apellid.Value = reader.GetString("apllido")
                        deni.Value = reader.GetString("num_documento")
                        callee.Value = reader.GetString("calle")
                        num.Value = reader.GetString("numero")
                        local.Value = reader.GetString("localidad")
                        mail.Value = reader.GetString("mail")

                    Else

                        ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                                    "error", "error();", True)

                    End If


                Catch ex As Exception

                End Try

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

        comando = New MySqlCommand(" UPDATE socio SET nombre=@nombre, apllido=@apellido,num_documento=@documento,calle=@calle,numero=@numero,mail=@mail,localidad=@localidad,contrasenia=@contraseña  WHERE id_usuario=@id_usuario", conexion)

        comando.Parameters.AddWithValue("@apellido", apellid.Value)
        comando.Parameters.AddWithValue("@nombre", nombr.Value)
        comando.Parameters.AddWithValue("@documento", deni.Value)
        comando.Parameters.AddWithValue("@calle", callee.Value)
        comando.Parameters.AddWithValue("@numero", num.Value)
        comando.Parameters.AddWithValue("@mail", mail.Value)
        comando.Parameters.AddWithValue("@localidad", local.Value)
        comando.Parameters.AddWithValue("@contraseña", pas.Value)
        comando.Parameters.AddWithValue("@id_usuario", Session("id_usuario"))

        conexion.Open()
        Try
            comando.ExecuteNonQuery()
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                        "ok", "ok();", True)
            Response.Redirect("menu.aspx")
        Catch ex As Exception

            If ex.HResult = -2147467259 Then

                MsgBox("El mail esta siendo utilizado por otro socio \nMuchas Gracias")
            Else
                ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                          "error", "error();", True)
            End If

        End Try
    End Sub
End Class