
<%-- retrieve button that was clicked --%>
<%! static int count_name=0; %>
<%! static int count_dob=0; %>
<%! static int count_register_date=0; %>
<%
   String button = request.getParameter("button");
   if(button.equals("Full Name")){
       count_name++;
   }
   else if(button.equals("Date Of Birth")){
       count_dob++;
   }
   else if(button.equals("Register Date")){
       count_register_date++;
   }
%>

<%-- redorect to SearchItem servlet --%>
<%
    session.setAttribute ("button", button);
    session.setAttribute("count_name", count_name);
    session.setAttribute("count_dob", count_dob);
    session.setAttribute("count_register_date", count_register_date);
    response.sendRedirect ("../sortCustomer");
%>
