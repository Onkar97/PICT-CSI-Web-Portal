package com.pictcsi.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EventRegServlet")
public class EventRegServlet extends HttpServlet {

    protected static  int regnum =1000;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/");
        return;
    }

    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


//        String error = "";
        int userID= (int) request.getSession().getAttribute("user_id");


        try(Connection connection = DatabaseConnection.getConnection()) {
            WebUser user= WebUser.getUserById(userID);
//            String email = user.getEmail_id();

            if(user.getUser_type().equals(WebUser.USER_ADMIN) || user.getUser_type().equals(WebUser.USER_VOLUNTEER)){
                request.getSession().setAttribute("error", "Admin or volunteer Cannot register for event");
                response.sendRedirect("/admin/");
                return;
            }

//            String type="general";
//            String category="general";

//            String event_name=request.getParameter("event_name");
            String event_type=request.getParameter("event_type");
            String payment_status = "0";
//            String event2=event_name.replace("//s+/g","");
            String participant_name = request.getParameter("participant_name");

            int event_id= Integer.parseInt(request.getParameter("EventID"));

//            if(event_type.matches("Event")){
//                type=request.getParameter("group1");
//                category=request.getParameter("category");
//            }else if(event_type.matches("Workshop")){
//                category=request.getParameter("category");
//                //  category="general";
//            }else if(event_type.matches("Seminar")){
//
//                category=request.getParameter("category");
//                //  category="general";
//
//            }else if(event_type.matches("Other")){
//
//                // type="general";
//                //category="general";
//            }else {
//                //request.getSession().setAttribute("error","Set proper event type");
//                invalidLogin(request,response);
//            }


//            String type=request.getParameter("group1");
//            String category=request.getParameter("category");

            //language=MySQL
            String eventRegSQL = "INSERT INTO EVENT_REG (participant_name, college_name, group_t, category, event_id, user_id, has_paid, payment_details) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, eventRegSQL);


            String group_t = "";

            int num_year = Integer.parseInt(user.getYear_of_study());
            if(num_year == 1 || num_year == 2){
                group_t = "JUNIOR";
            }else{
                group_t = "SENIOR";

            }


            try {
                if(statement != null) {
                    //Check if user exists
                    Event myEvent;
                    //language=MySQL
                    String eventSql = "SELECT * FROM EVENT WHERE event_id = ?";
                    PreparedStatement eventStatement = DatabaseConnection.getPreparedStatement(connection, eventSql);
                    eventStatement.setInt(1, event_id);
                    ResultSet set = eventStatement.executeQuery();

                    if(set.next()) {

                        myEvent = Event.getFromSet(set);
                        statement.setInt(5, myEvent.getEvent_id());
                        statement.setString(1, user.getFirst_name() + " " + user.getLast_name());
                        statement.setString(2, user.getCollege_name());
                        statement.setString(3, "INDIVIDUAL");
                        statement.setString(4, group_t);
                        statement.setInt(6, user.getUser_id());
                        statement.setString(7, payment_status);
//                        statement.setInt(8, "");
                        statement.setString(8, "SELF REG");

                        statement.execute();

                        //language=MySQL
                        String getRegIdSql = "SELECT id from EVENT_REG where event_id = ? and user_id = ? ORDER BY id DESC LIMIT 1; ";

//                        regnum = myEvent.getAttendees();
                        PreparedStatement statement1 = DatabaseConnection.getPreparedStatement(connection, getRegIdSql);
                        statement1.setInt(1,myEvent.getEvent_id());
                        statement1.setInt(2, user.getUser_id());
                        ResultSet set1 = statement1.executeQuery();
                        if (set1.next()) {
                            regnum = set1.getInt("id");
                        }


//                    Misc.sendMailFromFile(user.getEmail_id(),request,"/templates/recipt_template.jsp",  "Welcome");

                        Document doc = Jsoup.connect(Misc.getBaseUrl(request) + "/templates/recipt_template.jsp").get();

                        doc.select("#receipt_id").html(String.valueOf(regnum));
                        doc.select("#participant_name").html(participant_name);
                        doc.select("#event_name").html(myEvent.getEvent_name());
                        doc.select("#fees").html(String.valueOf(myEvent.getEvent_fee()));
                        doc.select("#payment_done").html(payment_status.equals("1") ? "Yes": "No");
                        if(payment_status.equals("1")){
                            doc.select("#pay_here").html("Already Paid");
                        }else{
                            doc.select("#pay_here")
                                    //language=HTML
                                    .html("PayTM: 9923440183 <br>UPI ID: 9923440183@paytm <br>Send screenshot to <a href='mailto:csi.pict2018@gmail.com'>csi.pict2018@gmail.com</a> with registration ID.");
                        }
//                doc.select("#group_name").html("category");




                        // out.println("QUERY EXECUTED IN THE SERVLET 1");
                        request.getSession().setAttribute("error", "Thank You for Registering!");
                        response.sendRedirect("/index.jsp");
//                    sendMail(uname,request);
                    }else {
                        request.getSession().setAttribute("error", "Event not found!");
                        response.sendRedirect("/index.jsp");
                    }


                }else{
                    // out.println("QUERY NOT EXECUTED IN THE SERVLET 1");
                    invalidLogin(request,response);
                }
            }catch (SQLException e){
                //  out.println("CATCH IT");
                invalidLogin(request,response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
*/

    private void invalidLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        req.getSession().setAttribute("error","REGISTRATION INCOMPLETE!");
        int event_id= (int) req.getAttribute("EventID");
        resp.sendRedirect("single-listing.jsp?event_id="+event_id);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
