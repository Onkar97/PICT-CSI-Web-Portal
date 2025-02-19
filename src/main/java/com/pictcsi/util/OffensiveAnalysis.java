package com.pictcsi.util;

import com.pictcsi.database.DatabaseConnection;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class OffensiveAnalysis {


    //language=MySQL
    static String sql = "INSERT INTO OFFENSIVE_WORDS (word) VALUES (?)";

    static PreparedStatement statement;

    public static void main(String[] args) throws SQLException {
        try(Connection connection = DatabaseConnection.getConnection()) {
            statement = connection.prepareStatement(sql);

            // CSV file
            File file = new File("/home/negativezero/badwords.txt");
            Scanner sc = null;

            sc = new Scanner(file);
            // Check if there is another line of input
            while (sc.hasNextLine()) {
                String str = sc.nextLine();
                parseLine(str);
            }

        } catch (IOException exp) {
            // TODO Auto-generated catch block
            exp.printStackTrace();
        }
    }
    private static void parseLine(String str) throws SQLException{
        Scanner sc = new Scanner(str);
        sc.useDelimiter(",");

        // Check if there is another line of input
        while(sc.hasNext()){
            statement.setString(1, sc.next().trim());
            statement.executeUpdate();
//            System.out.println();
        }
        sc.close();
    }
}
