<%-- 
    Document   : Puzel5_8
    Created on : 23 Feb, 2019, 4:00:43 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel5");
    
    if(Puzzel2.equalsIgnoreCase("student")){
        response.sendRedirect("yBBdzqhfDw.html");
    }
    else{
        response.sendRedirect("ZDcEgeGEaN.jsp");
    }
%>