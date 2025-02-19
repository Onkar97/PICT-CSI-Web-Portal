package com.pictcsi.servlets;

import com.pictcsi.models.WebUser;
import com.pictcsi.util.Misc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //language=RegExp
        String emailRegex = "(.*@.*\\..*)|(.*@\\..*\\..*)";
        String phoneRegex = "([1-9][0-9]{9})|(0[1-9][0-9]{9})";

        boolean accept = true;
        Pattern emailPattern = Pattern.compile(emailRegex);
        Pattern mobilePattern = Pattern.compile(phoneRegex);
//        Matcher matcher = pattern.matcher(input);

        String error = "";
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");

        String email_id = req.getParameter("email_id");
        String mobile = req.getParameter("mobile");

        String branch=req.getParameter("branch");
        String year= req.getParameter("year");

        String collegeName = req.getParameter("college_name");
        String reg_id = req.getParameter("reg_id");

        String password = req.getParameter("password");
        String password_repeat = req.getParameter("password_repeat");




//        String status = "Member";


        if(!emailPattern.matcher(email_id).matches()){
            //Valid Mail ID
            accept = false;
            error = "Invalid Email ID";
        }

        else if(!password.equals(password_repeat)){
            accept = false;
            error = "Password does not match";
        }

        else if(!mobilePattern.matcher(mobile).matches()){
            accept =false;
            error = "Invalid Mobile Number";
        }

        else if(collegeName.length() < 4 ){
            accept =false;
            error = "College Name should have at least 4 characters";
        }



        if(accept){
            try {

                WebUser user = new WebUser();

                user.setFirst_name(firstName);
                user.setLast_name(lastName);

                user.setEmail_id(email_id);
                user.setMobile(mobile);

                user.setBranch(branch);
                user.setYear_of_study(year);

                user.setCollege_name(collegeName);
                user.setReg_id(reg_id);

                user.setUser_password(password);
                user.setUser_type(WebUser.USER_NORMAL);


                user.pushSelfToDB();

                Misc.sendMailFromFile(email_id,req,"/templates/email_template.jsp",  "Welcome");
                req.getSession().setAttribute("error", "Thank You!. Please login with your credentials!");
                resp.sendRedirect("index.jsp");


            }catch (SQLException e){
                invalidLogin(req,resp);
            }
        }else {
            req.getSession().setAttribute("error",error);
            resp.sendRedirect("index.jsp");
        }
    }
    private void invalidLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        req.getSession().setAttribute("error","Error while registering you!");
        resp.sendRedirect("index.jsp");
    }



}
