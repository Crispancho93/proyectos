<%-- 
    Document   : actualizarCliente
    Created on : 05-sep-2019, 11:06:45
    Author     : Crispancho
--%>

<%@page import="model.PersonaDAO"%>
<%@page import="entity.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>

<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR CLIENTE</h4>

    <form action="ActualizarCliente" method="post">

        <%   // valido el envio del id, desde buscarCliente.jsp 
            // para poder listarlo
            if (request.getParameter("btnBuscarPersona") != null) {

                // copio array list que me llega del controller
                //ArrayList<Persona> listaEmpleado = (ArrayList<Persona>) request.getAttribute("unaPersona"); NO USO
                PersonaDAO miclienteDao = new PersonaDAO();
                for (Persona cliente : miclienteDao.buscarUnaPersona(request.getParameter("btnBuscarPersona").toString())) {

        %>

        <div class="form-row">

            <!--tipo de persona-->
            <input type="hidden" name="tipoPersona" value="<%out.println(cliente.getTipoPersona());%>">

            <!--cliente no requiere tipo documento-->
            <input type="hidden" class="form-control" id="tipoDocumento" name="tipoDocumento" value="">

            <!--cliente no requiere numero de documento-->
            <input type="hidden" class="form-control" id="numeroDocumento" name="numeroDocumento" value="">

            <!--cliente no requiere dirección-->
            <input type="hidden" class="form-control" id="direccion" name="direccion" value="">

            <!--id-->
            <div class="form-group col-md-4">
                <label for="idPersona">* ID</label>
                <input type="text" class="form-control" id="idPersona" name="idPersona" readonly="readonly" value="<%out.println(cliente.getIdPersona());%>" required>
            </div> 
            
            <!--nombre-->
            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%out.println(cliente.getNombre());%>" required>
            </div>
            
            <!--telefono-->
            <div class="form-group col-md-4">
                <label for="telefono">TELÉFONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%out.println(cliente.getTelefono());%>">
            </div>
            
            <!--coreo-->
            <div class="form-group col-md-4">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo" value="<%out.println(cliente.getCorreo());%>">
            </div>    
            
            <!--nombre de un contacto-->
            <div class="form-group col-md-4">
                <label for="nombreContacto">NOMBRE CONTACTO</label>
                <input type="text" class="form-control" id="nombreContacto" name="nombreContacto" value="<%out.println(cliente.getNombreContacto());%>">
            </div>

            <!--número de un contacto-->
            <div class="form-group col-md-4">
                <label for="numeroContacto">NÚMERO CONTACTO</label>
                <input type="text" class="form-control" id="numeroContacto" name="numeroContacto" value="<%out.println(cliente.getNumeroContacto());%>">
            </div>

           

            <!--actualizar-->
            <button type="submit" class="btn btn-primary col-md-2" id="btnActualizarPersona" name="btnActualizarPersona" value="btnActualizarPersona">EDITAR <i class="fas fa-user-edit"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarCliente.jsp" class="btn btn-dark col-md-2 ">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--boton oculto-->
            <button type="submit" id="btnEliminarPersona" name="btnEliminarPersona"></button>
            <!--eliminar-->
            <a class="btn btn-danger text-white col-md-2" id="linkEliminarPersona">BORRAR <i class="fas fa-trash-alt"></i></a>

            <!--ocultamos el btnEliminarPersona y confirmamos la eliminación -->
            <script type="text/javascript">
                document.getElementById('btnEliminarPersona').style.display = 'none';
                $('#linkEliminarPersona').on('click', function () {
                    if (confirm("Seguro de desea eliminar")) {
                        document.getElementById('btnEliminarPersona').click();
                    }
                });
            </script>
        </div>
    </form>
</div>
<%
        }
    }

%>    


<%@include file="footer.jsp" %>