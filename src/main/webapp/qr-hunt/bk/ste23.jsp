<%-- 
    Document   : ste23
    Created on : 23 Feb, 2019, 4:44:01 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel2");
    
    if(Puzzel2.equalsIgnoreCase("enthusia")){
        response.sendRedirect("Ag2aCQ3Qfp.html");
    }
    else{
        response.sendRedirect("8KNthDDhqV.jsp");
    }
%>