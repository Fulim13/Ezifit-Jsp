<%-- retrieve selected item code --%>
<%
   int staff_id = Integer.parseInt(request.getParameter("staff_id"));
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("button");
%>

<%-- redorect to SearchItem servlet --%>
<%
  session.setAttribute("staff_id", staff_id);
  session.setAttribute("button", button);
  response.sendRedirect("../../SearchStaff");
%>
