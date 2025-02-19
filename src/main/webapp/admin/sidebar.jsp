<%--
  Created by IntelliJ IDEA.
  User: negativezero
  Date: 12/10/18
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="advanced_report.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Advanced Reports</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="AddEvent.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>New Event</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="AddNews.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Add News</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#addAdminModal">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Add Admin</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="feedbacks.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Feedbacks</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/volunteer">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Volunteer Mode</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Goto Main Website</span>
        </a>
    </li>
</ul>


<jsp:include page="/admin/modals.jsp"/>

