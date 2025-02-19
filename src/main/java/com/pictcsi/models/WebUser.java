package com.pictcsi.models;

import com.pictcsi.database.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WebUser {

    public static final String USER_NORMAL = "NORMAL";
    public static final String USER_ADMIN = "ADMIN";
    public static final String USER_VOLUNTEER = "VOLUNTEER";
    private int user_id;
    private String email_id;
    private String first_name;
    private String last_name;
    private String college_name;

    private String mobile;
    private String user_password;

    private String year_of_study;
    private String reg_id;
    private String branch;
    private String user_type;

    public static WebUser getFromSet(ResultSet set) throws SQLException {
        WebUser user = new WebUser();
        user.user_id = set.getInt("user_id");
        user.email_id = set.getString("email_id");
        user.mobile = set.getString("mobile");
        user.first_name = set.getString("first_name");
        user.college_name=set.getString("college_name");
        user.last_name = set.getString("last_name");
        user.user_password = set.getString("user_password");
        user.year_of_study = set.getString("year_of_study");
        user.reg_id = set.getString("reg_id");
        user.branch = set.getString("branch");
        user.user_type = set.getString("user_type");
        return user;
    }

    public WebUser(int user_id, String email_id, String mobile, String user_password, String year_of_study, String reg_id, String branch, String user_type,String college_name) {
        this.user_id = user_id;
        this.email_id = email_id;
        this.mobile = mobile;
        this.user_password = user_password;
        this.year_of_study = year_of_study;
        this.college_name=college_name;
        this.reg_id = reg_id;
        this.branch = branch;
        this.user_type = user_type;
    }

    public static WebUser getUserById(int user_id) throws SQLException{
        try(Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM WEB_USER WHERE user_id = ?";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setInt(1, user_id);
            ResultSet set = statement.executeQuery();
            if(set.next())
                return WebUser.getFromSet(set);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
        return null;
    }
    public static WebUser getUserByEmail(String email_id) throws SQLException{
        try(Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM WEB_USER WHERE email_id = ?";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, email_id);
            ResultSet set = statement.executeQuery();
            if(set.next())
                return WebUser.getFromSet(set);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
        return null;

    }

    public static WebUser getUserByForgotPasswordUid(String user_id) throws SQLException{
        try(Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM WEB_USER WHERE forgot_password_uid = ?";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, user_id);
            ResultSet set = statement.executeQuery();
            if(set.next())
                return WebUser.getFromSet(set);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
        return null;
    }

    public WebUser pushSelfToDB() throws SQLException{
        try(Connection connection = DatabaseConnection.getConnection()) {
            if(this.user_type == null || user_type.isEmpty()){
                throw new RuntimeException("User Type is null or empty");
            }
            //language=MySQL
            String sql = "INSERT INTO WEB_USER (email_id, mobile, user_password, year_of_study, reg_id, branch, first_name, last_name, college_name) VALUES (?,?,MD5(?),?,?,?,?,?,?)";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, email_id);
            statement.setString(2,mobile);
            statement.setString(3,user_password);
            statement.setString(4,year_of_study);
            statement.setString(5,reg_id);
            statement.setString(6, branch);
            statement.setString(7, first_name);
            statement.setString(8, last_name);
            statement.setString(9, college_name);
            if(statement.executeUpdate() > 0){
                return WebUser.getUserByEmail(email_id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
        return null;
    }

    public WebUser() {
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getYear_of_study() {
        return year_of_study;
    }

    public void setYear_of_study(String year_of_study) {
        this.year_of_study = year_of_study;
    }

    public String getReg_id() {
        return reg_id;
    }

    public void setReg_id(String reg_id) {
        this.reg_id = reg_id;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getCollege_name() {
        return college_name;
    }

    public void setCollege_name(String college_name) {
        this.college_name = college_name;
    }
}
