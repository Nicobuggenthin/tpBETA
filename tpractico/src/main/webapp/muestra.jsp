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
        <title>Muestra</title>
    </head>
    <body>

        <%
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = null;            
        String qProd ="select tb_prod.prod_nombre AS producto,"
                            + "       tb_suc.suc_nombre AS sucursal"
                            + "       FROM tb_prod_suc "
                            + "       JOIN tb_prod ON tb_prod_suc.id_tbprod=tb_prod.id_prod"
                            + "       JOIN tb_suc ON tb_prod_suc.id_tbsuc= tb_suc.id_suc"
                            + "       AND tb_suc.id_suc = ?";
        PreparedStatement consultaProd = null;
        
        try {
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
                /*prepara curso*/
                consultaProd = conexion.prepareStatement(qProd);
                consultaProd.setString(1, request.getParameter("id"));
                ResultSet listaProd = consultaProd.executeQuery();
                while (listaProd.next()){        
     %>   
     
                    <ul>
                    <li><%out.print(listaProd.getString("producto"));%></li>
                    </ul>
     
    <%
                    }
                   
                    
                    out.print("Cargado");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(consultaProd + "</br>");
                    //out.println(consultaRel + "</br>");
                  
                } finally {
                    try {

                        //consultaRel.close();
                        consultaProd.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
        
        
        
    </body>
</html>
