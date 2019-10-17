<%-- 
    Document   : actualizarEmpleado
    Created on : 02-sep-2019, 18:25:33
    Author     : Crispancho
--%>
<%@page import="java.util.ArrayList"%>
<%@include file="head.jsp" %>
<%@page import="entity.Persona"%>
<%@page import="model.PersonaDAO"%>


<div class="container mt-5 mb-5">
    <h4 class="row justify-content-center align-items-center mb-5 text-dark">ACTUALIZAR EMPLEADO</h4>

    <form action="ActualizarEmpleado" method="post">

        <%   // valido el envio de buscarempleado
            // para poder listarlo
            if (request.getParameter("btnBuscarPersona") != null) {

                // copio array list que me llega del controller
                //ArrayList<Persona> listaEmpleado = (ArrayList<Persona>) request.getAttribute("unaPersona"); NO USO
                PersonaDAO miPersonaDao = new PersonaDAO();
                for (Persona empleado : miPersonaDao.buscarUnaPersona(request.getParameter("btnBuscarPersona").toString())) {

        %>

        <div class="form-row">
            
            <!--id de persona-->
            <div class="form-group col-md-4">
                <label for="idPersona">* ID</label>
                <input type="text" class="form-control" id="idPersona" name="idPersona" readonly="readonly" value="<%out.println(empleado.getIdPersona());%>" required>
            </div> 
            <div class="form-group col-md-4">
                <label for="nombre">* NOMBRE</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%out.println(empleado.getNombre());%>" required>
            </div>

            <!--tipo de persona-->
            <input id="tipoPersona" type="hidden" name="tipoPersona" value="<%out.println(empleado.getTipoPersona());%>">
            
            <!--tipo de documento-->
            <div class="form-group col-md-4">
                <label for="tipoDocumento">* TIPO DOCUMENTO</label>
                <select id="tipoDocumento" class="form-control" name="tipoDocumento">
                    <option selected><%out.println(empleado.getTipoDocumento());%></option>
                    <option>CC</option>
                    <option>NA</option>
                </select>
            </div>
                    
            <!--número documento-->        
            <div class="form-group col-md-4">
                <label for="numeroDocumento">* NÚMERO DOCUMENTO</label>
                <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" value="<%out.println(empleado.getNumeroDocumento());%>" required>
            </div>
            
            <!--dirección-->
            <div class="form-group col-md-4">
                <label for="direccion">DIRECCIÓN</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%out.println(empleado.getDireccion());%>">
            </div>
            
            <!--teléfono-->
            <div class="form-group col-md-4">
                <label for="telefono">TELÉFONO</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%out.println(empleado.getTelefono());%>">
            </div>
            
            <!--correo-->
            <div class="form-group col-md-4">
                <label for="correo">CORREO</label>
                <input type="text" class="form-control" id="correo" name="correo" value="<%out.println(empleado.getCorreo());%>">
            </div>    
            
             <!--nombre de un contacto-->
            <div class="form-group col-md-4">
                <label for="nombreContacto">NOMBRE CONTACTO</label>
                <input type="text" class="form-control" id="nombreContacto" name="nombreContacto" value="<%out.println(empleado.getNombreContacto());%>">
            </div>
            
            <!--numero de un contacto-->
            <div class="form-group col-md-4">
                <label for="numeroContacto">NÚMERO CONTACTO</label>
                <input type="text" class="form-control" id="numeroContacto" name="numeroContacto" value="<%out.println(empleado.getNumeroContacto());%>">
            </div>

            <!--actualizar empleado-->
            <button type="submit" class="btn btn-primary col-md-2 " id="btnActualizarPersona" name="btnActualizarPersona" value="btnActualizarPersona">EDITAR <i class="fas fa-user-edit"></i></button>
            <div class="col-md-3"></div>
            <!--volver-->
            <a href="buscarEmpleado.jsp" class="btn btn-dark col-md-2 ">VOLVER <i class="far fa-hand-point-left"></i></a>
            <div class="col-md-3"></div>
            <!--boton oculto-->
            <button type="submit" id="btnEliminarPersona" name="btnEliminarPersona"></button>
            <!--eliminar-->
            <a id="linkEliminarPersona" class="btn btn-danger text-white col-md-2">BORRAR <i class="fas fa-trash-alt"></i></a>

            <!--confirmar si desea eliminar empleado-->
            <script type="text/javascript">
                document.getElementById("btnEliminarPersona").style.display = 'none';
                $('#linkEliminarPersona').on('click', function () {
                    if (confirm("Seguro que desea eliminar")) {
                        document.getElementById("btnEliminarPersona").click();
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


<%@ include file="footer.jsp" %>