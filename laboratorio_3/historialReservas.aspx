<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="historialReservas.aspx.vb" Inherits="laboratorio_3.historialReservas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Historial de Reservas</title>


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

            <h2 class="text-right titulo">Mis Reservas</h2>


            <div class="row">

            <div class="col-md-2">

              <nav >
                 <ul class="nav text-center">
             
                      <li ><a href="misReservas.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Volver</a></li>
                    
                </ul>
               </nav>
            </div>

            <div class="container col-md-offset-1 col-md-8">
                <form id="form1" runat="server">
          

                     <div class="table-responsive">
                           <table id="tabla" class="table table-striped" style="background-color:white;">
                               <tr>
                                <th>Título</th>
                                <th>Fecha</th>
                                <th>Estado</th>
                                
                               </tr>
                            <asp:Repeater ID="repeater" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                    <td><%# Container.DataItem("id_item")%></td>
                                    <td><%# Container.DataItem("fecha")%></td>
                                    <td><%#IIf(Container.DataItem("baja") = False, "Activa", "Finalizada")%></td>

                                    </tr>
                                </ItemTemplate>
                                
      
                             </asp:Repeater>
                                 
                            </table>
                          
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
