<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
        
    </head>
    <body>
            <%

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = null;            
            String qProd ="DELETE FROM tb_prod_suc WHERE id_tbprod=? AND id_tbsuc=?";
            PreparedStatement eliminaProd = null;
            
            try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
                    /*prepara producto*/
                    eliminaProd = conexion.prepareStatement(qProd);
                    eliminaProd.setString(1, request.getParameter("idprod"));
                    eliminaProd.setString(2, request.getParameter("sucursal"));
                    eliminaProd.execute();                
                    out.print("ELIMINADO");
                } catch (Exception e) {
                    e.printStackTrace();

                  
                } finally {
                    try {

                        eliminaProd.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>
