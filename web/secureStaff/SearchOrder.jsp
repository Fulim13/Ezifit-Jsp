<%-- 
    Document   : SearchOrder
    Created on : Mar 23, 2022, 2:12:36 PM
    Author     : User
--%>

<%-- retrieve selected order id --%>
<%
   int orderID = Integer.parseInt(request.getParameter("orderID"));
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("button");
%>

<%-- redorect to SearchOrder servlet --%>
<%
  session.setAttribute("orderID", orderID);
  session.setAttribute("button", button);
  response.sendRedirect("../SearchOrder");
%>
