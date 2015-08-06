<%-- 
    Document   : vechicleEntry
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%//check session
    if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { //session valid

%>
<%
    try {
        Connection con = new Mysql_Connector().getCon();
        String query = "select * from v_table ";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RENT-A-CAR</title>
        <link rel="stylesheet" href="../Utilities/style.css"  />
    </head>
    <body>
    <center>
        <h3 class="fhdr">CAR ENTRY/REGISTRATION</h3>
        <form name="form1" method="post" action="vehicleEntryAction.jsp">
            <table class="bck" width="80%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr class="flbl">
                    <td colspan="4" align="center">&nbsp;</td>
                </tr>
                <tr class="flbl">
                    <td width="14%" align="right">Vehicle : </td>
                    <td width="40%"><label>
                            <input class="flbl" name="vName" type="text" id="vName" size="40" maxlength="35">
                        </label></td>
                    <td width="18%" align="right">Vehicle No.[Code] : </td>
                    <td width="28%"><input class="flbl" name="vCode" type="text" id="vCode" size="25" maxlength="12"></td>
                </tr>
                <tr class="flbl">
                    <td align="right">Vehicle Owner : </td>
                    <td><input class="flbl" name="vOwner" type="text" id="vOwner" size="45" maxlength="40"></td>
                    <td align="right">Owner Contact : </td>
                    <td><input class="flbl" name="ownerContact" type="text" id="ownerContact" size="25" maxlength="12"></td>
                </tr>
                <tr class="flbl">
                    <td align="right">Owner Address : </td>
                    <td><input class="flbl" name="ownerAddress" type="text" id="ownerAddress" size="50" maxlength="45"></td>
                    <td align="right">Email : </td>
                    <td><input class="flbl" name="ownerEmail" type="text" id="ownerEmail" size="30" maxlength="30"></td>
                </tr>
                <tr>
                    <td align="right">

                    </td>
                    <td align="right">&nbsp;<input class="fbut" type="submit" name="ventrybut" id="ventrybut" value="ADD">
                        <input class="fbut" type="reset" name="vresetbut" id="vresetbut" value="RESET"></td>
                    <td align="right">&nbsp;</td>
                    <td>&nbsp;</td>
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
                <td>E-mail</td>
                <td></td>
            </tr>
            <%int sn = 1;
                while (rs.next()) {%>
            <form action="vehicleEditAct.jsp" method="post" name="veditform<%=sn%>" id="veditform<%=sn%>">
                <tr class="glbl">
                    <td align="center"><%=sn++%></td>

                    <td align="center"><input type="text" class="glbl" maxlength="40" id="vname" name="vname" value="<%=rs.getString("v_name")%>" /></td>
                    <td align="center"><input type="text" readonly size="10" maxlength="12" class="glbl" id="vcode" name="vcode" value="<%=rs.getString("v_code")%>" /></td>
                    <td align="center"><input type="text" maxlength="40" class="glbl" id="vowner" value="<%=rs.getString("v_owner")%>" name="vowner" /></td>
                    <td align="center"><input type="text" maxlength="40" class="glbl" id="voaddress" value="<%=rs.getString("v_owner_address")%>" name="voaddress" /></td>
                    <td align="center"><input type="text" size="12" maxlength="12" class="glbl" id="vocontact" name="vocontact" value="<%=rs.getString("v_owner_contact")%>" /></td>
                    <td align="center"><input type="text" maxlength="30" class="glbl" id="voemail" name="voemail" value="<%=rs.getString("v_owner_email")%>" /></td>
                    <td align="center"><input type="submit" class="glbl" id="ubut" name="ubut" value="UPDATE" /></td>
                </tr>
            </form>
            <%}%>
        </table>
        <%} catch (Exception e) {
                out.print(e.toString());
            }%>
    </CENTER>
</body>
</html>
<%} else { //session failed
  response.sendRedirect("../index.html");
    }
%>