<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String Puzzel2 = request.getParameter("final");

    if(Puzzel2.equalsIgnoreCase("IJLH")){
        response.sendRedirect("MHt900bJSG.html");
    }
    else{
        response.sendRedirect("QMRJz5cwQH.jsp");
    }
%>