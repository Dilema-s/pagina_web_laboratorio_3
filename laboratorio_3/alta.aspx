<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="alta.aspx.vb" Inherits="laboratorio_3.alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    
   
    <title>Dar de alta un socio</title>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    
    <!-- Latest compiled and minified JavaScript -->
    <script  type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet"/>

    <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet"/>

    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"/>

    <link rel="stylesheet" type="text/css" href="Stylesheet1.css"/>

    <script type="text/javascript" src="funciones.js"></script>
   
</head>


<body>


    <div class="container-fluid cabe fondo">

    <div class="container-fluid cabezera">
      <header>  

       
      <img src="logo1.png" width="14%" style="margin-left: 10%;" alt="Logo de la Biblioteca"/>
        <h1 class="text-center pull-right"> "Biblioteca Popular J. M. Estrada" </h1> 
        

      </header>   

    </div>

    <h1 class="text-right titulo">Asociate!!</h1>


    <div class="row">

    <div class="col-md-2">

      <nav >
         <ul class="nav text-center">
              <li ><a href="principal.aspx"><i class="fa fa-home icon" aria-hidden="true"></i>Principal</a></li>
            <li ><a href="login.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Volver</a></li>
         
              
         <%-- <li><a class="text-center active" href="#"><i class="fa fa-user-circle-o icon" aria-hidden="true"></i> Asociarse</a></li>--%>
          <%--<li><a class="text-center" href="#"><i class="fa fa-camera-retro icon" aria-hidden="true"></i> Modificar Cuenta</a></li>
          <li><a class="text-center" href="#"><i class="fa fa-tty icon" aria-hidden="true"></i> Dar de baja mi cuenta :(</a></li>--%>
          
        </ul>
       </nav>
    </div>

    <div class="container col-md-offset-2 col-md-6">
      <form id="form1" runat="server" class="form-horizontal">
    


        
          
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2">Nombre</label>
            <div class="col-sm-10">
             <input id="nombr" class="form-control" runat="server" placeholder="nombre" type="text"/>  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" controltovalidate="nombr" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>    
            </div>
          </div>

          <div class="form-group">
              <label for="inputPassword3" class="col-sm-2">Apellido</label>
            <div class="col-sm-10">
              <input id="apellid" class="form-control" runat="server" placeholder="Apellido" type="text"/> 
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" controltovalidate="apellid" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>

           <div class="form-group">
              <label for="inputdni" class="col-sm-2">DNI</label>
            <div class="col-sm-10">
              <input id="deni" class="form-control" runat="server" placeholder="DNI" type="text"/>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" controltovalidate="deni" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ControlToValidate="deni" ErrorMessage="Ingrese solo números" 
                Operator="DataTypeCheck" Type="Integer" ValidationGroup="grupo1"></asp:CompareValidator>
            </div>
          </div>

           <div class="form-group">
            <label for="inputCalle" class="col-sm-2">Calle</label>
            <div class="col-sm-10">
               <input id="callee" class="form-control" runat="server" placeholder="Calle" type="text"/> 
               
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" controltovalidate="callee" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>
 

          <div class="form-group">
            <label for="inputNumero" class="col-sm-2">Número</label>
            <div class="col-sm-10">
               <input id="num" class="form-control" runat="server" placeholder="Número" type="text"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" controltovalidate="num" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToValidate="num" ErrorMessage="Ingrese solo números" 
                Operator="DataTypeCheck" Type="Integer" ValidationGroup="grupo1"></asp:CompareValidator> 

            </div>
          </div>

          <div class="form-group">
            <label for="inputLocalidad" class="col-sm-2">Localidad</label>
            <div class="col-sm-10">
              <input id="local" class="form-control" runat="server" placeholder="Localidad" type="text"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" controltovalidate="local" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>

           <div class="form-group">
            <label for="inputMail" class="col-sm-2">Mail</label>
            <div class="col-sm-10">
                <input type="email" id="mail" class="form-control" runat="server" placeholder="Mail" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" controltovalidate="mail" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>

           <div class="form-group">
            <label for="inputContrseña" class="col-sm-2">Contraseña</label>
            <div class="col-sm-10">
              <input id="pas" class="form-control" runat="server" placeholder="Contraseña" type="password"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" controltovalidate="pas" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>

          <div class="form-group">
              <p><input type="button" class="btn btn-warning" onclick=" $('#exampleModal').modal('show');" value="Condiciones"/></p>
            <div class="col-sm-offset-2 col-sm-10">
              <div class="checkbox">
                  
                <label>
                  <input id="condiciones" runat="server" type="checkbox"/> He leído la condiciones para ser socio
                </label>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <asp:Button ID="boton" cssclass="btn btn-success btn-lg" runat="server" Text="Confirmar Datos" ValidationGroup="grupo1" />
            </div>
          </div>
        </form>
    
  
    
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Codiciones establecidas en el statuto</h4>
              </div>
              <div class="modal-body">
                <p>Los libros se prestan por 15 días.</p>
                <p>Se cobrará una cuota societaria mensual de bajo costo.</p>
                <p>Los libros que por cualquier motivo no sean devueltos, se deberá abonar el costo del mismo, para reemplazarlo.</p>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Entendi!!</button>
                
              </div>
            </div>
          </div>
        </div>
     

      
      <br/>

    </div>

    
      </div>


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
