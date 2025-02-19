<%-- 
    Document   : Puzzel1_1
    Created on : 23 Feb, 2019, 1:23:38 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel1 = request.getParameter("Puzzel1");
    
    if(Puzzel1!= null && Puzzel1.contains("6")){
        response.sendRedirect("Nn4gY3Gn1H.html");
    }
    else{
        response.sendRedirect("7sFnCxcbXr.jsp");
    }
    
%>

