<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .inactiveLink {
                pointer-events: none;
                cursor: default;
                text-decoration: none;
                color: grey;
            }
            a, a:hover, a:focus, a:active {

                color: blue;
            }
        </style>
    </head>
    <body>
        <form  action="CheckVerificationCode" method="POST" class="register-form">
            <input name="whichJSP" value="signUpWithCode" hidden/>
            <label>Email</label>
            <input type="text" class="email" name="email" value="${email}" readonly/>

            <input type="text" name="verificationCode" />
            <p class="error">${error.vCodeNotMatch ? "Verification Not Match" : ""}</p>
            <p class="error">${error.vCodeExpire ? "Verification Expired, Wait for 60 Seconds , click the link below" : ""}</p>    
            <button type="submit">Submit</button>
        </form>
        <a href="" class="send-verification inactiveLink"></a>

    </body>
    <script>
        let timeleft = 3;
        let countDownTimer = setInterval(function () {
            if (timeleft <= 0) {
                clearInterval(countDownTimer);
                let email = document.querySelector(".email").value
                document.querySelector(".send-verification").innerHTML = "Send verification code again"
                document.querySelector(".send-verification").href = "CheckEmail?email=" + email;
                document.querySelector(".send-verification").classList.remove("inactiveLink");
            } else {
                document.querySelector(".send-verification").innerHTML = "Resend ? Wait for " + timeleft;
                timeleft -= 1;
            }

        }, 1000);
        countDownTimer();
    </script>
</html>
<%session.removeAttribute("error");%>