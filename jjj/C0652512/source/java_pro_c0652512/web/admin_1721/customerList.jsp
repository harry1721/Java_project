<%-- 
    Document   : customerList
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%//check session
    if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { 

%>
<%
    try {
        Connection con = new Mysql_Connector().getCon();
        String query = "select * from c_v_view ";
        int t = 0;
        String stdate = "";
        String endate = "";
        String cname = "";
        int cstatus = -2;
        String orderNo = "";
        if (request.getParameter("stdate") != null) {
            stdate = request.getParameter("stdate");
        }
        if (request.getParameter("endate") != null) {
            endate = request.getParameter("endate");
        }
        if (request.getParameter("cName") != null) {
            cname = request.getParameter("cName");
        }
        if (request.getParameter("cStatus") != null) {
            cstatus = Integer.parseInt(request.getParameter("cStatus"));
        }
        if (request.getParameter("cOrderNo") != null) {
            orderNo = request.getParameter("cOrderNo");
        }
        if (stdate != null && !stdate.equals("") && endate != null && !endate.equals("")
                || cname != null && !cname.equals("") || cstatus != -2 || orderNo != null && !orderNo.equals("")) {
            query += " where ";
        }
        if (stdate != null && !stdate.equals("") && endate != null && !endate.equals("")) { //if sale period not empty
            query += "  c_hire_date BETWEEN '" + stdate + "' and '" + endate + "' ";
            ++t;
        }
        if (cname != null && !cname.equals("")) { //if search by customer name or with sales date
            query += (t == 0) ? " c_name like  '%" + cname + "%'" : " and c_name like  '%"
                    + cname + "%'";
            ++t;
        }
        if (cstatus != -2) {
            query += (t == 0) ? " c_hire_status =" + cstatus
                    + "" : " and c_hire_status =" + cstatus + "";
            ++t;
        }
        if (orderNo != null && !orderNo.equals("")) {
            query += (t == 0) ? " c_order_no='" + orderNo + "'" : " and c_order_no='" + orderNo + "'";
            ++t;
        }
        query += " order by c_name";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../Utilities/style.css"  />
    </head>
    <body>
    <center>
        <h3 class="fhdr">LIST OF CUSTOMER</h3>
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="2">
            <tr class="ghdr" align="center">
                <td>S.N.</td>
                <td>Date/Time</td>
                <td>Name</td>
                <td>Order No.</td>
                <td>Contact</td>
                <td>Remarks</td>
                <td>Status of Hiring</td>
            </tr>
            <%int sn = 1;
                while (rs.next()) {%>
            <tr class="glbl">
                <td align="center"><%=sn++%></td>
                <td><%=rs.getString("c_hire_date")%>[<%=rs.getString("c_hire_time")%>]</td>
                <td><%=rs.getString("c_name")%></td>
                <td align="center"><%=rs.getString("c_order_no")%></td>
                <td align="center"><%=rs.getString("c_contact")%></td>
                <td><%=rs.getString("c_hire_rem")%></td>
                <td>
                    <%if (rs.getInt("c_hire_status") == 1) {%><label class="glbl" style="color:green">CONFIRMED</label><%}%>
                    <%if (rs.getInt("c_hire_status") == -1) {%><label class="glbl" style="color:red">REJECT</label><%}%>
                    <%if (rs.getInt("c_hire_status") == 0) {%><label class="glbl" style="color:orangered">PENDING</label><%}%>
                    <%if (rs.getInt("c_hire_status") == 2) {%><label class="glbl" style="color:blueviolet">COMPLETED</label><%}%>
                </td>
            </tr>
            <%}%>
        </table>

    </body>
</html>
<%} catch (Exception exp) {
        out.print(exp.toString());
    }%>
<%} else { //session failed
        response.sendRedirect("../index.html");
    }
%>