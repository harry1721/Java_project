
<%-- 
    Document   : vehicleEditAction
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%//check session
    if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { //session valid

%>
<%

    
    if (request.getParameter("vname") != null && request.getParameter("vcode") != null && request.getParameter("vowner") != null
            && request.getParameter("vocontact") != null && request.getParameter("voaddress") != null && request.getParameter("voemail") != null) {
        String vname = request.getParameter("vname");
        String vcode = request.getParameter("vcode");
        String vowner = request.getParameter("vowner");
        String ownercontact = request.getParameter("vocontact");
        String owneraddress = request.getParameter("voaddress");
        String owneremail = request.getParameter("voemail");

        try {
            //database connection
            Connection con_2 = new Mysql_Connector().getCon();
            //query for update
            String query = "update v_table set v_name=?, v_owner=?, v_owner_contact=?, v_owner_email=?, v_owner_address=? where v_code=?";
            //prepare the statement
            PreparedStatement ps=con_2.prepareStatement(query);
            //set the values
            ps.setString(1, vname);
//            ps.setString(2, vcode);
            ps.setString(2, vowner);
            ps.setString(3, ownercontact);
            ps.setString(4, owneremail);
            ps.setString(5, owneraddress);
            ps.setString(6, vcode);
            ps.executeUpdate(); //execute
            response.sendRedirect("vehicleEntry.jsp?msg=1");
        } catch (Exception e) {
            //return something
            response.sendRedirect("vehicleEntry.jsp?msg=-1");
        }
    } else {
        response.sendRedirect("vehicleEntry.jsp?msg=0");
    }%>
<%} else { //session failed
        response.sendRedirect("../index.html?msg=403");
    }
%>