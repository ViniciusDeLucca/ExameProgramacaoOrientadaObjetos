<%-- 
    Document   : history
    Created on : 13 de dez. de 2021, 19:32:43
    Author     : vinic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%if(session.getAttribute("user.login") == null){%>
            <div style="color:red">É necessário identificar-se para visualizar a página.</div>
        <%}else{%>
        <h1>Histórico de cálculos</h1>
        <%}%>
    </body>
</html>
