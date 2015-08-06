<%-- 
    Document   : vechicleEntryAction
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%//check session
    if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { 

%>
<%

    //v_name, v_code, v_owner, v_owner_contact, v_owner_email, v_owner_address
    if (request.getParameter("vName") != null && request.getParameter("vCode") != null && request.getParameter("vOwner") != null
            && request.getParameter("ownerContact") != null && request.getParameter("ownerAddress") != null && request.getParameter("ownerEmail") != null) {
        //after checking the form parameters, get the form fields
        String vname = request.getParameter("vName");
        String vcode = request.getParameter("vCode");
        String vowner = request.getParameter("vOwner");
        String ownercontact = request.getParameter("ownerContact");
        String owneraddress = request.getParameter("ownerAddress");
        String owneremail = request.getParameter("ownerEmail");

        try {
            
            Connection con = new Mysql_Connector().getCon(); 
            //insert record query
            String query = "insert into v_table (v_name, v_code, v_owner, v_owner_contact, v_owner_email, v_owner_address) values (?, ?, ?, ?, ?, ?)";
            //prepare the query
            PreparedStatement ps=con.prepareStatement(query);
            //set the values
            ps.setString(1, vname);
            ps.setString(2, vcode);
            ps.setString(3, vowner);
            ps.setString(4, ownercontact);
            ps.setString(5, owneremail);
            ps.setString(6, owneraddress);
            ps.executeUpdate(); //execute update
            response.sendRedirect("vehicleEntry.jsp?msg=1"); //redirect to entry page 
        } catch (Exception e) {
            //return something
            response.sendRedirect("vehicleEntry.jsp?msg=-1");//redirect to entry page 
        }
    } else {
        response.sendRedirect("vehicleEntry.jsp?msg=0");
    }%>
<%} else { //session failed
        response.sendRedirect("../index.html?msg=403");
    }
%>