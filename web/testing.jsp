<%-- 
    CHAN KAI LIN
    Later replace with order module
    Only order that is delivered can do review
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Which order?</h1>
        <form action="GetReview">
            <input type="text" name="orderID" />
            <input type="submit" value="submit" />
        </form>
    </body>
</html>
