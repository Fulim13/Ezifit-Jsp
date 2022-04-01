/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*; 
/**
 *
 * @author Lim
 */
public class MailUtil {

    public static void sendMail(String to, String from, String subject, String body, boolean IsHtml) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtps.host", "smtp.gmail.com");
        props.put("mail.smtps.port", 465);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtps.quitwait","false");
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);

        Message message = new MimeMessage(session);
        message.setSubject(subject);
        if (IsHtml) {
            message.setContent(body, "text/html");
        } else {
            message.setText(body);
        }
        Address fromAddress = new InternetAddress(from);
        Address toAddress = new InternetAddress(to);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);
        Transport transport = session.getTransport();
        transport.connect("noreplyezifit@gmail.com","Ezitfit1234");
        transport.sendMessage(message,message.getAllRecipients());
        transport.close();

 
    }
    
    
}
