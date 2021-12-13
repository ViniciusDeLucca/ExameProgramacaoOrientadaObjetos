<%-- 
    Document   : juros
    Created on : 13 de dez. de 2021, 19:32:29
    Author     : vinic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    double valor=0, porcentagem=0, porcentagemcalculada=0, meses=0, result= 0;
    String error = null;
    if(request.getParameter("valor") == null || request.getParameter("porcentagem") == null || request.getParameter("meses") == null){
        error = "Não foram informados valores válidos para os parâmetros solicitados.";
    }else{
        try{
        valor = Double.parseDouble(request.getParameter("valor"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Valor ('"+ request.getParameter("valor")+"') não é um valor válido";
        }
        try{
            porcentagem = Double.parseDouble(request.getParameter("porcentagem"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Porcentagem ('"+ request.getParameter("porcentagem")+"') não é um valor válido";
        }
        try{
            meses = Double.parseDouble(request.getParameter("meses"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Meses ('"+ request.getParameter("meses")+"') não é um valor válido";
        }
    try{
        porcentagemcalculada = (porcentagem/100);
        result = (valor*porcentagemcalculada*meses);
    }catch(Exception e){
        error = "Erro de cálculo "+ e.getMessage();
    }
    }
    
    double valorC=0, porcentagemC=0, porcentagemcalculadaC=0, mesesC=0, resultC= 0;
    String errorC = null;
    if(request.getParameter("valorC") == null || request.getParameter("porcentagemC") == null || request.getParameter("mesesC") == null){
        errorC = "Não foram informados valores válidos para os parâmetros solicitados.";
    }else{
        try{
        valor = Double.parseDouble(request.getParameter("valorC"));
        }catch(Exception e){
            errorC = "O valor informado como parâmetro Valor ('"+ request.getParameter("valorC")+"') não é um valor válido";
        }
        try{
            porcentagem = Double.parseDouble(request.getParameter("porcentagemC"));
        }catch(Exception e){
            errorC = "O valor informado como parâmetro Porcentagem ('"+ request.getParameter("porcentagemC")+"') não é um valor válido";
        }
        try{
            meses = Double.parseDouble(request.getParameter("mesesC"));
        }catch(Exception e){
            errorC = "O valor informado como parâmetro Meses ('"+ request.getParameter("mesesC")+"') não é um valor válido";
        }
    try{
        porcentagemcalculadaC = (porcentagemC/100);
        resultC = (valorC*(1+porcentagemcalculadaC)*mesesC);
    }catch(Exception e){
        errorC = "Erro de cálculo "+ e.getMessage();
    }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calcule Juros</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%if(session.getAttribute("user.login") == null){%>
            <div style="color:red">É necessário identificar-se para visualizar a página.</div>
        <%}else{%>
            <h1>Calcule seu juros simples!</h1>
            <%if(error != null){%>
            <div style="color: red"><%= error %></div> 
            <%}else{%>
            <div>Juros: <%= valor %> * <%= porcentagemcalculada %> * <%= meses %> = <%= result %></div> 
            <%}%>
            <br>
            <form>
                Valor Monetário: <input type="number" step="0.01" name="valor" value="<%= valor %>"> <br>
                Porcentagem: <input type="number" step="0.01" name="porcentagem" value="<%= porcentagem %>"/> <br>
                Meses: <input type="number" step="1" name="meses" value="1"/> <br>
                <input type="submit" value="Calcular"/>
            </form>
                <hr>
            <h1>Calcule seu juros compostos!</h1>
            <%if(errorC != null){%>
            <div style="color: red"><%= errorC %></div> 
            <%}else{%>
            <div>Montante calculada: <%= valorC %> * (1+<%= porcentagemcalculadaC %>) * <%= mesesC %> = <%= resultC %></div> 
            <%}%>
            <br>
            <form>
                Valor Monetário do Juros Composto: <input type="number" step="0.01" name="valorC" value="<%= valorC %>"> <br>
                Porcentagem do Juros Composto: <input type="number" step="0.01" name="porcentagemC" value="<%= porcentagemC %>"/> <br>
                Meses do Juros Composto: <input type="number" step="1" name="mesesC" value="1"/> <br>
                <input type="submit" value="Calcular"/>
            </form>
            
        <%}%>
    </body>
</html>
