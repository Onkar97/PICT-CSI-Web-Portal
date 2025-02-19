<%@ page import="com.pictcsi.database.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: negativezero
  Date: 13/10/18
  Time: 3:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //language=MySQL
    String sql = "INSERT INTO COUNTER (visitor_count, date) VALUES (1, NOW()) ON DUPLICATE KEY UPDATE visitor_count = visitor_count + 1";
    try {
        DatabaseConnection.execute(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
%>