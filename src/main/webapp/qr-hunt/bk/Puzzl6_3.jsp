<%-- 
    Document   : Puzzl6_3
    Created on : 23 Feb, 2019, 4:04:30 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel1 = request.getParameter("Puzzel6");
    
    if(Puzzel1.contains("1143")){
        response.sendRedirect("Qlhr4jth9g.html");
    }
    else{
        response.sendRedirect("Awh7nHKBQ3.jsp");
    }
%>