

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
            <h1>Eliminar Producto</h1>
            <p>Ingrese codigo del producto que quiere eliminar</p>

            <form method="post" action="elimina-opera.jsp">
                <input type="text" name="idprod">
                <input type="hidden" name="sucursal" value="<%out.print(request.getParameter("idsuc"));%>">
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="Principal.jsp">Regresar</a>
                
            </form>
        </div> 
    </body>
</html>
