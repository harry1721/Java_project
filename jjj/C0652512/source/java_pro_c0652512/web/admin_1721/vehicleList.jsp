<%-- 
    Document   : vechicleList
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%//check session
        if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { //session valid

%>
<%
        try {
            //v_name, v_code, v_owner, v_owner_contact, v_owner_email, v_owner_address
            Connection con = new Mysql_Connector().getCon();
            String query = "select * from v_table "; //query
            int t = 0;
            String vname = "";
            String vcode = "";
            String vowner = "";

            if (request.getParameter("vName") != null) {   //check vehicle name value
                vname = request.getParameter("vName");
            }
            if (request.getParameter("vCode") != null) { //check vehicle code value
                vcode = request.getParameter("vCode");
            }
            if (request.getParameter("ownerName") != null) { //check owner name value
                vowner = request.getParameter("ownerName");
            }

            if (vname != null && !vname.equals("") || vowner != null && !vowner.equals("") || vcode != null && !vcode.equals("")) {
                query += " where ";
            }

            if (vname != null && !vname.equals("")) { //if search by customer name or with sales date
                query += (t == 0) ? " v_name like  '%" + vname + "%'" : " and v_name like  '%" + vname + "%'";
                ++t;
            }
            if (vowner != null && !vowner.equals("")) { //if search by customer name or with sales date
                query += (t == 0) ? " v_owner like  '%" + vname + "%'" : " and v_owner like  '%" + vowner + "%'";
                ++t;
            }

            if (vcode != null && !vcode.equals("")) {   //if search by vehicle code
                query += (t == 0) ? " v_code='" + vcode + "'" : " and v_code='" + vcode + "'";
                ++t;
            }
            query += " order by v_name";
            PreparedStatement ps = con.prepareStatement(query); //prepare the query statement
            ResultSet rs = ps.executeQuery();   //execute the query
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VHIS</title>
        <link rel="stylesheet" href="../Utilities/style.css"  />
    </head>
    <body>
        <center>
        <h3 class="fhdr">LIST OF VEHICLES</h3>
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="2">

            <tr class="ghdr" align="center">
                <td>S.N.</td>
                <td>Vehicle Name</td>
                <td>Vehicle No.(Code)</td>
                <td>Owner</td>
                <td>Address</td>
                <td>Contact</td>

            </tr>
            <%

    int sn = 1;
    while (rs.next()) {%>
            <tr class="glbl">
                <td align="center"><%=sn++%></td>

                <td><%=rs.getString("v_name")%></td>
                <td><%=rs.getString("v_code")%></td>
                <td align="center"><%=rs.getString("v_owner")%></td>
                <td align="left"><%=rs.getString("v_owner_address")%></td>
                <td><%=rs.getString("v_owner_contact")%></td>

            </tr>
            <%}%>
        </table>

    </body>
</html>
<%} catch (Exception e) {
            out.print(e.toString());
        }%>
<%} else { //session failed
            response.sendRedirect("../index.html?msg=403");
        }
%>