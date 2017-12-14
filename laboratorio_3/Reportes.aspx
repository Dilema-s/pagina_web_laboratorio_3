<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reportes.aspx.vb" Inherits="laboratorio_3.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Modificar DVD</title>

    
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

            <h2 class="text-right titulo">Informes</h2>


            <div class="row">

            <div class="col-md-2">

              <nav >
                 <ul class="nav text-center">
                      <li ><a href="#" id="listaSocios" runat="server"><i class="fa fa-list icon" aria-hidden="true"></i>Lista de socios</a></li>
                      <li ><a href="#" id="listaDVD" runat="server"><i class="fa fa-list icon" aria-hidden="true"></i>Lista de DVD</a></li>
                      <li ><a href="#" id="listaLibros" runat="server"><i class="fa fa-list icon" aria-hidden="true"></i>Lista de Libros</a></li>
                     <li ><a href="#" id="" onclick="$('#baja').modal('show')"><i class="fa fa-list icon" aria-hidden="true"></i>Lista de Reservas</a></li>
                     
                      <li ><a href="javascript:window.print()"><i class="fa fa-list icon" aria-hidden="true"></i>Imprimir</a></li>
                      <li ><a href="menu.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Volver</a></li>
                     
                       
                                    
                </ul>
               </nav>
            </div>

            <div class="container  col-md-9">
                <form id="form1" runat="server">





                     <div class="table-responsive" id="tabla0" runat="server">
                        
                           <table id="tabla" class="table table-striped"  style="background-color:white;">
                               <tr>
                                <th>Título</th>
                                <th>Director</th> 
                                <th>Publicado por</th>
                                 <th>Género</th>
                                <th>Estado</th>
                               
                               </tr>
                            <asp:Repeater ID="repeater" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                     <td><%# Container.DataItem("titulo")%></td>
                                    <td><%# Container.DataItem("director")%></td>
                                    <td><%# Container.DataItem("publicado")%></td>
                                    <td><%# Container.DataItem("genero")%></td>
                                    <td><%# Container.DataItem("estado") %></td>    
                                    </tr>
                                </ItemTemplate>
                                
     
                             </asp:Repeater>
                                 
                            </table>
                          
                    </div>    


                       <div class="table-responsive" id="tabla11" runat="server">
                          
                           <table id="tabla1" class="table table-striped"  style="background-color:white;">
                               <tr>
                                <th>Id_usuario</th>
                                <th>Nombrer</th> 
                                <th>Apellido</th>
                                 <th>DNI</th>
                                <th>Calle</th>
                               <th>Número</th>
                                   <th>Mail</th>
                                   <th>Localidad</th>
                               </tr>
                            <asp:Repeater ID="repeater1" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                     <td><%# Container.DataItem("id_usuario")%></td>
                                    <td><%# Container.DataItem("nombre")%></td>
                                    <td><%# Container.DataItem("apllido")%></td>
                                    <td><%# Container.DataItem("num_documento")%></td>
                                    <td><%# Container.DataItem("calle") %></td>
                                    <td><%# Container.DataItem("numero") %></td>
                                     <td><%# Container.DataItem("mail") %></td>
                                    <td><%# Container.DataItem("localidad") %></td>
                                   </tr>
                                </ItemTemplate>                                   
                             </asp:Repeater>
                                 
                            </table>
                          
                    </div>  


                      <div class="table-responsive" id="tabla22" runat="server">
                           <table id="tabla2" class="table table-striped"  style="background-color:white;">
                               <tr>
                                <th>Número de reserva</th>
                                <th>Item</th> 
                                <th>Usuario</th>
                                 <th>Fecha de reserva</th>
                        
                               
                               </tr>
                            <asp:Repeater ID="repeater2" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                     <td><%# Container.DataItem("id_reserva")%></td>
                                    <td><%# Container.DataItem("id_item")%></td>
                                    <td><%# Container.DataItem("nombre")%></td>
                                    <td><%# Container.DataItem("fecha")%></td>
                                       
                                    </tr>
                                </ItemTemplate>
                                
     
                             </asp:Repeater>
                                 
                            </table>
                          
                    </div>    



                     <div class="table-responsive" id="tabla33" runat="server">
                        
                           <table id="tabla3" class="table table-striped"  style="background-color:white;">
                               <tr>
                                <th>Número de catalogación</th>
                                <th>Título</th> 
                                <th>Autor</th>
                                 <th>Editor</th>
                                <th>Año</th>
                               <th>Descripción</th>
                                   <th>Estado</th>
                               </tr>
                            <asp:Repeater ID="repeater3" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                     <td><%# Container.DataItem("id_libro")%></td>
                                    <td><%# Container.DataItem("titulo")%></td>
                                    <td><%# Container.DataItem("autor")%></td>
                                    <td><%# Container.DataItem("editor")%></td>
                                    <td><%# Container.DataItem("anio") %></td>  
                                    <td><%# Container.DataItem("descripcion") %></td> 
                                        <td><%# Container.DataItem("estado") %></td> 
                                    </tr>
                                </ItemTemplate>
                                
     
                             </asp:Repeater>
                                 
                            </table>
                          
                    </div>    


                         <!-- Modal  -->
                     <div class="modal fade" id="baja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                  <h4>Elija la fecha que desea ver las reservas:</h4>
                               </div>
                                   
                              <div class="modal-body">
                             
                                <p>DESDE</p>
                                  <div class="input-group date" data-provide="datepicker">
                                        <input type="text" class="form-control" runat="server" id="desde"/>
                                        <div class="input-group-addon">
                                            <span class="glyphicon glyphicon-th"></span>
                                        </div>
                                     </div>
                                  
                                  <p>FORMATO DE FECHA: 2017-12-31</p>
                                <%-- <input style="display:contents;" type="text" class="modal-title" runat="server" id="text1"/>--%>
                                  <br />
                                   <br />
                                  <p>HASTA</p>
                                   <div class="input-group date" data-provide="datepicker">
                                        <input type="text" class="form-control" runat="server" id="hasta"/>
                                        <div class="input-group-addon">
                                            <span class="glyphicon glyphicon-th"></span>
                                        </div>
                                     </div>
                                  <p>FORMATO DE FECHA: 2017-12-31</p>

                              </div>
                              <div class="modal-footer">
                                <button type="button" id="fechas" runat="server" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                
                              </div>
                            
                          </div>
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