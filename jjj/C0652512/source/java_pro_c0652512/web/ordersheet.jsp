<%-- 
  
    AUTHOR: C0652512
    DOCUMENT: JAVA-PROJECT
    

--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%
    String vcode = "";
    String cname = "";
    String caddress = "";
    String ccontact = "";
    String cemail = "";
    String vhdate = "";
    String vhtime = "";
    String chirefor = "";
    if (request.getParameter("cname") != null && request.getParameter("caddress") != null
            && request.getParameter("ccontact") != null && request.getParameter("cemail") != null
            && request.getParameter("vcode") != null && request.getParameter("vhirefor") != null
            && request.getParameter("vhdate") != null && request.getParameter("vhtime") != null) {
        cname = request.getParameter("cname");
        vcode = request.getParameter("vcode");
        caddress = request.getParameter("caddress");
        ccontact = request.getParameter("ccontact");
        chirefor = request.getParameter("vhirefor");
        cemail = request.getParameter("cemail");
        vhdate = request.getParameter("vhdate");
        vhtime = request.getParameter("vhtime");
        //
        Random r = new Random();
        String orderNo = "VHIS" + r.nextInt();
        //Database transaction
        try {
            Connection con = new Mysql_Connector().getCon();
            String query = "insert into c_table (c_code, c_name, c_address, c_contact, c_email,  c_hire_rem, c_hire_status, c_v_code, c_hire_date, c_hire_time,"
                    + " c_order_no) ( select max(c_code)+1, ?, ?, ?, ?, ?, 0, ?, ?, ?, ? from c_table)";

            PreparedStatement ps = con.prepareStatement(query);
           
            ps.setString(1, cname);
            ps.setString(2, caddress);
            ps.setString(3, ccontact);
            ps.setString(4, cemail);
            ps.setString(5, chirefor);
            ps.setString(6, vcode);
            ps.setString(7, vhdate);
            ps.setString(8, vhtime);
            ps.setString(9, orderNo);
            

            
            ps.executeUpdate();

        } catch (Exception e) {
            out.print("Exception Occured ! "+e.toString());
        }

%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RENT-A-CAR</title>

        <link rel="stylesheet" href="Utilities/style.css"  />
    </head>
    <body><center>
        <h3 class="fhdr">YOUR ORDER NUMBER : <%=orderNo%></h3>
        <label class="flbl">Check Your Vehicle Order Status by using Your Order Number</label>
    </center>
</body>
</html>
<%} else {
        response.sendRedirect("vehicleListPublic.jsp?msg=-2&"+request.getParameter("chirefor"));
    }%>