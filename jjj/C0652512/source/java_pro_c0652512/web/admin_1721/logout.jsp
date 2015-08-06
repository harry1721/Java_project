<%-- 
    Document   : logout
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>

<%
    if (request.getSession().getAttribute("utype") != null) {
        request.getSession().invalidate();
        response.sendRedirect("../index.jsp");
    }else{
         response.sendRedirect("../index.jsp");
    }

%>