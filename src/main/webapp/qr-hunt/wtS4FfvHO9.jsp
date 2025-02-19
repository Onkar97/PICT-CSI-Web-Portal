<%-- 
    Document   : Puzzel1_5
    Created on : 23 Feb, 2019, 4:31:30 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("Puzzel9");
    
    if(Puzzel2.equalsIgnoreCase("grandmother")){
        response.sendRedirect("x6EL2HmSPC.html");
    }
    else{
        response.sendRedirect("ZFgiIrJ3K8.jsp");
    }
%>

