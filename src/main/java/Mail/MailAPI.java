/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author ASUS
 */
public class MailAPI {
    public static String Send(String to) {
        // Recipient's email ID needs to be mentioned.

        // Sender's email ID needs to be mentioned
        String from = "TimeLive";
        final String username = "timelive.circleqm@gmail.com";//change accordingly
        final String password = "timelive@qm";//change accordingly

        // Assuming you are sending email through relay.jangosmtp.net
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        
        String code = RandomString.getRandomString(8);
        // Get the Session object.
        Session session = Session.getInstance(props,
           new javax.mail.Authenticator() {
              protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(username, password);
             }
           });

        try {
             // Create a default MimeMessage object.
             MimeMessage message = new MimeMessage(session);

             // Set From: header field of the header.
             message.setFrom(new InternetAddress(from));

             // Set To: header field of the header.
             message.setRecipients(Message.RecipientType.TO,
                 InternetAddress.parse(to));

             // Set Subject: header field
             message.setSubject("TimeLive : Mã xác nhận của bạn","UTF-8");

             // Now set the actual message
             message.setText("Xin chào , đây là mã xác nhận của bạn : "+code, "UTF-8");

             // Send message
             Transport.send(message);

            System.out.println("Sent message successfully....");
            System.out.println(to);

        } catch (MessagingException e) {
            return e.toString();
        }
      return code;
   }
}
