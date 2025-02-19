package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/admin/registerEventServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

public class RegisterEventServlet extends HttpServlet {


//    String checkUserQuery = "";

    public RegisterEventServlet() {
        super();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String isEdit = (String) req.getParameter("is_edit");
        String event_id = (String) req.getParameter("event_id");
        boolean boolIsEdit = isEdit != null && isEdit.equals("true");


        String name = req.getParameter("name");
        String start_date = req.getParameter("start_date");
        String end_date = req.getParameter("end_date");
        String description= req.getParameter("description");
        String max_seats = req.getParameter("max_seats");
        String event_fee = req.getParameter("event_fee");
        String event_type = req.getParameter("event_type");

        Integer user_id = (Integer) req.getSession().getAttribute("user_id");

        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = req.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }


        try(Connection connection = DatabaseConnection.getConnection()) {

            String sql;
            if(boolIsEdit){
                sql = "UPDATE  EVENT set event_name = ?, start_date = ?, max_seats = ?, description = ?, image = ?, end_date = ?, event_fee = ? where event_id = "+event_id;
            }else {

                sql = "INSERT into EVENT (event_name, start_date, max_seats, description, image, end_date, event_fee, event_type, created_by) " +
                        "values(?,?,?,?,?,?,?,?,?);";
            }
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, name);
            statement.setString(2, start_date);
            statement.setString(3, max_seats);
            statement.setString(4,description);
            statement.setString(6,end_date);
            statement.setString(7,event_fee);
            statement.setString(8,event_type);
            statement.setInt(9,user_id);

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(5, inputStream);
            }
            statement.executeUpdate();

            req.getSession().setAttribute("error", "Event Created");


            resp.sendRedirect("/admin/");

        }catch (Exception e){

            e.printStackTrace();
            req.getSession().setAttribute("error", "Error Creating Event");
            resp.sendRedirect("/admin/");
        }
    }
}
