<%-- 
    Document   : signupWithCode
    Created on : Mar 28, 2022, 1:30:39 AM
    Author     : Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form  action="CheckVerificationCode" method="POST" class="register-form">
                <label>Email</label>
                <input type="text" name="email" value="${email}" readonly/>

                <input type="text" name="verificationCode" />
                <p class="error">${error.vCodeNotMatch ? "Verification Not Match" : ""}</p>
                <button type="submit">Submit</button>
        </form>
    </body>
</html>
<%session.removeAttribute("error");%>