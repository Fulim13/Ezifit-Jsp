<%-- 
    Document   : profile
    Created on : Mar 28, 2022, 11:04:37 AM
    Author     : Lim
--%>

<%@page import="model.Customer,java.util.List" contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if(!loggedIn){
        response.sendRedirect(request.getContextPath());
    }
%>
<!DOCTYPE html>
<html>
    <style>
        #profile-picture{
            width: 200px;
            height: 200px;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- if user do not have profile picture use teh default one --%>
        <img id="profile-picture" src="data:image/jpg;base64,${loggedInCustomer.customerImage != null ? loggedInCustomer.base64Image : ""}" />
        <form name="form" method="post" action="UpdateProfile" enctype="multipart/form-data"> 
            <label>Profile Picture</label>
            <input type="file" name="profilePicture"  onchange="showUploadedImage(this)"><br><br>
            <label>Full Name</label>
            <input type="text" name="fullName" value="${loggedInCustomer.fullname}"><br><br>
            <label>Email</label>
            <%-- TODO:Remember to let this field light grey abit  --%>
            <%-- TODO:Consider using cout  --%>
            <input type="text" name="email" value="${loggedInCustomer.email}" readonly><br><br>
            <label>Phone No.</label>
            <input type="text" name="phone" value="${loggedInCustomer.phone}"><br><br>
            <label>Date of Birth<label>
            <input type="date" name="dob" value="${loggedInCustomer.dob != null ? loggedInCustomer.strDate : ""}"><br><br>
            <label>Address</label>
            <textarea name="address" value="${loggedInCustomer.address}" ></textarea><br><br>
            <label>Password</label>
            <input type="text" name="password" ><br><br>
            <label>Confirm Password</label>
            <input type="text" name="comfirmPassword" ><br><br>
            <div>If do not want to change password, leave blank</div>
            <input type="submit" value="Update">
            <input type="reset"  value="Cancel">
        </form>

    </body>
    <script>
        function showUploadedImage(fileUpload){
            console.log(document.getElementById("profile-picture"));
            let file = fileUpload.files[0];
            let reader =  new FileReader();
            reader.onload = function(e){
                document.getElementById("profile-picture").src =  e.target.result; 
                
            }
            reader.readAsDataURL(file);
        }
    </script>
</html>
