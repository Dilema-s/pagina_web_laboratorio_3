<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="genero.aspx.vb" Inherits="laboratorio_3.genero" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Alta Género</title>


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

            <h2 class="text-right titulo">Géneros</h2>


            <div class="row">

            <div class="col-md-2">

              <nav >
                 <ul class="nav text-center">
             
                      <li ><a href="menu.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Volver</a></li>
                    
                </ul>
               </nav>
            </div>

            <div class="container col-md-offset-1 col-md-8">
                <form id="form1" runat="server">
          

                     <div class="table-responsive">
                           <table id="tabla" class="table table-striped" style="background-color:white;">
                               <tr>
                                <th>Género</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                               </tr>
                            <asp:Repeater ID="repeater" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                    <td><%# Container.DataItem("genero")%></td>
                                    <td> <a href="javascript:$('#exampleModal').modal('show');$('#id_gener').val('<%# Container.DataItem("id_genero")%>');$('#gen').val('<%# Container.DataItem("genero")%>')">Modificar</a></td>
                                    <td> <a  href="javascript:$('#baja').modal('show');$('#Text1').val('<%# Container.DataItem("id_genero")%>');$('#labe').html('Esta seguro que desea eliminar el genero <%# Container.DataItem("genero")%> ??')">Eliminar</a></td>
                                    
                                   
                                    </tr>
                                </ItemTemplate>
                                
      
                             </asp:Repeater>
                                 
                            </table>
                          
                    </div>
                   
               <label id="prueba"></label>


                  <div class="form-group">
                    <label for="inputGenero" class="col-sm-2" >Agregar nuevo género</label>
                    <div class="col-sm-10">
                     <input id="genero" class="form-control" runat="server" placeholder="Nuevo Género" type="text"/>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" controltovalidate="genero" runat="server" 
                        ErrorMessage="Campo vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>    
                    </div>
                  </div>


                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                       <asp:Button ID="boton" cssclass="btn btn-success btn-lg" runat="server" Text="Agregar" ValidationGroup="grupo1" />
                    </div>
                  </div>
        
    
                    

                                        <!-- Modal 1 -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              <h4>Modificar</h4>
                            <input style="display:none" type="text" class="modal-title" runat="server" id="id_gener"/>
                          </div>
                          <div class="modal-body">
                           <label style="color:inherit;">Modifique el género</label>
                           <input type="text" runat="server" id="gen"/>

                          </div>
                          <div class="modal-footer">
                            <button type="button" id="aceptar" runat="server" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                
                          </div>
                        </div>
                      </div>
                    </div>

                         <!-- Modal 2 -->
                     <div class="modal fade" id="baja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                  <h4>Eliminar género</h4>
                                <input style="display:none" type="text" class="modal-title" runat="server" id="Text1"/>
                              </div>
                              <div class="modal-body">
                               <label id="labe" style="color:inherit;"></label>
               

                              </div>
                              <div class="modal-footer">
                                <button type="button" id="eliminar" runat="server" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                
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
