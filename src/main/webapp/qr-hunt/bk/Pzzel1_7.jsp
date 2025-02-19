<%-- 
    Document   : Pzzel1_7
    Created on : 23 Feb, 2019, 4:10:32 AM
    Author     : Madhuri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel7_1 = request.getParameter("Puzzel7_1");
    String Puzzel7_2 = request.getParameter("Puzzel7_2");
    String Puzzel7_3 = request.getParameter("Puzzel7_3");
    
    if(Puzzel7_1.equalsIgnoreCase("dil dhadakne do") && Puzzel7_2.equalsIgnoreCase("dil chahta hai") && 
            Puzzel7_3.equalsIgnoreCase("student of the year")){
        response.sendRedirect("TiofqrdkOm.html");
    }
    else{
        response.sendRedirect("jwKnHbEMjA.jsp");
    }
%>