<%
    session.removeAttribute("useremail");
    response.sendRedirect("index.jsp");
%>