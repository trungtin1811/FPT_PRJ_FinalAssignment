/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.email;

/**
 *
 * @author User
 */
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import trungtin.cart.Cart;
import trungtin.cart.CartDTO;

public class Email {

    public boolean sendMail(String name, String directedEmail, Cart cart) throws MessagingException, UnsupportedEncodingException {

        final String fromEmail = "assignmentprj@gmail.com";
        // Mat khai email cua ban
        final String password = "Trungtin1234";
        // dia chi email nguoi nhan
        final String toEmail = directedEmail;

        final String subject = "[PRJ] ORDER CONFIRMARION";
        final String body = "Dear " + name + ", Your order has been confirmed!";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        message.setSubject(subject);
        String html = "";
        if (cart != null) {
            for (CartDTO item : cart.getCart().values()) {
                html += " <td style=\"padding: 5px 10px 5px 0\" width=\"80%\" align=\"left\"> <p>" + item.getProductName() + " (" + item.getQuantity() + ")</p> </td> <td style=\"padding: 5px 0\" width=\"20%\" align=\"left\"> <p>" + item.getPrice() * item.getQuantity() + "</p> </td> ";
            }
            }
            String htmlContent = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"> <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\"><head> <meta charset=\"UTF-8\"> <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\"> <meta name=\"x-apple-disable-message-reformatting\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <meta content=\"telephone=no\" name=\"format-detection\"> <title></title> <!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--> </head><body class=\"esd-drag\"> <div class=\"es-wrapper-color\"> <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-email-paddings\" valign=\"top\"> <table class=\"es-content esd-header-popover\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"> <tbody> <tr></tr> <tr> <td class=\"esd-stripe esd-hover-drag-disabled\" esd-custom-block-id=\"7681\" align=\"center\"> <table class=\"es-header-body\" style=\"background-color: #044767;\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#044767\" align=\"center\"> <tbody> <tr> <td class=\"esd-structure es-p35t es-p35b es-p35r es-p35l esd-hover-drag-disabled\" align=\"left\"> <!--[if mso]><table width=\"530\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"340\" valign=\"top\"><![endif]--> <table class=\"es-left\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\"> <tbody> <tr> <td class=\"es-m-p0r es-m-p20b esd-container-frame esd-hover-drag-disabled\" width=\"340\" valign=\"top\" align=\"center\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-text es-m-txt-c esd-hover-drag-disabled\" align=\"left\"> <h1 style=\"color: #ffffff; line-height: 100%;\">Beretun</h1> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <!--[if mso]></td><td width=\"20\"></td><td width=\"170\" valign=\"top\"><![endif]--> <table cellspacing=\"0\" cellpadding=\"0\" align=\"right\"> <tbody> <tr class=\"es-hidden\"> <td class=\"es-m-p20b esd-container-frame esd-hover-drag-disabled\" esd-custom-block-id=\"7704\" width=\"170\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-spacer es-p5b esd-hover-drag-disabled\" align=\"center\" style=\"font-size:0\"> <table width=\"100%\" height=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"> <tbody> <tr> <td style=\"border-bottom: 1px solid #044767; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;\"></td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <!--[if mso]></td></tr></table><![endif]--> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"> <tbody> <tr> <td class=\"esd-stripe esd-hover-drag-disabled\" align=\"center\"> <table class=\"es-content-body\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\"> <tbody> <tr> <td class=\"esd-structure es-p40t es-p35r es-p35l esd-hover-drag-disabled\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-container-frame esd-hover-drag-disabled\" width=\"530\" valign=\"top\" align=\"center\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-image es-p25t es-p25b es-p35r es-p35l esd-hover-drag-disabled\" align=\"center\" style=\"font-size:0\"><a target=\"_blank\" href=\"https://viewstripo.email/\"><img src=\"https://tlr.stripocdn.email/content/guids/CABINET_75694a6fc3c4633b3ee8e3c750851c02/images/67611522142640957.png\" alt style=\"display: block;\" width=\"120\"></a></td> </tr> <tr> <td class=\"esd-block-text es-p10b esd-hover-drag-disabled\" align=\"center\"> <h2>Thank You For Your Order!</h2> </td> </tr> <tr> <td class=\"esd-block-text es-p15t es-p20b esd-hover-drag-disabled\" align=\"left\"> <p style=\"font-size: 16px; color: #777777;\">Hi <strong>" + name + "</strong>, <br><br>Your order has shipped! Medina Bib should arrive to your shopping address within 3 business days. You can track your order's status from Your Purchase.</p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table class=\"es-content esd-footer-popover\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"> <tbody> <tr> <td class=\"esd-stripe esd-hover-drag-disabled\" align=\"center\"> <table class=\"es-content-body\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\"> <tbody> <tr> <td class=\"esd-structure es-p20t es-p35r es-p35l esd-hover-drag-disabled\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-container-frame esd-hover-drag-disabled\" width=\"530\" valign=\"top\" align=\"center\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-text es-p10t es-p10b es-p10r es-p10l esd-hover-drag-disabled\" bgcolor=\"#eeeeee\" align=\"left\"> <table style=\"width: 500px;\" class=\"cke_show_border\" cellspacing=\"1\" cellpadding=\"1\" border=\"0\" align=\"left\"> <tbody> <tr> <td width=\"80%\"> <h4>Order Confirmation #</h4> </td> <td width=\"20%\"> <h4><br></h4> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> <tr> <td class=\"esd-structure es-p35r es-p35l esd-hover-drag-disabled\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-container-frame esd-hover-drag-disabled\" width=\"530\" valign=\"top\" align=\"center\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-text es-p10t es-p10b es-p10r es-p10l esd-hover-drag-disabled\" align=\"left\"> <table style=\"width: 500px;\" class=\"cke_show_border\" cellspacing=\"1\" cellpadding=\"1\" border=\"0\" align=\"left\"> <tbody> <tr> " + html + " </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> <tr> <td class=\"esd-structure es-p10t es-p35r es-p35l\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr style=\"opacity: 0.5;\"> <td class=\"esd-container-frame esd-hover-drag-disabled\" width=\"530\" valign=\"top\" align=\"center\"> <table style=\"border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-text es-p15t es-p15b es-p10r es-p10l esd-hover-drag-disabled\" align=\"left\"> <table style=\"width: 500px;\" class=\"cke_show_border\" cellspacing=\"1\" cellpadding=\"1\" border=\"0\" align=\"left\"> <tbody> <tr> <td width=\"80%\"> <h4>TOTAL</h4> </td> <td width=\"20%\"> <h4>" + cart.getTotal() + " VND</h4> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> <tr> <td class=\"esd-structure es-p40t es-p40b es-p35r es-p35l esd-hover-drag-disabled\" esd-custom-block-id=\"7796\" align=\"left\"> <!--[if mso]><table width=\"530\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"255\" valign=\"top\"><![endif]--> <table class=\"es-left\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\"> <tbody> <tr> <td class=\"esd-container-frame es-m-p20b esd-hover-drag-disabled\" width=\"255\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-text es-p15b esd-hover-drag-disabled\" align=\"left\"> <h4>Delivery Address</h4> </td> </tr> <tr> <td class=\"esd-block-text es-p10b esd-hover-drag-disabled\" align=\"left\"> <p>702 Xa Lo Ha Noi, Hiep Phu<br>Thu Duc, HCMC<br></p> <p><br></p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <!--[if mso]></td><td width=\"20\"></td><td width=\"255\" valign=\"top\"><![endif]--> <table class=\"es-right\" cellspacing=\"0\" cellpadding=\"0\" align=\"right\"> <tbody> <tr> <td class=\"esd-container-frame esd-hover-drag-disabled\" width=\"255\" align=\"left\"> <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td class=\"esd-block-text es-p15b esd-hover-drag-disabled\" align=\"left\"> <h4>Estimated Delivery Date<br></h4> </td> </tr> <tr> <td class=\"esd-block-text esd-hover-drag-disabled\" align=\"left\"> <p>" + new java.sql.Date(System.currentTimeMillis()) + "</p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <!--[if mso]></td></tr></table><![endif]--> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </div> </body></html>";
        message.setContent(htmlContent, "text/html");
        Transport.send(message);
        System.out.println("Gui mail thanh cong");
        return true;
    }
}
