<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.DriverManager" %> 
<%@page import= "java.sql.*" %>

<%@page import= "java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
    </head>
    <body>
        <% try{
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bancojsp";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);
            
            String sql = ("SELECT * FROM produtos");
            st = conecta.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            %>
            <table>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Marca</th>
                    <th>Preço</th>
                    
                </tr>
                <% 
                    while (rs.next()){
                    %>
                    <!-- corpo da tabela html mostrando os dados trazidos do Banco de Dados -->
            <tr>
                <td>
                    <%=rs.getString("codigo")%>
                </td>
                <td>
                    <%=rs.getString("nome")%>
                </td>
                <td>
                    <%=rs.getString("marca")%>
                </td>
                <td>
                    <%=rs.getString("preco")%>
                </td>
                
            </tr> 
            <%
                }
            %>
            </table>
            <%
                } catch (Exception x){
                out.print ("Mensagem de erro: " + x.getMessage());
                }
            %>
    </body>
</html>
