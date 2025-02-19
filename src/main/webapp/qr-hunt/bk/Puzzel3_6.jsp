<%-- 
    Document   : Puzzel3_6
    Created on : 23 Feb, 2019, 2:27:36 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel3");
    
    if(Puzzel2.equalsIgnoreCase("Carrot")){
        response.sendRedirect("4Ad9XShrfL.html");
    }
    else{
        response.sendRedirect("VjCYntjmw2.jsp");
    }
%>