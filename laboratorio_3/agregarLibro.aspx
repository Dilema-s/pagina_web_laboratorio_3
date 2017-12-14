<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="agregarLibro.aspx.vb" Inherits="laboratorio_3.agregarLibro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Alta Libro</title>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

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

    <h2 class="text-right titulo">Alta libros</h2>


    <div class="row">

    <div class="col-md-2">

      <nav >
         <ul class="nav text-center">
             
              <li ><a href="menu.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Volver</a></li>
             <li ><a href="genero.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Agregar Género</a></li>
             <li ><a href="eliminarModificarLibro.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Modificar/Eliminar Libro</a></li>
        </ul>
       </nav>
    </div>

    <div class="container col-md-offset-1 col-md-7">
     
    


          <form id="form1" runat="server">
          
          <div class="form-group">
            <label for="inputTitulo" class="col-sm-2">Título</label>
            <div class="col-sm-10">
             <input id="titulo" class="form-control" runat="server" placeholder="Título" type="text"/>  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" controltovalidate="titulo" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>    
            </div>
          </div>

          <div class="form-group">
              <label for="inputAutor" class="col-sm-2">Autor</label>
            <div class="col-sm-10">
              <input id="Autor" class="form-control" runat="server" placeholder="Autor" type="text"/> 
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" controltovalidate="Autor" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>

           <div class="form-group">
              <label for="inputGenero" class="col-sm-2">Género</label>
            <div class="col-sm-10">
              <asp:DropDownList ID="genero" runat="server" ViewStateMode="Enabled" Height="28px" Width="310px">
                </asp:DropDownList>
                <br />
                
                <br />
            </div>    
          </div>

           <div class="form-group">
            <label for="inputCalle" class="col-sm-2">Editor</label>
            <div class="col-sm-10">
               <input id="editor" class="form-control" runat="server" placeholder="Editor" type="text"/> 
               
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" controltovalidate="editor" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>
 

          <div class="form-group">
            <label for="inputNumero" class="col-sm-2">Año</label>
            <div class="col-sm-10">
               <input id="año" class="form-control" runat="server" placeholder="Año de edición" type="text"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" controltovalidate="año" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToValidate="año" ErrorMessage="Ingrese solo números" 
                Operator="DataTypeCheck" Type="Integer" ValidationGroup="grupo1"></asp:CompareValidator> 

            </div>
          </div>

          <div class="form-group">
            <label for="inputLocalidad" class="col-sm-2">Descripción</label>
            <div class="col-sm-10">
              <input id="descripcion" class="form-control" runat="server" placeholder="Descripción" type="text"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" controltovalidate="descripcion" runat="server" 
                ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <asp:Button ID="boton" cssclass="btn btn-success btn-lg" runat="server" Text="Confirmar Datos" ValidationGroup="grupo1" />
            </div>
          </div>
        
    
  
    
         </form>

      
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
