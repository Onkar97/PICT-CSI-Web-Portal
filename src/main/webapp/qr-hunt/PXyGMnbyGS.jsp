<%-- 
    Document   : Puzzl14_3
    Created on : 23 Feb, 2019, 2:39:05 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel4");
    
    if(Puzzel2.equalsIgnoreCase("E")){
        response.sendRedirect("QdtsKT0KZ5.html");
    }
    else{
        response.sendRedirect("HSSzTQHDAk.jsp");
    }
%>
