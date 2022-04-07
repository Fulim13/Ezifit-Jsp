
<%@page import="java.util.List"%>
<%@page import="model.Staff"%>
<%
    List<Staff> staffList = (List) session.getAttribute("staffList");

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Update Staff </title>
        <style>
            *{
                box-sizing: border-box;
            }
            body{
                font-family: 'Lucida Sans'; 
                margin: 0;
                padding: 0;
            }
            .header{
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 20px
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
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }
            .login-body{
                background-color: #EFF0F5;
                min-height: calc(100vh - 108.4px);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .login-form{
                background-color: #FFFFFF;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                width:500px;
                padding: 45px;
                box-shadow: lightgrey 2px 2px 8px 2px;
            }
            .login-title{
                font-family: Raleway-Medium;
                font-size: 30px;
                color: #555555;
                line-height: 1.2;
                text-transform: uppercase;
                text-align: left;
                width: 100%;
                padding-bottom: 32px;

            }

            label {
                display: block;
                font-family: Raleway-SemiBold;
                font-size: 20px;
                color: #555555;
                line-height: 1.4;
                text-transform: uppercase;
                padding-bottom: 11px;
            }

            .login-btn{
                outline: none;
                border: none;
                font-size: 20px;
                color: #FFFFFF;
                font-family: Raleway-Bold;
                font-size: 20px;
                line-height: 1.2;
                padding: 0 20px;
                min-width: 150px;
                height: 55px;
                background-color: #333333;
                border-radius: 27px;
                margin-top: 35px;
                transition: all 0.4s;
            }

            .login-btn:hover {
                background-color: #4BA96A;
            }

            input {
                margin-bottom: 35px;
                outline: none;
                font-family: Raleway-Medium;
                color: #555555;
                line-height: 1.2;
                font-size: 18px;
                display: block;
                width: 100%;
                background: transparent;
                height: 45px;
                padding: 0 10px;
                border: 3px solid #e6e6e6;
                border-radius: 2px;
            }

            input:focus{
                border: 3px solid #6B77DA;
            }
            .hightlight{
                color: #8B0000;
            }
            .password-field{
                margin:0;
            }
            .not-hightlight{
                color: #BDBDBD;
            }
            .signuplink, .signuplink:hover, .signuplink:active{
                color: #8B0000;

            }
            .signup{
                text-align: center;
                font-size: 18px;
            }

            .forgotpasswordlink, .forgotpasswordlink:hover , .forgotpasswordlink:active{
                display: block;
                color: #006DC5;
                margin-top: 10px;
                text-align: right;
            }
            .error{
                color:red;
            }
            img {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
            }
            .toggle-checkbox{
                display: inline;
                margin:5px;
                width: 24px;
                height: 24px;
                position: relative;
                top: 6px;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="staffHomepage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href="../LoadCheckIdentityStaff"><i class="fa fa-user"></i></a></li>
                <li><a href="logoutStaff.jsp"><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>
        <div class="login-body">
            <div class="login-form">
                <%                    if (request.getRemoteUser() != null) {
                        for (int i = 0; i < staffList.size(); i++) {
                            if (request.getRemoteUser().equals(staffList.get(i).getStaffName())) {
                %>
                <form  action="../UpdateStaff" >
                    <div class="login-title">Update Staff Profile</div>

                    <label>Staff ID</label>    
                    <input type="text" name="staff_id" placeholder="Username"  value="<%=staffList.get(i).getStaffId()%>"required readonly/>

                    <label>Staff Name</label>
                    <input type="text" name="staff_name" placeholder="Username" value="<%=staffList.get(i).getStaffName()%>" required="required" />

                    <label>Staff Email</label>
                    <input type="email" name="staff_email" placeholder="Email"  value="<%=staffList.get(i).getStaffEmail()%>" required="required" />

                    <label>Staff Password</label>
                    <input type="password" id="password" name="password" placeholder="Password" value="<%=staffList.get(i).getPassword()%>" required="required" />

                    <input type="hidden" name="position"   value="<%=staffList.get(i).getPosition()%>"  />


                    <input type="submit" value="UPDATE" class="login-btn"/>
                </form>
                <% } %>
                <% }%>
                <% } else {%>
                
                Please Log in first
                <% }%>
            </div>

        </div>

    </body>
</html>

