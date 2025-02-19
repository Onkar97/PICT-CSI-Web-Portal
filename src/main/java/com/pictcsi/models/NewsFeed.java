package com.pictcsi.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class NewsFeed {
    private int id;
    private String title;
    private String description;
    private Timestamp start_date;
    private Timestamp end_date;

    public NewsFeed() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getStart_date() {
        return start_date;
    }

    public void setStart_date(Timestamp start_date) {
        this.start_date = start_date;
    }

    public Timestamp getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Timestamp end_date) {
        this.end_date = end_date;
    }

    public static NewsFeed getFromSet(ResultSet set) throws SQLException {
        NewsFeed newsFeed = new NewsFeed();
        newsFeed.id = set.getInt("id");
        newsFeed.title = set.getString("title");
        newsFeed.description = set.getString("description");
        newsFeed.start_date = set.getTimestamp("start_date");
        newsFeed.end_date = set.getTimestamp("end_date");
        return newsFeed;
    }
}
