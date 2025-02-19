package com.pictcsi.util;

import com.sun.istack.internal.NotNull;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class EmailHandler {

    private static class MyRunnable implements Runnable {

        private String content, email_id, subject;

        public MyRunnable(String content, String subject, String email_id) {
            this.content = content;
            this.subject = subject;
            this.email_id = email_id;
        }

        public void run() {
            // code in the other thread, can reference "var" variable
            sendMail(content, subject, email_id);
        }
    }

    public static void sendMailOnThread(@NotNull String content, String subject, @NotNull String email_id) throws RuntimeException {
        MyRunnable runnable = new MyRunnable(content, subject, email_id);
        Thread t = new Thread(runnable);
        t.start();
    }

    private static void sendMail(@NotNull String content, @NotNull String subject, @NotNull String email_id) throws RuntimeException {
        //Get the session object
        if (Environment.enableSendMail) {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.sendgrid.net");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "587");

            Session ses = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("negativezer0", "mh12ca3416");
                }
            });

            try {
                MimeMessage message = new MimeMessage(ses);

                message.setFrom(new InternetAddress("register@pictcsi.co.in"));

                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email_id));
                message.setReplyTo(new javax.mail.Address[]
                        {
                                new javax.mail.internet.InternetAddress("csi.pict2018@gmail.com")
                        });
                message.setSubject(subject);

                Multipart multipart = new MimeMultipart();

                BodyPart htmlPart = new MimeBodyPart();

                htmlPart.setContent(content, "text/html");

                htmlPart.setDisposition(BodyPart.INLINE);


                multipart.addBodyPart(htmlPart);

                message.setContent(multipart);

                //send message
                Transport.send(message);
                System.out.println("\nEmail sent successfully to " + email_id);

            } catch (Exception e) {

                e.printStackTrace();
                throw new RuntimeException("Error Sending mail");
            }
        }
    }


}
