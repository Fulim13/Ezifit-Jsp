<%-- 
    Document   : changePassword
    Created on : Mar 29, 2022, 7:14:20 PM
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
        <form action="ChangePassword" method="POST">
            <label>Email</label>
            <input type="text" name="email" value="${email}" readonly/>
            <label>Password</label>
            <input type="password" name="password"/>
            <label>Comfirm Password</label>
            <input type="password" name="confirmPassword"/>
            <p class="error">${error.passwordNotSame ? "Password not same" : ""}</p>
            <p class="error">${error.passwordNotFollowRequirement ? "Password should more than 7 and <br/>  should have at least one character and one digit":  ""}</p>
        <button type="submit" >Change</button>
        </form>
    </body>
</html>
<% session.removeAttribute("error"); %>