s<%@ page import="com.pictcsi.models.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Event Registration</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/bootswatch.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300" type="text/css"/>
    <style>
        .back {
            margin-top: 1%;
            height: 90%;
            width: 60%;
            background: rgba(212, 235, 246, 0.9);
            border-radius: 50px;
            border-color: #002E66;
        }

        .textbox2 {
            height: 80%;
            width: 50%;
            text-align: center;
            font-size: 17px;
            font-weight: 500;
        }

        .navbar {
            margin-bottom: 0;
            background: linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
            z-index: 9999;
            border: 0;

            font-size: 12px !important;
            line-height: 1.42857143 !important;
            letter-spacing: 4px;
            border-radius: 0;
            font-family: Montserrat, sans-serif;
        }


    </style>
</head>
<body>
<center>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>

        </div>
    </nav>
    <div class="back">
        <div class="textbox2">
            <%
                String error = (String) request.getSession().getAttribute("error");

                if (error != null) {
            %>

            <div class="error">
                <h3 style="color: #fff">
                    <%=error%>
                </h3>
            </div>
            <%
                    request.getSession().setAttribute("error", null);
                }
                Boolean isEdit = (Boolean) request.getAttribute("is_edit");
                Event event = null;
                if (isEdit != null && isEdit) {
                    event = (Event) request.getAttribute("event");
                }

                if (isEdit != null && isEdit && event != null) {
            %>

            <form action="/admin/registerEventServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="is_edit" value="true">
                <input type="hidden" name="event_id" value="<%=event.getEvent_id()%>">
                <fieldset>
                    <legend>Event Registration</legend>
                    <div class="form-group">
                        <label class="col-form-label" for="e_name">ADD EVENT NAME</label>
                        <input class="form-control" placeholder="Enter Event Name" id="e_name" name="name" type="text"
                               value="<%=event.getEvent_name()%>">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="start_date">ADD STARTING DATE</label>
                        <input class="form-control" placeholder="DD/MM/YYYY" id="start_date" name="start_date"
                               type="date" value="<%=event.getStart_date()%>">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="end_date">ADD END DATE</label>
                        <input class="form-control" placeholder="DD/MM/YYYY" id="end_date" name="end_date" type="date"
                               value="<%=event.getEnd_date()%>">
                    </div>
                    <div class="form-group">
                        <label for="description">DESCRIPTION</label>
                        <textarea class="form-control" name="description" id="description"
                                  rows="3"><%=event.getDescription()%></textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="max_seat">MAX NUMBER OF SEAT</label>
                        <input class="form-control" placeholder="Seat Number" id="max_seat" name="max_seats"
                               type="number" value="<%=event.getMax_seats()%>">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="fees">EVENT FEES</label>
                        <input class="form-control" placeholder="Fees for event" id="fees" name="event_fee"
                               type="number" value="<%=event.getEvent_fee()%>">
                    </div>

                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="custom-file">
                                <input class="custom-file-input" id="inputGroupFile021" type="file" name="image">
                                <label class="custom-file-label" for="inputGroupFile021">Choose Poster for Event</label>
                            </div>

                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">Submit</button>
                </fieldset>
            </form>


            <%
            } else {
            %>
            <form action="/admin/registerEventServlet" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend>Event Registration</legend>
                    <div class="form-group">
                        <label class="col-form-label" for="e_name">ADD EVENT NAME</label>
                        <input class="form-control" placeholder="Enter Event Name" id="e_name" name="name" type="text">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="start_date">ADD STARTING DATE</label>
                        <input class="form-control" placeholder="DD/MM/YYYY" id="start_date" name="start_date"
                               type="date">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="end_date">ADD END DATE</label>
                        <input class="form-control" placeholder="DD/MM/YYYY" id="end_date" name="end_date" type="date">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="event_type">SELECT EVENT TYPE</label>
                        <%--<input class="form-control" placeholder="Enter Event Name" id="e_type" name="e_type" type="">--%>
                        <select class="form-control" name="event_type" id="event_type">
                            <option>Event</option>
                            <option>Workshop</option>
                            <option>Seminar</option>
                            <option>SIG</option>
                            <option>Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description">DESCRIPTION</label>
                        <textarea class="form-control" name="description" id="description" rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="max_seat">MAX NUMBER OF SEAT</label>
                        <input class="form-control" placeholder="Seat Number" id="max_seat" name="max_seats"
                               type="number">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="fees">EVENT FEES</label>
                        <input class="form-control" placeholder="Fees for event" id="fees" name="event_fee"
                               type="number">
                    </div>

                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="custom-file">
                                <input class="custom-file-input" id="inputGroupFile02" type="file" name="image">
                                <label class="custom-file-label" for="inputGroupFile02">Choose Poster for Event</label>
                            </div>

                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">Submit</button>
                </fieldset>
            </form>

            <%
                }
            %>
        </div>
    </div>
</center>
</body>
</html>

