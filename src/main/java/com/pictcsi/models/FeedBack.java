package com.pictcsi.models;

import com.pictcsi.database.DatabaseConnection;

import java.sql.*;

public class FeedBack {
    private int feed_id;
    private String feed_user_name;
    private String feed_email;
    private String feed_description;
    private String feed_query;
    private String feed_back_answer;
    private Date created_date;

    public void pushSelfToDB() throws SQLException {
        try(Connection connection = DatabaseConnection.getConnection()) {

            //language=MySQL
        String eventRegSQL = "INSERT INTO FEEDBACK (feed_user_name, feed_email, feed_description, feed_query, created_date) VALUES (?,?,?,?,NOW())";
        PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, eventRegSQL);
        statement.setString(1, feed_user_name);
        statement.setString(2,feed_email);
        statement.setString(3,feed_description);
        statement.setString(4,feed_query);
//        statement.setDate(5, created_date);

        statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }

    }

    public static FeedBack getFromSet(ResultSet set) throws SQLException{
        FeedBack feedBack = new FeedBack();
        feedBack.setFeed_id(set.getInt("feed_id"));
        feedBack.setFeed_user_name(set.getString("feed_user_name"));
        feedBack.setFeed_email(set.getString("feed_email"));
        feedBack.setFeed_description(set.getString("feed_description"));
        feedBack.setFeed_query(set.getString("feed_query"));
        feedBack.feed_back_answer = set.getString("feedback_answer");
        feedBack.created_date = set.getDate("created_date");
        return feedBack;


    }

    public String getFeed_back_answer() {
        return feed_back_answer;
    }

    public void setFeed_back_answer(String feed_back_answer) {
        this.feed_back_answer = feed_back_answer;
    }

    public int getFeed_id() {
        return feed_id;
    }

    public void setFeed_id(int feed_id) {
        this.feed_id = feed_id;
    }

    public String getFeed_user_name() {
        return feed_user_name;
    }

    public void setFeed_user_name(String feed_user_name) {
        this.feed_user_name = feed_user_name;
    }

    public String getFeed_email() {
        return feed_email;
    }

    public void setFeed_email(String feed_email) {
        this.feed_email = feed_email;
    }

    public String getFeed_description() {
        return feed_description;
    }

    public void setFeed_description(String feed_description) {
        this.feed_description = feed_description;
    }

    public String getFeed_query() {
        return feed_query;
    }

    public void setFeed_query(String feed_query) {
        this.feed_query = feed_query;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }
}
