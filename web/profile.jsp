<%-- 
    Document   : profile
    Created on : Mar 28, 2022, 11:04:37 AM
    Author     : Lim
--%>

<%@page import="model.Customer,java.util.List" contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
    }
%>
<!DOCTYPE html>
<html>
    <style>
        #profile-picture{
            width: 200px;
            height: 200px;
            border: 8px white solid;
            border-radius: 50%;
            box-shadow: lightgrey 2px 2px 8px 2px;

        }
        textarea{
            resize: none;
            width: 80%;
            cursor: pointer;
        }

        .form-settings > input {
            width:80%;
            cursor: pointer;
            outline: none;
            border: 2px lightgray solid;
            height: 30px;
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
            /*text-align: left;*/
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
            background-color: #5ae07e;
            color: black;

        }

        .settings-btn-cancel{
            background-color:  #C82333;
            
            color: #EEEEEE;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="settings">
            <%-- if user do not have profile picture use teh default one --%>
            <img id="profile-picture" src="data:image/jpg;base64,${loggedInCustomer.customerImage != null ? loggedInCustomer.base64Image : ""}" />
            <form class="form-settings" name="form" method="post" action="UpdateProfile" enctype="multipart/form-data"> 
                <label>Profile Picture</label>
                <input type="file" name="profilePicture"  onchange="showUploadedImage(this)">
                <label>Full Name</label>
                <input type="text" name="fullName" value="${loggedInCustomer.fullname}">
                <p class="error">${error.fullNameEmpty ? "FullName is empty" : ""}</p>
                <label>Email</label>
                <%-- TODO:Remember to let this field light grey abit  --%>
                <%-- TODO:Consider using cout  --%>
                <input class="email" type="text" name="email" value="${loggedInCustomer.email}" readonly>
                <label>Phone No.</label>
                <input type="text" name="phone" value="${loggedInCustomer.phone}">
                <p class="error">${error.phoneNoEmpty ? "Phone number is empty" : ""}</p>
                <p class="error">${error.phoneNoRedundant ? "This phone number has been registered by another user" : ""}</p>
                <label>Date of Birth</label>
                <input type="date" name="dob" value="${loggedInCustomer.dob != null ? loggedInCustomer.strDate : ""}">
                <p class="error">${error.dobFormatErr ? "Date Format is Wrong" : ""}</p>
                <label>Address</label>
                <textarea name="address" rows="5">${loggedInCustomer.address}</textarea>
                <!--            <label>Password</label>
                            <input type="text" name="password" >
                            <label>Confirm Password</label>
                            <input type="text" name="comfirmPassword" >
                            <div>If do not want to change password, leave blank</div>-->
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