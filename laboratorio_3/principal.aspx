<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="principal.aspx.vb" Inherits="laboratorio_3.principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Página Principal</title>

     <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    
    <%--<!-- Latest compiled and minified JavaScript -->
    <script  type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>

    <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet"/>

    <link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet"/>

   <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"/>

    <link rel="stylesheet" type="text/css" href="Stylesheet1.css"/>


</head>
<body>
    
  <div class="container-fluid cabe fondo">

    <div class="container-fluid cabezera">
      <header>  

       
        <img src="logo1.png" style="margin-left: 10%; width:10%"/>
        <h1 class="text-center"> "Biblioteca Popular J. M. Estrada" </h1> 
        <p>N° CONABIP 2254</p>
        

      </header>   

    </div>

    


    <div style="margin-top: 20px;" class="row">

    <div class="col-md-2">

      <nav >
         <ul class="nav text-center">
         <li ><a href="#"><i class="fa fa-home icon" aria-hidden="true"></i> Principal</a></li>
          
              
          <li><a class="text-center active" href="login.aspx"><i class="fa fa-user-circle-o icon" aria-hidden="true"></i> Login</a></li>
        
          
        </ul>
       </nav>
    </div>

    <div class="container col-md-offset-1 col-md-8 info">
      

    
    
     
        <h2>
          El comienzo...
        </h2>
        <p>
          La biblioteca José Manuel Estrada fue fundada por un grupo de personas de la comunidad de Rafaela el 15 de enero de 1937. Desde el año 2001 funciona como asociación civil autónoma, gestionada por la vocación solidaria de un grupo de vecinos, dirigida y sostenida básicamente por sus socios.
          Con el resurgimiento del interés literario, superando la aparición de nuevas tecnologías, la Biblioteca Estrada supo combinar su oferta, complementada con material digital, e incluso con ciclos de cine y cursos de idiomas, para cautivar socios interesados por todos los aspectos que hacen a la cultura que trasciende el territorio cercano; y abre detrás de cada portada una historia diferente y un conocimiento más amplio.
        </p>
    </div>

    
      </div>

    <br/>

    <div class="row">
     
      <div class="col-md-offset-1 col-md-3 text-center">
       
        <div class="thumbnail ">
          
          <img class="img-circle" src="estrada.png" alt="Generic placeholder image"/>
          
          <div class="caption">
            <h2>Donde estamos? </h2>
            <p>La biblioteca esta ubicada en Bv. Hipólito Irigoyen 159 en la ciudad de Rafaela, Santa fe, Argentina</p>
            
          </div>      
        </div>   
      </div>
      
      <div class="col-xs-9 col-md-offset-1 col-md-5" id="mapa">

          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3410.789886822704!2d-61.49419498524779!3d-31.254239381458472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95caae3793cc8445%3A0x6d86ce587b4fed3a!2sBv.+Hip%C3%B3lito+Irigoyen+159%2C+S2300FUU+Rafaela%2C+Santa+Fe!5e0!3m2!1ses-419!2sar!4v1498021044100" width="500" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>

      </div>
    
    </div>


   

     
      
    <button class="btn btn-success" type="button" data-toggle="modal" data-target="<%=aux%>"   data-whatever="@mdo"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Déjanos tu mensaje</button>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">Nuevo mensaje</h4>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="recipient-name" class="control-label">De:</label>
                  <input type="text" class="form-control" id="recipient-name"/>
                </div>
                <div class="form-group">
                  <label for="message-text" class="control-label">Mensaje:</label>
                  <textarea class="form-control" id="message-text"></textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <button type="button" class="btn btn-primary">Enviar mensaje</button>
            </div>
          </div>
        </div>
      </div>









    <footer>
      <p>Copiright 2017 Derechos reservados.</p>
    </footer>
      



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
