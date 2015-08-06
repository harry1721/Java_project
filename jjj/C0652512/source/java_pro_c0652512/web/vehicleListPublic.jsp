<%-- 
    Document   : customerList
    Created on : 30 Apr, 2013, 11:17:43 PM
    Author     : Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%
    try {
        //v_name, v_code, v_owner, v_owner_contact, v_owner_email, v_owner_address
        Connection con = new Mysql_Connector().getCon();
        String query = "select * from v_table ";
        int t = 0;
        String vname = "";
        String vowner = "";
        
        if (request.getParameter("vName") != null) {
            vname = request.getParameter("vName");
        }
        
        if (request.getParameter("ownerName") != null) {
            vowner= request.getParameter("ownerName");
        }
       
        if (vname != null && !vname.equals("") 
                || vowner != null && !vowner.equals("")) {
            query += " where ";
        }
       
        if (vname != null && !vname.equals("")) { //if search by customer name or with sales date
            query += (t == 0) ? " v_name like  '%" + vname + "%'" : " and v_name like  '%"
                    + vname + "%'";
            ++t;
        }
        if (vowner != null && !vowner.equals("")) { //if search by customer name or with sales date
            query += (t == 0) ? " v_owner like  '%" + vowner + "%'" : " and v_owner like  '%"
                    + vowner + "%'";
            ++t;
        }
       
        
        query += " order by v_name";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Utilities/style.css"  />
    </head>
    <body>
    <center>
        <h3 class="fhdr">CHOOSE YOUR VEHICLES</h3>
           <form action="vehicleListPublic.jsp" method="post" name="qform" id="qform">

            <table width="80%" border="0" align="center" cellspacing="2">

                <tr class="flbl">
                    <td width="17%" align="right">Name of Vehicle : </td>
                    <td width="16%" align="left"><input name="vName" type="text" class="flbl" id="vName" size="45" maxlength="30" /></td>
                </tr>
                <tr class="flbl">
                    <td align="right">Name of Vehicle Owner : </td>
                    <td align="left"><input name="ownerName" type="text" class="flbl" id="ownerName" size="45" maxlength="30" /></td>
                </tr>
                <tr class="flbl">
                    <td align="right"></td>
                    <td align="left">
                        <input type="submit" name="qbut" id="qbut" value="VEHICLE LIST" class="fbut" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">&nbsp;</td>
                </tr>
            </table>
        </form>
  
        <h3 class="fhdr">LIST OF VEHICLES</h3>
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="2">
            
            <tr class="ghdr" align="center">
                <td>S.N.</td>
                <td>Veh. Name</td>
                <td>Veh. No.</td>
                <td>Owner</td>
                <td>Address</td>
                <td>Contact</td>
                <td>Order</td>
                
            </tr>
            <%int sn = 1;
                while (rs.next()) {%>
            <tr class="glbl">
                <td align="center"><%=sn++%></td>
                
                <td><%=rs.getString("v_name")%></td>
                <td><%=rs.getString("v_code")%></td>
                <td align="left"><%=rs.getString("v_owner")%></td>
                <td align="left"><%=rs.getString("v_owner_address")%></td>
                <td><%=rs.getString("v_owner_contact")%></td>
                <td align="center">
                    <form action="orderVehicle.jsp" method="post" name="<%=sn%>oform">
                        <input type="hidden" id="vcode" name="vcode" value="<%=rs.getString("v_code")%>"/>
                        <input type="hidden" id="vname" name="vname" value="<%=rs.getString("v_name")%>"/>
                        <input type="hidden" id="vowner" name="vowner" value="<%=rs.getString("v_owner")%>"/>
                        <input type="hidden" id="vocontact" name="vocontact" value="<%=rs.getString("v_owner_contact")%>"/>
                        <input type="submit" id="b1" name="b1" value="ORDER" class="fbut" />
                    </form>
                   </tr>
            <%}%>
        </table
    </body>
</html>
<%} catch (Exception e) {
        out.print(e.toString());
    }%>