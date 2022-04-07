<%-- retrieve selected item code --%>
<%
   int prod_id = Integer.parseInt(request.getParameter("prod_id"));
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("button");
%>

<%-- redorect to SearchItem servlet --%>
<%
  session.setAttribute("prod_id", prod_id);
  session.setAttribute("button", button);
  response.sendRedirect("../../SearchModifyProduct");
%>
