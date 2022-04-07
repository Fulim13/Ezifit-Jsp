<%-- 
    Document   : SearchRating
    Created on : Mar 23, 2022, 8:01:53 PM
    Author     : User
--%>

<%-- retrieve selected order id --%>
<%
   int reviewID = Integer.parseInt(request.getParameter("reviewID"));
%>

<%-- redorect to SearchOrder servlet --%>
<%
  session.setAttribute("reviewID", reviewID);

  response.sendRedirect("../SearchRating");
%>

