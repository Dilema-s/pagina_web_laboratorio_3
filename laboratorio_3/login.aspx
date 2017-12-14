<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="laboratorio_3.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Login</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <script type="text/javascript" src="funciones.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet" />

    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" />

    <link rel="stylesheet" type="text/css" href="Stylesheet1.css" />

   

</head>

<body>

    <div class="container-fluid cabe fondo">

        <div class="container-fluid cabezera">
            <header>


                <img src="logo1.png" width="14%" style="margin-left: 10%;"/>
                <h1 class="text-center pull-right"> "Biblioteca Popular J. M. Estrada" </h1>


            </header>

        </div>

        <h1 class="text-right titulo">Bienvenido!!</h1>


        <div class="row">

            <div class="col-md-2">

                <nav>
                    <ul class="nav text-center">
                        <li><a href="principal.aspx"><i class="fa fa-home icon" aria-hidden="true"></i>Principal</a></li>


                    </ul>
                </nav>
            </div>

            <div class="container col-md-offset-2 col-md-5">

                <form method="post" class="form-horizontal" runat="server">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                       
                        <input type="email" id="mail" class="form-control" runat="server" placeholder="Mail" />
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" controltovalidate="mail" runat="server"
                         ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseña</label>
                       
                        <input id="contraseña" type="password" class="form-control" runat="server" placeholder="Contraseña" />
                        <asp:RequiredFieldValidator CssClass="" ID="RequiredFieldValidator2" controltovalidate="contraseña" runat="server"
                         ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </div>
                    
                   
                    
                    <input id="validarUsuario"  type="submit" validationgroup="grupo1" class="btn btn-success btn-lg" runat="server"  value="Ingresar!" />
                    <asp:Button ID="crearCuenta" cssclass="btn-danger btn btn-lg" runat="server" Text="Crear mi Cuenta!!!"  />
                 </form> 
                    
            </div>

            <%--<button id="Button1" data-toggle="modal" data-target="" onclick="$('#exampleModal').modal('show');"  value="Button" />--%>
                
              
                <br />

            </div>
        
          <%-- <div class="row">

               <div id="ddd" class="alert alert-danger col-md-offset-4 col-md-5 "  style="display:<%=iif(label1.text="","none","")%>;" role="alert">
               <p id="ppp"></p>
               <asp:Label ID="Label1" runat="server" ></asp:Label></div>

           </div>--%>
                <br /><br />


      <%--  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">Contraseña Incorrecta, vuelva a intentar</h4>
            </div>
          
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button> 
            </div>
          </div>
        </div>
      </div>--%>

        
       

        




        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
              </div>
              <div class="modal-body">
                ...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                
              </div>
            </div>
          </div>
        </div>

        <%--<span data-toggle="#myModal"></span>--%>


        <footer>
            <p>Copiright 2017 Derechos reservados.</p>
        </footer>
    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

   
    



</body>
</html>
