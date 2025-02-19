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
        response.sendRedirect("l9W2vdQghUpag1.html");
    }
    else{
        response.sendRedirect("jZlB7p5hANp1.jsp");
    }
    
%>

