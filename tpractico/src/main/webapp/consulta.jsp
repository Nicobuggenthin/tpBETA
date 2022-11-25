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
        <title>JSP Page</title>
    </head>
    <body>
           <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qProd ="INSERT INTO tb_prod (prod_nombre, prod_descripcion, prod_costo) VALUES (?,?,?); "
                            + "SET @id_prod= LAST_INSERT_ID(); "
                            + "INSERT INTO tb_prod_suc (id_tbprod, id_tbsuc) VALUES (@id_prod,?)";
                //String qSet = "";
                //String qRel = "";
                PreparedStatement consultaProd = null;
                //PreparedStatement consultaRel = null;
                //PreparedStatement consultaSet = null;
                String vId = request.getParameter("id");
                String vDesc = request.getParameter("desc");
                String vProd = request.getParameter("producto");
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
                    /*prepara curso*/
                    consultaProd = conexion.prepareStatement(qProd);
                    consultaProd.setString(1, request.getParameter("producto"));
                    consultaProd.setString(2, request.getParameter("desc"));
                    consultaProd.setString(3, request.getParameter("id"));
                    /*preparar consulta set
                    consultaSet = conexion.prepareStatement(qSet);
                    /*pREPARA RELACION
                    consultaRel = conexion.prepareStatement(qRel);
                    consultaRel.setString(1, request.getParameter("id"));
*/
                    consultaProd.execute();
                    //consultaSet.excute();
                    //consultaRel.execute();
                    
                    out.print("cargado");
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
