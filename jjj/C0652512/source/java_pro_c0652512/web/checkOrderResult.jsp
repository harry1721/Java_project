<%-- 
    Document   : checkOrderResult
    Created on : 3-Aug-2015, 8:30:48 PM
    Author     : Harry89
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.io.*, Main_pacakage.*"%>
<%
    if (request.getParameter("vhOrderNo") != null && !request.getParameter("vhOrderNo").equals("")) {
        String vhOrderNo = request.getParameter("vhOrderNo");

        try {
            Connection con = new Mysql_Connector().getCon();
            String query = "select * from c_v_view where c_order_no=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, vhOrderNo);
            ResultSet rs = ps.executeQuery();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Utilities/style.css"  />
    </head>
    <body><center>
        <h3 class="fhdr">VEHICLE ORDER STATUS</h3>

        <%if(rs.next()){%>
        <table width="60%" border="0" align="center" cellpadding="1" cellspacing="2" class="border">
<tr>
                <td colspan="4" align="center" valign="middle"><a href="checkOrder.jsp" class="ghdr">BACK</a></td>
            </tr>
            <tr class="flbl">
                <td align="right">Order Number : </td>
              <td><%=rs.getString("c_order_no")%></td>
                <td>Status</td>
                <td>
                    <%if(rs.getInt("c_hire_status")==1){%><label class="flbl" style="color:green">CONFIRMED</label><%}%>
                    <%if(rs.getInt("c_hire_status")==-1){%><label class="flbl" style="color:red">REJECT</label><%}%>
                    <%if(rs.getInt("c_hire_status")==0){%><label class="flbl" style="color:orangered">PENDING</label><%}%>
                </td>
            </tr>
            <tr class="glbl">
                <td align="right" > Customer Name : </td>
              <td colspan="3"><%=rs.getString("c_name")%></td>
            </tr>
            <tr class="glbl">
                <td align="right">Vehicle : </td>
              <td colspan="3"><%=rs.getString("v_name")%></td>
            </tr>
            <tr class="glbl">
                <td align="right">Vehicle Owner : </td>
              <td colspan="3"><%=rs.getString("v_owner")%></td>
            </tr>
            <tr class="glbl">
                <td align="right">Vehicle Owner Contact Details : </td>
              <td colspan="3"><%=rs.getString("v_owner_contact")%> / <%=rs.getString("v_owner_email")%></td>
            </tr>
            <tr class="glbl">
                <td align="right">Vehicle is for : </td>
              <td colspan="3"><%=rs.getString("c_hire_rem")%></td>
            </tr>
            <tr class="glbl">
                <td align="right">Date / Time for Hiring : </td>
              <td colspan="3"><%=rs.getString("c_hire_date")%> / <%=rs.getString("c_hire_time")%></td>
            </tr>
            
        </table>
        <%}else{
            %>
            <center class="errmsg">No Records Found !</center>
        <%
        }%>
    </center>
</body>
</html>
<%} //end of try
        catch (Exception e) {
            out.print("Exception Occured!" + e.toString());
        }
    } //end of if 
    else {
        response.sendRedirect("checkOrder.jsp?msg=-1");
    }%>