<%-- 
    Document   : SearchProductSales
    Created on : Mar 25, 2022, 12:23:32 PM
    Author     : User
--%>

<%-- retrieve selected order id --%>
<%--
<%
   String category = request.getParameter("category");
   String selection = request.getParameter("selection");
%>
--%>
<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("button");
%>

<%-- redorect to SearchOrder servlet --%>
<%
  session.setAttribute("button", button);
  response.sendRedirect("../SearchProductSales");
%>

