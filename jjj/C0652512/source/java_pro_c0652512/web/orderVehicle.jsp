<%-- 
    AUTHOR: C0652512
    DOCUMENT: JAVA-PROJECT
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%
    String vname = "";
    String vcode = "";
    String vowner = "";
    String vocontact = "";
    if (request.getParameter("vname") != null && request.getParameter("vcode") != null && request.getParameter("vowner") != null
            && request.getParameter("vocontact") != null) {
        vname = request.getParameter("vname");
        vcode = request.getParameter("vcode");
        vowner = request.getParameter("vowner");
        vowner = request.getParameter("vocontact");


%>
<!DOCTYPE html>
<html xmlns:aegis="http://cent.felk.cvut.cz/hci/aegis/DTD/component-visualization.dtd" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RENt-A-CAR</title>
        <link rel="stylesheet" href="Utilities/style.css"  />
        <script src="Utilities/mootools.js" type="text/javascript"></script>
        <script src="Utilities/DatePicker.js" type="text/javascript"></script>
        <link rel="stylesheet" href="Utilities/DatePicker.css">
        <!-- end of required date picker javascript & css files -->
        <script type="text/javascript">


            var myVar = setInterval(function() {
                entime()
            }, 1000);
            function entime() {
                var d = new Date();
                var t = d.toLocaleTimeString();
                document.getElementById("vhtime").value = t;
            }
//]]>
        </script>

    </head>

<body background="Utilities/bck.jpg" onload="entime()"><!-- <aegis:visualization xmlns:aegis="http://cent.felk.cvut.cz/hci/aegis/DTD/component-visualization.dtd" > -->
        <h3 style="text-align: center" class="fhdr">RENT A CAR</h3>
        <form name="form1" method="post" action="ordersheet.jsp">
            <input type="hidden" name="vcode" id="vcode" value="<%=vcode%>" />
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr class="flbl">
                    <td colspan="4" align="center">Vehicle : <%=vname%> [<%=vcode%>]| Owner : <%=request.getParameter("vowner")%> [<%=request.getParameter("vocontact")%>]</td>
                </tr>
                <tr class="flbl" style="background: mintcream">
                    <td colspan="4" align="center" style="color:royalblue">Enter Particulars for the Customer</td>
                </tr>
                <tr>
                    <td colspan="4" align="center">&nbsp;</td>
                </tr>
                <tr class="flbl">
                    <td width="28%" align="right">Date :                        </td>
                    <td width="17%" align="right"><input type="text"  class="DatePicker" name="vhdate" id="vhdate"></td>
                    <td width="7%" align="right">Time : </td>
                    <td width="48%"><input type="text" class="ftxt" name="vhtime" id="vhtime"></td>
                </tr>
                <tr class="flbl">
                    <td colspan="2" align="right">Customer Name : </td>
                    <td colspan="2"><input name="cname" type="text" class="ftxt" id="cname" size="50" maxlength="50"></td>
                </tr>
                <tr class="flbl">
                    <td colspan="2" align="right">Customer Address : </td>
                    <td colspan="2"><input name="caddress" type="text" class="ftxt" id="caddress" size="60" maxlength="55"></td>
                </tr>
                <tr class="flbl">
                    <td colspan="2" align="right">Customer Contact No. : </td>
                    <td colspan="2"><input name="ccontact" type="text" class="ftxt" id="ccontact" size="20" maxlength="12"></td>
                </tr>
                <tr class="flbl">
                    <td colspan="2" align="right">Customer E-mail :</td>
                    <td colspan="2"><input name="cemail" type="text" class="ftxt" id="cemail" size="35" maxlength="30"></td>
                </tr>
                <tr class="flbl">
                    <td colspan="2" align="right">Vehicle is hire for : </td>
                    <td colspan="2"><input name="vhirefor" type="text" class="ftxt" id="vhirefor" size="70" maxlength="60"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" name="button" id="button" class="fbut" value="ORDER"></td>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </form>

        <!-- </aegis:visualization> --></body>
</html>
<%} else {
        response.sendRedirect("vehicleListPublic.jsp");
    }%>