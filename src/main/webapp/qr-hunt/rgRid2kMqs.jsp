<%-- 
    Document   : Puzzel2_1
    Created on : 23 Feb, 2019, 2:05:21 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel2");
    
    if(Puzzel2.equalsIgnoreCase("speaker")){
        response.sendRedirect("pme2q1f6LB.html");
    }
    else{
        response.sendRedirect("Xc0zvnd96I.jsp");
    }
%>

