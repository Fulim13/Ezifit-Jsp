<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="error" scope="session" class="helper.Error" />
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have logged in , to sign up agains
    if(loggedIn){
        response.sendRedirect(request.getContextPath());
    }
%>
<!DOCTYPE html>
<html>
    <style>
        .no-click {
            pointer-events: none;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form  action="CheckEmailInDB" method="POST" class="register-form">
            <label>Email</label>
            <input class="email" type="text" name="email" value="${email}" required/>
            <p class="jserror"></p>
            <p class="error">${error.emailEmpty ? "Email is empty" : ""}</p>
            <p class="error">${error.emailNotFound ? "This email has not registered" : ""}</p>
            <button type="submit" onClick="return validateEmail();" class="btn-submit">Submit</button>
        </form>
    </body>
    <script type="text/javascript">
        function validateEmail() {

            let emailField = document.querySelector(".email");
            var emailFormat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            console.log(emailField.value);
            if (emailField.value.match(emailFormat)) {
                console.log("Hi");
                document.querySelector(".jserror").innerHTML = "";
                document.querySelector(".btn-submit").innerHTML = "Waiting...";
                document.querySelector(".btn-submit").style.pointerEvents  = "none";
                return true;

            } else {
                console.log("Bye");
                document.querySelector(".jserror").style.color = "red";
                document.querySelector(".jserror").innerHTML = "Invalid Email Address";
                emailField.value = "";
                emailField.focus();
                return false;
            }
        }

    </script>
</html>
<%session.removeAttribute("email");%>
<%session.removeAttribute("error");%>