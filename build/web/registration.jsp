<%-- 
    Document   : registration
    Created on : Mar 20, 2022, 5:06:21 PM
    Author     : Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="error" scope="session" class="helper.Error" />
<jsp:useBean id="customer" scope="session" class="model.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="registration.css">
    </head>
    <body>
        <div class="register-box">
            <h1>Registration Form</h1>
            <form  action="RegisterProcess" method="POST" class="register-form">
                <label>Email</label>
                <input type="text" name="email" value="${email}" readonly/>
                <label>Full Name</label>
                <input type="text" name="fullName" value="${customer.fullname}"/>
                <p class="error">${error.fullNameEmpty ? "FullName is empty" : ""}</p>
                <label>Phone No</label>
                <input type="text" name="phoneNo" value="${customer.phone}"/>
                <p class="error">${error.phoneNoEmpty ? "Phone number is empty" : ""}</p>
                <p class="error">${error.phoneNoRedundant ? "This phone number has been registered by another user" : ""}</p>
                <label>Password</label>
                <input type="password" name="password" value="${customer.password}"/>
                <label>Comfirm Password</label>
                <input type="password" name="confirmPassword" value="${customer.password}" />
                <p class="error">${error.passwordNotSame ? "Password not same" : ""}</p>
                <p class="error">${error.passwordNotFollowRequirement ? "Password should more than 7 and <br/>  should have at least one character and one digit":  ""}</p>
                <div>
                    <button type="submit" >Register</button>
                </div>
            </form>
        </div>
    </body>
</html>
<% session.removeAttribute("customer"); %>
<% session.removeAttribute("error"); %>
