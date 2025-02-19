package com.pictcsi.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class EventJoinReg {

    private String event_name;
    private Date start_date;
    private String description;
    private Date end_date;
    private float event_fee;
    private int likes = 0;
    private String event_type;
    private boolean has_ended;

    private String participant_name;
    private String college_name;
    private String group_t;
    private String category;


    private boolean has_paid;


    public static EventJoinReg getFromSet(ResultSet set) throws SQLException {
        EventJoinReg event = new EventJoinReg();

        event.event_type=set.getString("event_type");
        event.event_name = set.getString("event_name");
        event.start_date = set.getDate("start_date");
        event.description = set.getString("description");
        event.end_date = set.getDate("end_date");
        event.event_fee = set.getFloat("event_fee");
        event.likes = set.getInt("likes");

      //  event.reg_id = set.getInt("id");
        event.participant_name = set.getString("participant_name");
        event.college_name = set.getString("college_name");
        event.group_t = set.getString("group_t");
        event.category = set.getString("category");
       // event.user_id = set.getInt("user_id");
        event.has_paid = set.getBoolean("has_paid");

        return event;


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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getEvent_type() {
        return event_type;
    }

    public void setEvent_type(String event_type) {
        this.event_type = event_type;
    }

    public boolean isHas_ended() {
        return has_ended;
    }

    public void setHas_ended(boolean has_ended) {
        this.has_ended = has_ended;
    }



    public String getParticipant_name() {
        return participant_name;
    }

    public void setParticipant_name(String participant_name) {
        this.participant_name = participant_name;
    }

    public String getCollege_name() {
        return college_name;
    }

    public void setCollege_name(String college_name) {
        this.college_name = college_name;
    }

    public String getGroup_t() {
        return group_t;
    }

    public void setGroup_t(String group_t) {
        this.group_t = group_t;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    public boolean isHas_paid() {
        return has_paid;
    }

    public void setHas_paid(boolean has_paid) {
        this.has_paid = has_paid;
    }
}
