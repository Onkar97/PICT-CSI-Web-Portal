package com.pictcsi.util;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Date;
import java.util.Random;

public class Misc {
    public static String getBaseUrl(HttpServletRequest request) {
        String scheme = request.getScheme() + "://";
        String serverName = request.getServerName();
        String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
        String contextPath = request.getContextPath();
        return scheme + serverName + serverPort + contextPath;
    }

    public static String getRandomPassword(){
        final String alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random = new Random();

        String id = "CSI";

        StringBuilder builder =  new StringBuilder();

        builder.append(id);
        for (int i = 0; i < 3; i++) {
            builder.append(alphabets.charAt(random.nextInt(alphabets.length())));
        }
        return builder.toString();
    }

    public static void sendMailFromFile(String email_id, HttpServletRequest request, String file_name, String subject){
//        String content = "<html>" +
//                "<body><h3>Welcome to pict CSI</h3></body>" +
//                "</html>";
        try {
            InputStream input = new URL(Misc.getBaseUrl(request) + file_name).openStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            StringBuilder out = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null){
                out.append(line);
            }

            reader.close();
            EmailHandler.sendMailOnThread(out.toString(), subject, email_id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static java.util.Date convertFromSQLDateToJAVADate(
            java.sql.Date sqlDate) {
        java.util.Date javaDate = null;
        if (sqlDate != null) {
            javaDate = new Date(sqlDate.getTime());
        }
        return javaDate;
    }
}