<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="eliminarModificarLibro.aspx.vb" Inherits="laboratorio_3.eliminarModificarLibro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Modificar Catalogo</title>


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

            <h2 class="text-right titulo">Libros</h2>


            <div class="row">

            <div class="col-md-2">

              <nav >
                 <ul class="nav text-center">
             
                      <li ><a href="agregarLibro.aspx"><i class="fa fa-list icon" aria-hidden="true"></i>Volver</a></li>
                    
                </ul>
               </nav>
            </div>

            <div class="container  col-md-9">
                <form id="form1" runat="server">
          

                     <div class="table-responsive">
                           <table id="tabla" class="table table-striped" style="background-color:white;">
                               <tr>
                                <th>Título</th>
                                <th>Autor</th> 
                                <th>Editor</th>
                                 <th>Género</th>
                                <th>Estado</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                               </tr>
                            <asp:Repeater ID="repeater" runat="server" > 
                                <ItemTemplate>
                                    <tr>
                                     <td><%# Container.DataItem("titulo")%></td>
                                    <td><%# Container.DataItem("autor")%></td>
                                    <td><%# Container.DataItem("editor")%></td>
                                    <td><%# Container.DataItem("genero")%></td>
                                    <td><%#Container.DataItem("estado")%></td>
                                    <%--<td> <a href="agregarLibro.aspx?id_libro=<%# Container.DataItem("id_libro")%>">modificar</a></td>--%>
                                    
                                    <td><a href="javascript:$('#exampleModal').modal('show');$('#id_libro').val('<%# Container.DataItem("id_libro")%>');
                                        $('#titulo').val('<%# Container.DataItem("titulo")%>');
                                        $('#autor').val('<%# Container.DataItem("autor")%>');
                                        $('#genero').val('<%# Container.DataItem("id_genero")%>');
                                        $('#estado').val('<%# Container.DataItem("id_estado")%>');
                                        $('#editor').val('<%# Container.DataItem("editor")%>');
                                        $('#año').val('<%# Container.DataItem("anio")%>');
                                        $('#descripcion').val('<%# Container.DataItem("descripcion")%>');
                                        ">MODIFICAR</a></td>
                                   


                                     <td><a href="javascript:$('#baja').modal('show');$('#Text1').val('<%# Container.DataItem("id_libro")%>');
                                        $('#labe').html('Esta seguro que desea dar de baja el libro: <%# Container.DataItem("titulo")%> ??');
                                        ">ELIMINAR</a></td>
                                    </tr>
                                </ItemTemplate>
                                
     
                             </asp:Repeater>
                                 
                            </table>
                          
                    </div>    

                                        <!-- Modal 1 -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              <h4>Modificar</h4>
                            <input style="display:none" type="number" class="modal-title" runat="server" id="id_libro"/>
                          </div>
                          <div class="modal-body">
                            <div class="form-group">
                                <label style="color:inherit;">Título</label>
                                <input type="text" runat="server" id="titulo"/>           
                           </div>
                           <div class="form-group">
                               <label style="color:inherit;">Autor</label>
                               <input type="text" runat="server" id="autor"/>
                           </div>
                           <div class="form-group">
                                <label style="color:inherit;">Género</label>
                               <asp:DropDownList ID="genero" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                   <label style="color:inherit;">Editor</label>
                                   <input type="text" runat="server" id="editor"/>
                           </div>
                            <div class="form-group">
                                   <label style="color:inherit;">Año</label>
                                   <input type="text" runat="server" id="año"/>
                           </div>
                            <div class="form-group">
                                    <label style="color:inherit;">Descripción</label>
                                   <input type="text" runat="server" id="descripcion"/>
                            </div>
                             <div class="form-group">
                                    <label style="color:inherit;">Estado</label>
                                    <asp:DropDownList ID="estado" runat="server"></asp:DropDownList>
                            </div>



                              
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
                                  <h4>Eliminar libro del catálogo</h4>
                                <input style="display:none" type="text" class="modal-title" runat="server" id="Text1"/>
                              </div>
                              <div class="modal-body">
                               <label runat="server" id="labe" style="color:inherit;"></label>
               

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
