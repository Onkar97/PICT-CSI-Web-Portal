<%-- 
    Document   : Pzel10
    Created on : 23 Feb, 2019, 4:38:33 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel2");
    
    if(Puzzel2.equalsIgnoreCase("triangle")){
        response.sendRedirect("yBBdzqhfDw.html");
    }
    else{
        response.sendRedirect("jZlB7p5hAN.jsp");
    }
%>