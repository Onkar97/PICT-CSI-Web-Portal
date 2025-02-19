package com.pictcsi.models;

import java.sql.ResultSet;
import java.sql.SQLException;

public class EventReg {
    private int id;

    private String participant_name;
    private String college_name;
    private String group_t;
    private String category;
    private int event_id;

    private int user_id;

    private boolean has_paid;

    private int volunteer_id;

    private float amt_recvd;

    public static EventReg getFromSet(ResultSet set) throws SQLException {
        EventReg eventReg = new EventReg();
        eventReg.id = set.getInt("id");
        eventReg.participant_name = set.getString("participant_name");
        eventReg.college_name = set.getString("college_name");
        eventReg.group_t = set.getString("group_t");
        eventReg.category = set.getString("category");
        eventReg.event_id = set.getInt("event_id");

        eventReg.user_id = set.getInt("user_id");
        eventReg.has_paid = set.getBoolean("has_paid");
        eventReg.volunteer_id = set.getInt("volunteer_id");

        eventReg.amt_recvd = set.getFloat("amt_recvd");

        return eventReg;
    }

    public EventReg() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public boolean isHas_paid() {
        return has_paid;
    }

    public void setHas_paid(boolean has_paid) {
        this.has_paid = has_paid;
    }

    public int getVolunteer_id() {
        return volunteer_id;
    }

    public float getAmt_recvd() {
        return amt_recvd;
    }
}