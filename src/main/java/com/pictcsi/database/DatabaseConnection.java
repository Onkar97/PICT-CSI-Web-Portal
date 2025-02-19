package com.pictcsi.database;

import com.sun.istack.internal.NotNull;

import java.sql.*;

public class DatabaseConnection {



    public static Connection getConnection() {
        try {

//                Properties prop = new Properties();
//                InputStream inputStream = DatabaseConnection.class.getResourceAsStream("messages.properties");
//                prop.load(inputStream);
            String driver = "com.mysql.jdbc.Driver";

            //String url = "jdbc:mysql://localhost:3306/pictcsi" + "?autoReconnect=true";
            String url = "jdbc:mysql://localhost:3306/pictcsi" + "?noAccessToProcedureBodies=true&autoReconnect=true&useSSL=false";
            String userName = "root";
            String password = "root@123";
            Class.forName(driver);
            return DriverManager.getConnection(url, userName, password);


        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating connection" + e.getMessage());
        }


    }

    public static PreparedStatement getPreparedStatement(Connection connection, String sql) throws RuntimeException {
        try {

            return connection.prepareStatement(sql);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
//        return null;
    }

    public static CallableStatement getPreparedCall(Connection connection, String sql) throws RuntimeException {
        try {
            if (connection != null) {
                return connection.prepareCall(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Error prepare call statement");
//       return null;
    }

    public static Statement getStatement(Connection connection) throws RuntimeException {

        try {
            if (connection != null) {
                return connection.createStatement();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Error creating statement");
    }

    public static ResultSet getResultSet(Connection connection, @NotNull String sql) throws SQLException {

            return getStatement(connection).executeQuery(sql);


    }

    public static int execute(@NotNull String sql) throws SQLException{
        try(Connection connection = getConnection()) {
            return getStatement(connection).executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
    }



}