<%-- 
    Document   : excpro
    Created on : 5 de mar. de 2025, 14:33:54
    Author     : rafae
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão</title>
    </head>
    <body>
        <%
            //receber o código digitado no formulario
            int cod;
            cod=Integer.parseInt(request.getParameter("codigo"));
            try {
                //conectar ao banco de dados banco.jsp
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/bancojsp";
                String user="root";
                String pass="";
                conecta=DriverManager.getConnection(url, user, pass);

                String sql="DELETE FROM produtos WHERE codigo=?";
                st=conecta.prepareStatement(sql);
                st.setInt(1, cod);
                int resultado=st.executeUpdate(); //executa a exclusão
                if(resultado==0) {
                    out.print("Este produto não está cadastrado no banco");
                }else{
                    out.print("O produto de código = " + cod + ", foi excluido com sucesso");
                }
            }catch(Exception erro) {
                String mensagemErro=erro.getMessage();
                out.print("Entre em contato com o administrador e informe o erro");
            }
            %>
    </body>
</html>x
