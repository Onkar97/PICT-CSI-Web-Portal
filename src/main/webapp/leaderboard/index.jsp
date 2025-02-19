<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!Doctype html>
<html>
<head>
    <%

        String event_id = request.getParameter("event_id");


        if (event_id == null || event_id.trim().isEmpty())
            event_id = "0";


        //language=MySQL
        String first3Query = "SELECT * FROM EVENT_RESULTS where event_id = ? order by points desc limit 3";
        //language=MySQL
        String rankQuery = "SELECT * FROM EVENT_RESULTS where event_id = ? order by points desc";

        try (Connection connection = DatabaseConnection.getConnection()) {

            Event e = Event.getById(Integer.parseInt(event_id));





            PreparedStatement preparedStatement = connection.prepareStatement(first3Query);
            preparedStatement.setString(1, event_id);

            ResultSet resultSet = preparedStatement.executeQuery();


    %>

    <link href="gapist.css" rel='stylesheet' type='text/css'>
    <link href="bootstrap.min.css" rel="stylesheet"/>
    <link href="leader.css" rel="stylesheet"/>


    <%--<script type="text/javascript">--%>
    <%--function show(shown, hide1, hide2, hide3, hide4, hide5, hide6, hide7, hide8) {--%>

    <%--document.getElementById(shown).style.display = 'block';--%>
    <%--document.getElementById(hide1).style.display = 'none';--%>
    <%--document.getElementById(hide2).style.display = 'none';--%>
    <%--document.getElementById(hide3).style.display = 'none';--%>
    <%--document.getElementById(hide4).style.display = 'none';--%>
    <%--document.getElementById(hide5).style.display = 'none';--%>
    <%--document.getElementById(hide6).style.display = 'none';--%>
    <%--document.getElementById(hide7).style.display = 'none';--%>
    <%--document.getElementById(hide8).style.display = 'none';--%>

    <%--return false;--%>
    <%--}--%>
    <%--</script>--%>
    <script type="text/javascript">
        function reloadPage() {
            location.reload(true);
        }

        var x = setInterval(reloadPage, 5000);
    </script>
</head>
<body>

<div class="row" style="justify-content: center;padding: 40px">
    <div class="btn-group">
        <a href="index.jsp?event_id=1056">
            <button
                    style=" border-radius: 10px 0 0 10px;">
                Competitive Coding
            </button>
        </a>

        <a href="index.jsp?event_id=1060">
            <button>Ninja Coding</button>
        </a>
        <a href="index.jsp?event_id=1059">
            <button>QR Hunt</button>
        </a>
        <a href="index.jsp?event_id=1065">
            <button>Game - Pubg</button>
        </a>
        <a href="index.jsp?event_id=1065">
            <button>Mario/ Subway Surfers</button>
        </a>
        <a href="index.jsp?event_id=1062">
            <button> Googler</button>
        </a>
        <a href="index.jsp?event_id=1057">
            <button>Lets Debug</button>
        </a>
        <a href="index.jsp?event_id=1064">
            <button>Reverse Coding</button>
        </a>

    </div>
</div>


<div id="Page1" style="display: block; ">
    <div class="row" style="justify-content: center">
        <div>
            <h1 style="font-size: 3vw"><b><%=e != null ? e.getEvent_name() +" Leaderboard" : "Select an event"%> </b></h1>
            <br>
        </div>
    </div>

    <%
        if (resultSet.next()) {
    %>

    <div class="row" style="justify-content: center;padding: 30px;">
        <div class="a">
            <img src="img/gold-medal.png" style="height: 50px;float: left;">
            <h3><%=resultSet.getString("team_name")%>
            </h3>
        </div>
    </div>

    <%
    } else {
    %>
    <div class="row" style="justify-content: center;padding: 30px;">
        <div class="a">
            <img src="img/gold-medal.png" style="height: 50px;float: left;">
            <h3>First</h3>
        </div>
    </div>
    <%
        }
    %>


    <div class="row" style="justify-content: center;">
        <%
            if (resultSet.next()) {
        %>
        <div class="a" style="margin-right: 65px">
            <img src="img/silver-medal.png" style="height: 50px;float: left;">
            <h3><%=resultSet.getString("team_name")%>
            </h3>
        </div>
        <%
        } else {
        %>
        <div class="row" style="justify-content: center;padding: 30px;">
            <div class="a">
                <img src="img/silver-medal.png" style="height: 50px;float: left;">
                <h3>Second</h3>
            </div>
        </div>
        <%
            }

            if (resultSet.next()) {
        %>
        <div class="a" style="margin-left: 65px">
            <img src="img/bronze-medal.png" style="height: 50px;float: left;">
            <h3><%=resultSet.getString("team_name")%>
            </h3>
        </div>
        <%
        } else {
        %>
        <div class="row" style="justify-content: center;padding: 30px;">
            <div class="a">
                <img src="img/bronze-medal.png" style="height: 50px;float: left;">
                <h3>Third</h3>
            </div>
        </div>
        <%
            }
        %>

    </div>


    <br><br>

    <%
        preparedStatement = connection.prepareStatement(rankQuery);
        preparedStatement.setString(1, event_id);

        resultSet = preparedStatement.executeQuery();
        int i = 1;
    %>
    <div class="container" style="justify-content: center">

        <table style="border-radius: 15px">
            <tr>
                <th style="border-radius: 15px 0 0 0">Rank</th>
                <th>Team name</th>
                <th style="border-radius: 0 15px 0 0">Points</th>
            </tr>
            <%
                while (resultSet.next()) {
            %>
            <tr>
                <td><%=i++%>
                </td>
                <td><%=resultSet.getString("team_name")%>
                </td>
                <td><%=resultSet.getString("points")%>
                </td>
            </tr>
            <%
                }
            %>

        </table>

    </div>

</div>


<br><br><br><br>

<%
} catch (SQLException e) {
    e.printStackTrace();%>
Unknown SQL Error!
<%
} catch (Exception e) {
    e.printStackTrace();
%>
Unknown error occoured!
<%

    }
%>
</body>
</html>