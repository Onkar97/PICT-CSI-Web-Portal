<%@ page import="com.pictcsi.models.Event" %>
<!DOCTYPE html>
<html>
<%
    Boolean isEdit = (Boolean) request.getAttribute("is_edit");
    Event event = null;
    if(isEdit != null && isEdit){
        event = (Event) request.getAttribute("event");
    }

%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body{
            font-family: Arial, Helvetica, sans-serif;

        }
        /* Add padding to containers */
        .container {
            padding: 16px;
            background-color: black;
        }

        /* Full-width input fields */
        input[type=text], input[type=password],input[type=date],input[type=file] {
            width: 40%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Overwrite default styles of hr */

        /* Set a style for the submit button */
        .registerbtn {
            background-color: #3f586b;
            color: white;
            padding: 16px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 40%;
            opacity: 0.9;
        }

        .registerbtn:hover {
            opacity: 1;
        }

        /* Add a blue text color to links */
        a {
            color: dodgerblue;
        }

        .navbar {
            overflow: auto;
            background-color: #3f586b;
        }

        /* Style the navigation bar links */
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        /* Change color on hover */
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

    </style>
</head>
<body>
<div class="navbar">
    <a href="../index.jsp">Home</a>
    <a href="#">Events</a>
    <a href="#">About</a>
    <a href="../contact.html">Contact</a>
</div>

<div class="container">
    <%
        if(isEdit != null && isEdit && event != null){
    %>
    <form action="/admin/registerEventServlet" method="post" enctype="multipart/form-data">
        <h1 style="color:white">New Event</h1>
        <input type="hidden" name="is_edit" value="true">
        <input type="hidden" name="event_id" value="<%=event.getEvent_id()%>">
        <label for="name"><b></b></label>
        <input id="name" type="text" placeholder="Enter Event Name" name="name" required value="<%=event.getEvent_name()%>">
        <br>
        <label for="start_date"><b></b></label>
        <input id="start_date" type="date" placeholder="Enter Start Date" name="start_date" required value="<%=event.getStart_date()%>">
        <br>
        <label for="end_date"><b></b></label>
        <input id="end_date" type="date" placeholder="Enter End Date" name="end_date" required value="<%=event.getEnd_date()%>">
        <br>
        <label for="description"><b></b></label>
        <input id="description" type="text" placeholder="description" name="description" required value="<%=event.getDescription()%>">
        <br>
        <label for="max_seats"><b></b></label>
        <input id="max_seats" type="text" placeholder="Enter Maximum Count" name="max_seats" required value="<%=event.getMax_seats()%>">
        <br>
        <label for="event_fee"><b></b></label>
        <input id="event_fee" type="text" placeholder="Enter Fee for Event" name="event_fee" required value="<%=event.getEvent_fee()%>">
        <br>
        <label for="image"></label>
        <input id="image" type="file" placeholder="Attach Posters here" name="image" required >
        <br>
        <button type="submit" class="registerbtn">Create Event</button>

    </form>
    <%
        }else{
    %>
    <form action="/admin/registerEventServlet" method="post" enctype="multipart/form-data">
        <h1 style="color:white">Event</h1>

        <label for="name"><b></b></label>
        <input id="name" type="text" placeholder="Enter Event Name" name="name" required>
        <br>
        <label for="start_date"><b></b></label>
        <input id="start_date" type="date" placeholder="Enter Start Date" name="start_date" required>
        <br>
        <label for="end_date"><b></b></label>
        <input id="end_date" type="date" placeholder="Enter End Date" name="end_date" required>
        <br>
        <label for="description"><b></b></label>
        <input id="description" type="text" placeholder="description" name="description" required>
        <br>
        <label for="max_seats"><b></b></label>
        <input id="max_seats" type="text" placeholder="Enter Maximum Count" name="max_seats" required>
        <br>
        <label for="event_fee"><b></b></label>
        <input id="event_fee" type="text" placeholder="Enter Fee for Event" name="event_fee" required>
        <br>
        <label for="image"></label>
        <input id="image" type="file" placeholder="Attach Posters here" name="image" required>
        <br>
        <button type="submit" class="registerbtn">Create Event</button>

    </form>
    <%
        }
    %>
</div>
</body>
</html>

