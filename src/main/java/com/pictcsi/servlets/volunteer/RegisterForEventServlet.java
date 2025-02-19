package com.pictcsi.servlets.volunteer;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/volunteer/registerForEvent")
public class RegisterForEventServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("Error", "Cannot register! The registrations have closed!");
        resp.sendRedirect("done.jsp");


    }

    //    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        String emailRegex = "(.*@.*\\..*)|(.*@\\..*\\..*)";
//        String phoneRegex = "([1-9][0-9]{9})|(0[1-9][0-9]{9})";
//
//        Pattern emailPattern = Pattern.compile(emailRegex);
//
//        Pattern mobilePattern = Pattern.compile(phoneRegex);
//        String event_id = req.getParameter("event_id");
//        int num_event_id = 0;
//        String first_name = req.getParameter("f_name");
//        String last_name = req.getParameter("l_name");
//        String email_id = req.getParameter("email_id");
//        String phone_no = req.getParameter("ph_no");
//        String branch = req.getParameter("branch");
//        String year = req.getParameter("year");
//
//        String name_2 = req.getParameter("name2");
//        String phone_2 = req.getParameter("phone2");
//
//        String name_3 = req.getParameter("name3");
//        String name_4 = req.getParameter("name4");
//
//        String college_name = req.getParameter("college_name");
//        String payment_status = req.getParameter("payment_status");
//        String no_of_participants = req.getParameter("no_of_participants");
//        String payment_details = req.getParameter("payment_details");
//
//        int volunteer_id = (int) req.getSession().getAttribute("user_id");
//
//        int num_participants = 1;
//
//        String participant_name = first_name + " " + last_name;
//
//        String error = "";
//
//        boolean flag = true;
//
//        if (event_id == null || event_id.trim().isEmpty()) {
//
//            flag = false;
//            error = "Invalid Event";
//
//        }
//
//        else if (first_name == null || first_name.trim().isEmpty()) {
//            flag = false;
//            error = "Invalid First Name";
//        } else if (last_name == null || last_name.trim().isEmpty()) {
//            flag = false;
//            error = "Invalid Last Name";
//        } else if (email_id == null || email_id.trim().isEmpty() || !emailPattern.matcher(email_id).matches()) {
//            //Valid Mail ID
//            flag = false;
//            error = "Invalid Email ID";
//        } else if (phone_no == null || phone_no.trim().isEmpty() || !mobilePattern.matcher(phone_no).matches()) {
//            flag = false;
//            error = "Invalid Mobile Number";
//        } else if (college_name.length() < 4) {
//            flag = false;
//            error = "College Name should have at least 4 characters";
//        } else if (no_of_participants == null || no_of_participants.trim().isEmpty()) {
//            flag = false;
//            error = "Invalid Event";
//        }else {
//            try {
//                num_event_id = Integer.parseInt(event_id);
//            } catch (NumberFormatException | NullPointerException e) {
//                flag = false;
//                error = "Invalid Event";
//            }
//
//
//            try {
//                num_participants = Integer.parseInt(no_of_participants);
//                if (num_participants < 1) {
//                    flag = false;
//                    error = "The participant count cannot be less than 1";
//                }
//            } catch (NumberFormatException e) {
//                flag = false;
//                error = "The participant count cannot be less than 1";
//            }
//        }
//
//        if(!flag){
//            req.getSession().setAttribute("Error", error);
//            resp.sendRedirect("done.jsp");
//            return;
//        }
//
//
//        try(Connection connection = DatabaseConnection.getConnection()){
//            WebUser user = WebUser.getUserByEmail(email_id);
//            if(user == null){
//
//                // User does not exist
//                user = new WebUser();
//
//                user.setFirst_name(first_name);
//                user.setLast_name(last_name);
//
//                user.setEmail_id(email_id);
//                user.setMobile(phone_no);
//
//                user.setBranch(branch);
//                user.setYear_of_study(year);
//
//                user.setCollege_name(college_name);
//                user.setReg_id("");
//
//                user.setUser_password(Misc.getRandomPassword());
//                user.setUser_type(WebUser.USER_NORMAL);
//
//                // Upload user to database
//                user = user.pushSelfToDB();
//
//                if(user == null){
//                    req.getSession().setAttribute("Error", "Error Processing request! Try again");
//                    resp.sendRedirect("done.jsp");
//                    return;
//                }
//
////                Misc.sendMailFromFile(email_id,req,"/templates/email_template.jsp",  "Welcome");
//                req.getSession().setAttribute("error", "Thank You!. Please login with your credentials!");
//
//            }else{
//                if (user.getUser_type().equals(WebUser.USER_VOLUNTEER) || user.getUser_type().equals(WebUser.USER_ADMIN)) {
//                    req.getSession().setAttribute("Error", "Cannot register Volunteer or Admin");
//                    resp.sendRedirect("done.jsp");
//                    return;
//                }
//            }
//
//            //language=MySQL
//            String eventRegSQL = "INSERT INTO EVENT_REG (participant_name, college_name, group_t, category, event_id, user_id, has_paid, volunteer_id, payment_details," +
//                    "   name2, phone2, name3, name4) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
//            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, eventRegSQL);
//
//            Event myEvent;
//            //language=MySQL
//            String eventSql = "SELECT * FROM EVENT WHERE event_id = ?";
//            PreparedStatement eventStatement = DatabaseConnection.getPreparedStatement(connection, eventSql);
//            eventStatement.setInt(1, num_event_id);
//            ResultSet set = eventStatement.executeQuery();
//
//            String group_t = "";
//
//            int num_year = Integer.parseInt(year);
//            if(num_year == 1 || num_year == 2){
//                group_t = "JUNIOR";
//            }else{
//                group_t = "SENIOR";
//
//            }
//
//            if(set.next()) {
//
//
//                myEvent = Event.getFromSet(set);
//                statement.setInt(5, myEvent.getEvent_id());
//                statement.setString(1, user.getFirst_name() + " " + user.getLast_name());
//                statement.setString(2, user.getCollege_name());
//                statement.setString(3, (num_participants > 1) ? "GROUP": "INDIVIDUAL");
//                statement.setString(4, group_t);
//                statement.setInt(6, user.getUser_id());
//                statement.setString(7, payment_status);
//                statement.setInt(8, volunteer_id);
//                statement.setString(9, payment_details != null ? payment_details : "");
//                statement.setString(10, name_2);
//                statement.setString(11, phone_2);
//                statement.setString(12, name_3);
//                statement.setString(13, name_4);
//
//
//
//                statement.execute();
//
//                //language=MySQL
//                String getRegIdSql = "SELECT id from EVENT_REG where event_id = ? and user_id = ? ORDER BY id DESC LIMIT 1; ";
//
////                        regnum = myEvent.getAttendees();
//                PreparedStatement statement1 = DatabaseConnection.getPreparedStatement(connection, getRegIdSql);
//                statement1.setInt(1, myEvent.getEvent_id());
//                statement1.setInt(2, user.getUser_id());
//                ResultSet set1 = statement1.executeQuery();
//                int regnum = 0;
//                if (set1.next()) {
//                    regnum = set1.getInt("id");
//                }
//
//                Document doc = Jsoup.connect(Misc.getBaseUrl(req) + "/templates/recipt_template.jsp").get();
//
//                doc.select("#receipt_id").html(String.valueOf(regnum));
//                doc.select("#participant_name").html(participant_name);
//                doc.select("#event_name").html(myEvent.getEvent_name());
//                doc.select("#fees").html(String.valueOf(myEvent.getEvent_fee()));
//                doc.select("#payment_done").html(payment_status.equals("1") ? "Yes": "No");
//                doc.select("#payment_details").html(payment_details);
//                if(payment_status.equals("1")){
//                    doc.select("#pay_here").html("Already Paid");
//                }else{
//                    doc.select("#pay_here")
//                            //language=HTML
//                            .html("PayTM: 9923440183 <br>UPI ID: 9923440183@paytm <br>Send screenshot to <a href='mailto:csi.pict2018@gmail.com'>csi.pict2018@gmail.com</a> with registration ID or reply to this mail.");
//                }
////                doc.select("#group_name").html("category");
//
//                EmailHandler.sendMailOnThread(doc.toString(), "Thank you for your registration", user.getEmail_id());
//
//                req.getSession().setAttribute("Error", "Complete! Reg id is "+regnum);
//
//
//            }else{
//                req.getSession().setAttribute("Error", "Cannot find Event");
//
//            }
//
//
//
//        }catch (SQLException e){
//            e.printStackTrace();
//            req.getSession().setAttribute("Error", "Error Processing request! Try again");
//
//        }catch (Exception e){
//            e.printStackTrace();
//            req.getSession().setAttribute("Error", "Unknown Errors");
//
//        }
//        resp.sendRedirect("done.jsp");
//    }
}
