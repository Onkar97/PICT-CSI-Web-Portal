package com.pictcsi.models;

import com.pictcsi.database.DatabaseConnection;

import java.sql.*;
import java.util.Date;

public class Event {

    private int event_id;
    private String event_name;
    private Date start_date;
    private int max_seats;
    private String description;
    private Blob image;
    private Date end_date;
    private float event_fee;
    private int attendees;
    private int likes = 0;

    private String event_type;
    private boolean has_ended;

//    private String payment_button;



    public Event() {

    }


    public static Event getFromSet(ResultSet set) throws SQLException {
        Event event = new Event();

        event.event_type=set.getString("event_type");
        event.event_id = set.getInt("event_id");
        event.event_name = set.getString("event_name");
        event.start_date = set.getDate("start_date");
        event.max_seats = set.getInt("max_seats");
        event.description = set.getString("description");
        event.image = set.getBlob("image");
        event.end_date = set.getDate("end_date");
        event.attendees = set.getInt("attendees");
        event.event_fee = set.getFloat("event_fee");
        event.likes = set.getInt("likes");
//        event.payment_button = set.getString("payment_button");

        return event;
    }

    public static Event getById(int id) throws SQLException{
        if(id < 0){
            throw new RuntimeException("Error in id");
        }
        try(Connection connection = DatabaseConnection.getConnection()) {
            //language=MySQL
            String sql = "SELECT  * FROM EVENT WHERE event_id = ?";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setInt(1, id);
            ResultSet set = statement.executeQuery();
            if(set.next()){

                return getFromSet(set);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error creating statement");
        }
        return null;

    }

    public boolean isHas_ended() {
        return has_ended;
    }

    public void setHas_ended(boolean has_ended) {
        this.has_ended = has_ended;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getEvent_name() {
        return event_name;
    }

    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public int getMax_seats() {
        return max_seats;
    }

    public void setMax_seats(int max_seats) {
        this.max_seats = max_seats;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public float getEvent_fee() {
        return event_fee;
    }

    public void setEvent_fee(float event_fee) {
        this.event_fee = event_fee;
    }

    public int getAttendees() {
        return attendees;
    }

    public void setAttendees(int attendees) {
        this.attendees = attendees;
    }

    public String getEvent_type() {
        return event_type;
    }

    public void setEvent_type(String event_type) {
        this.event_type = event_type;
    }



}
