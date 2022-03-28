<%-- 
    Document   : login
    Created on : Mar 28, 2022, 10:02:30 PM
    Author     : Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have logged in , to sign up agains
    if(loggedIn){
        response.sendRedirect(request.getContextPath());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="CheckLogin">
            <label>Email</label><br/>
            <input type="text" name="email" /><br/>
            <label>Password</label><br/>
            <input type="password" name="password" /><br/>
            <input type="submit" value="submit" />
        </form>
        <a href="signup.jsp">Sign up?</a>
    </body>
</html>
