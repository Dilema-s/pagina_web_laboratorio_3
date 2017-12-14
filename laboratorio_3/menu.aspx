<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="menu.aspx.vb" Inherits="laboratorio_3.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Menu principal</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <script type="text/javascript" src="funciones.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet" />

    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" />

    <link rel="stylesheet" type="text/css" href="Stylesheet1.css" />

    <script>
        
        $(function () {
          //  var checkbox = $('#reserva').is(':checked')
            
          //if (checkbox) {

              $('#exampleModal').modal('show');
          

});

        


    </script>

</head>
<body>
     <div class="container-fluid cabe fondo">

        <div class="container-fluid cabezera">
            <header>


                <img src="logo1.png" width="14%" style="margin-left: 10%;"/>
                <h1 class="text-center pull-right"> "Biblioteca Popular J. M. Estrada" </h1>


            </header>

        </div>

        <h3 class="text-right titulo">Nuestros libros!!</h3>


        <div class="row">

            <div class="col-md-2">

                <nav>
                    <ul class="nav text-center">


                        <li><a class="text-center" href="modificarUsuario.aspx?id=<%=id_usuario%>"><i class="fa fa-tty icon" aria-hidden="true"></i>Modificar mi datos</a></li>
                         <li><a class="text-center" href="agregarLibro.aspx"><i class="fa fa-tty icon" aria-hidden="true"></i>Libro</a></li>
                         <li><a class="text-center" href="verModificarDvd.aspx"><i class="fa fa-tty icon" aria-hidden="true"></i>DVD</a></li>
                        <li><a class="text-center" href="misReservas.aspx"><i class="fa fa-home icon" aria-hidden="true"></i>Mis Reservas</a></li>
                        <li><a class="text-center" href="Reportes.aspx"><i class="fa fa-home icon" aria-hidden="true"></i>Informes</a></li>
                        <br />
                        <li><a class="text-center" id="cerrarSesion" href="#"  runat="server"><i class="fa fa-home icon" aria-hidden="true"></i>Cerrar Sesión</a></li>
                         
                    </ul>
                </nav>
            </div>

            <div class="container  col-md-10">

                <form method="post" class="form-horizontal" runat="server">
                    <div class="table-responsive">
                           <table id="tabla" class="table table-striped" style="background-color:white;">
                               <tr>
                                <th>Título</th>
                                <th>Autor</th> 
                                <th>Editor</th>
                                 <th>Género</th>
                                <th>Estado</th>
                                <th>Resevar</th>
                              </tr>
                            <asp:Repeater ID="repeater" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                    <td><%# Container.DataItem("titulo")%></td>
                                    <td><%# Container.DataItem("autor")%></td>
                                    <td><%# Container.DataItem("editor")%></td>
                                    <td><%# Container.DataItem("genero")%></td>
                                    <td><%# Container.DataItem("estado")%></td>
                                    <%--<td> <a href="agregarLibro.aspx?id_libro=<%# Container.DataItem("id_libro")%>">modificar</a></td>--%>
                                    
                                       <td><a href="javascript:$('#exampleModal').modal('show');$('#Text1').val('<%# Container.DataItem("titulo")%>');
                                            $('#id_item').val('<%# Container.DataItem("id_libro")%>');
                                           $('#item2').val('libro');
                                           $('#estado').val('<%# Container.DataItem("id_estado") %>');
                                            $('#labe').html('Confirmar reserva de <%# Container.DataItem("titulo")%> ??');
                                            $('#texto').html('Muchas Gracias por reservar, se le enviará un mensaje cuando el material solicitado este disponible para su retiro.');">RESERVAR</a></td>
                                    </tr>
                                </ItemTemplate>

      
                             </asp:Repeater>
                            </table>
                    </div>
                    <h1 class="text-right titulo">Nuestros DVD's!!</h1>
                     <div class="table-responsive">
                           <table id="tabla2" class="table table-striped" style="background-color:white;">
                               <tr>
                                <th>Título</th>
                                <th>Director</th> 
                                <th>Publicado por</th>
                                 <th>Género</th>
                                <th>Estado</th>
                                <th>Resevar</th>
                              </tr>
                            <asp:Repeater ID="repeater1" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                    <td><%# Container.DataItem("titulo")%></td>
                                    <td><%# Container.DataItem("director")%></td>
                                    <td><%# Container.DataItem("publicado")%></td>
                                    <td><%# Container.DataItem("genero")%></td>
                                    <td><%# Container.DataItem("estado") %></td>
                                    <%--<td> <a href="agregarLibro.aspx?id_libro=<%# Container.DataItem("id_libro")%>">modificar</a></td>--%>
                                    
                                    <td><a href="javascript:$('#exampleModal').modal('show');$('#Text1').val('<%# Container.DataItem("titulo")%>');
                                        $('#id_item').val('<%# Container.DataItem("id_dvd")%>');
                                        $('#item2').val('dvd');
                                        $('#estado').val('<%# Container.DataItem("id_estado") %>');
                                        $('#labe').html('Confirmar reserva de <%# Container.DataItem("titulo")%> ??');
                                        $('#texto').html('Muchas Gracias por reservar, se le enviará un mensaje cuando el material solicitado este disponible para su retiro');">RESERVAR</a></td>
                                    </tr>
                                </ItemTemplate>

      
                             </asp:Repeater>
                            </table>
                    </div>








                     <p><asp:button id="baj" style="background-color:inherit;color:white;" runat="server" Text="Dar de baja mi cuenta"></asp:button></p>
                     


                     <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Préstamo de material</h4>
                            <input style="display:none" type="text" class="modal-title" runat="server" id="Text1"/>
                              <input style="display:none" type="number" class="modal-title" runat="server" id="estado"/>
                              <input style="display:none" type="text" class="modal-title" runat="server" id="item2"/>                     
                              
                               <input style="display:none" type="number" class="modal-title" runat="server" id="id_item"/>
                          </div>
                          <div class="modal-body">
                            <label runat="server" id="labe" style="color:inherit;"></label>
                            
                            <p id="texto" runat="server" style="color:darkgreen"></p>
                            <p style="color:darkgreen" >Recuerde retirarlo en un lapso no mayor a 48 hs</p>
                          </div>
                          <div class="modal-footer">
                            <input id="button" type="button" runat="server" class="btn btn-default" data-dismiss="modal" value="Aceptar"/>
                
                          </div>
                        </div>
                      </div>
                    </div>




                 </form> 
                    
            </div>
              
           


                <br />

            </div>
        
          
                <br /><br />
         

       



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
