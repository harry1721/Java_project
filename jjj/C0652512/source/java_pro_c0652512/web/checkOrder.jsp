
<%-- 
    Document   : checkOrder
    Created on : 3-Aug-2015, 8:22:48 PM
    Author     : Harry89
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.io.*, Main_pacakage.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rent-A-Car</title>
        <link rel="stylesheet" href="Utilities/style.css"  />
    </head>
    <body>
    <center>
        <h3 class="fhdr">CHECK YOUR VEHICLE BELOW</h3>
        <form action="checkOrderResult.jsp" method="post" name="coform">
            <label class="flbl">Order Id : </label><input type="input" name="vhOrderNo" id="vhOrderNo" class="flbl" maxlength="20" size="15" />
            <input class="fbut" type="submit" name="cobut" id="cobut" value="Go.." /><br></br>
            <a href="index.jsp"> Back</a>
        </form>
    </center>
</body>
</html>
