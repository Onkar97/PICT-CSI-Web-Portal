<%-- 
    Document   : Puzzel8_1
    Created on : 23 Feb, 2019, 4:27:33 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel1 = request.getParameter("Puzzel8");
    
    if(Puzzel1!= null && Puzzel1.contains("87")){
        response.sendRedirect("gAb7qGubu7.html");
    }
    else{
        response.sendRedirect("1D6nXRyjNK.jsp");
    }
    
%>
