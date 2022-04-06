<%-- 
    Document   : profile
    Created on : Mar 28, 2022, 11:04:37 AM
    Author     : Lim
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Customer,java.util.List" contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            body{
                font-family: 'Lucida Sans';                
            }
            .header{
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 25px
            }
            .header span a{
                font-size: 40px; 
                font-weight: bold; 
                letter-spacing: 3px;
                color: black;
                text-decoration: none;
            }           
            .nav-link li{
                display: inline-block;
                margin: 0 13px;
                font-weight: 700; 
                font-size: 22px;
            }
            .nav-link li i{
                color: black;
            }
            .nav-link :hover{
                color: #8B0000;
            }
            #profile-picture{
                width: 200px;
                height: 200px;
                border: 8px white solid;
                border-radius: 50%;
                box-shadow: lightgrey 2px 2px 8px 2px;
                position: relative;
            }
            textarea{
                resize: none;
                width: 80%;
                cursor: pointer;
                border: 2px lightgray solid;
                outline: 0;
            }

            textarea:focus{

                border: 2px #6B77DA solid;
            }

            .form-settings > input {
                width:80%;
                cursor: pointer;
                outline: none;
                border: 2px lightgray solid;
                height: 30px;
                margin-bottom:  20px;
            }

            .form-settings > input:focus {
                border: 2px #6B77DA solid;
            }

            label {
                font-size: 17px;
                font-weight: bold;
                width: 80%;
            }

            .form-settings .email{
                background-color: #E9ECEF;
                cursor: auto;
            }

            .form-settings .email:focus{
                border: 2px lightgray solid;
            }

            .settings{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .form-settings{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 600px;
            }

            .settings-btns{

                display: flex;
                justify-self: center;
                align-self: center;
            }

            .settings-btn{
                outline: none;
                border: none;
                border-radius: 6px;
                font-weight: 700;
                width: 160px;
                height: 40px;
                margin: 10px;
                cursor: pointer;
            }

            .settings-btn-update{
                background-color: #05c46b;
                color: black;

            }

            .settings-btn-cancel{
                background-color:  #E04848;
                color: #EEEEEE;
            }
            .upload-btn{
                background-color: #8B0000;
                color: white;
                padding: 0.5rem;
                font-family: sans-serif;
                border-radius: 0.3rem;
                cursor: pointer;
                margin-top: 1rem;
                width : 170px;
                text-align: center;
            }
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }
            .previous{
                display: inline-block;
                margin: 0 13px;
                font-size: 40px;
                position: absolute;
                left: 35px;

            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="homePage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                    <%if (loggedIn) {%>
                <li><a href="GetOrder"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="Logout"><i class="fa fa-sign-out"></i></a></li>
                        <%} else {%>
                <li><a href="login.jsp"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in"></i></a></li>
                        <%}%>       
            </ul>
        </div>
    <li class="previous"><a href="homePage.jsp"><i class="fa fa-arrow-left" aria-hidden="true"></a></i></li>
<div class="settings">
    <c:choose>
    <c:when test="${loggedInCustomer.customerImage != null}">
        <img id="profile-picture" src="data:image/jpg;base64,${loggedInCustomer.customerImage != null ? loggedInCustomer.base64Image : ""}" />
        </c:when>   
        <c:otherwise>
            <img id="profile-picture" src="defaultprofilepic.png" />
    </c:otherwise>
  </c:choose>
    <form class="form-settings" name="form" method="post" action="UpdateProfile" enctype="multipart/form-data"> 
        <label class="upload-btn" for="upload">Change Profile</label>
        <input type="file" name="profilePicture" id="upload" onchange="showUploadedImage(this)" hidden>
        <label>Full Name</label>
        <input type="text" name="fullName" value="${loggedInCustomer.fullname}">
        <div class="error">${error.fullNameEmpty ? "FullName is empty" : ""}</div>
        <label>Email</label>
        <input class="email" type="text" name="email" value="${loggedInCustomer.email}" readonly>
        <label>Phone No.</label>
        <input type="text" name="phone" value="${loggedInCustomer.phone}">
        <div class="error">${error.phoneNoEmpty ? "Phone number is empty" : ""}</div>
        <div class="error">${error.phoneNoRedundant ? "This phone number has been registered by another user" : ""}</div>
        <label>Date of Birth</label>
        <input type="date" name="dob" value="${loggedInCustomer.dob != null ? loggedInCustomer.strDate : ""}">
        <div class="error">${error.dobFormatErr ? "Date Format is Wrong" : ""}</div>
        <label>Address</label>
        <textarea name="address" rows="5">${loggedInCustomer.address}</textarea>
        <div class="settings-btns">
            <input type="submit" class="settings-btn settings-btn-update" value="Update">
            <input type="reset"  class="settings-btn settings-btn-cancel" value="Cancel">
        </div>
    </form>
</div>
</body>
<script>
    function showUploadedImage(fileUpload) {
        console.log(document.getElementById("profile-picture"));
        let file = fileUpload.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById("profile-picture").src = e.target.result;

        }
        reader.readAsDataURL(file);
    }
</script>
</html>
<% session.removeAttribute("error");%>