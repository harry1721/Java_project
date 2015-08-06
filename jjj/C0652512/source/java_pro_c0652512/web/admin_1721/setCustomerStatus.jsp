

<%-- 
    Document   : setCustomerStatus
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%
    if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { 

%>
<!DOCTYPE html>
<%String ccode = "";
    String status = "";
    if (request.getParameter("cCode") != null && request.getParameter("status") != null
            && !request.getParameter("cCode").equals("") && !request.getParameter("status").equals("")) {
        ccode = request.getParameter("cCode");
        status = request.getParameter("status");
        
        try {
            //get database connection
            Connection con = new Mysql_Connector().getCon();
            //update query
            String query = "update c_table set c_hire_status=? where c_code=?";
            //prpepare statement
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(status));
            ps.setString(2, ccode);
            ps.executeUpdate(); //execute 
            response.sendRedirect("customerCheck.jsp?msg=1");
        } catch (Exception e) {
            out.print("Exception Occured ! "+e.toString());
        }
    }//end of if 
    else {
        response.sendRedirect("customerCheck.jsp?msg=-1");
    }%>
<%} else { //session failed
       response.sendRedirect("../index.html?msg=403");
    }
%>