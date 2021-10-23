<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de editoriales</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>Lista de editoriales</h3>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <a class="btn btn-primary btn-md" href="<s:url value="/editoriales/create"/>"> Nuevo editorial</a>
                    <br><br>
                    <table class="table table-striped table-bordered table-hover"
                           id="tabla">
                        <thead>
                            <tr>
                                <th>Codigo del editorial</th>
                                <th>Nombre del editorial</th>
                                <th>Contacto</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th>Pais</th>
                                <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${listaEditoriales}" var="editorial">
                                <tr>
                                    <td>${editorial.codigoEditorial}</td>
                                    <td>${editorial.nombreEditorial}</td>
                                    <td>${editorial.contacto}</td>
                                    <td>${editorial.telefono}</td>
                                    <td>${editorial.correo}</td>
                                    <td>${editorial.pais}</td>
                                    <td>
                                        <a clas="btn btn-primary" href="<s:url value="edit/${editorial.codigoEditorial}"/>">
                                            <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                            <a class="btn btn-danger" href="javascript:eliminar('${editorial.codigoEditorial}')">
                                                <span class='glyphicon glyphicon-trash'></span>Eliminar</a>                                           
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/pie.jsp"/>
        <script>
            function eliminar(id){
                alertify.confirm("¿Realmente desea eliminar este editorial", function(e){
                    if(e){
                        location.href="delete/"+id;
                    }
                })
            }
            
            $(document).ready(function () {
                $('#tabla').dataTable({
                    "language": {
                        "url": "cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                    }
                });

            });
        </script>
    </body>
</html>
