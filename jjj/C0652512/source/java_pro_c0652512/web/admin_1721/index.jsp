<%-- 
    Document   : index
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>


<%//check session
    if (request.getSession().getAttribute("utype") != null && request.getSession().getAttribute("utype").equals("admin")) { //session valid

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>RENT-A-CAR</title>
        <link rel="stylesheet" href="common/style.css"  />
    </head>

    <frameset  background="Utilities/bck.jpg" rows="100,*,30" framespacing="1" frameborder="yes" border="1">
        <frame  src="top.html" name="topFrame" scrolling="No" noresize="noresize" class="border" id="topFrame" title="topFrame" />
        <frame src="main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
        <frame src="../common-bot.html" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
    </frameset>
   <body background="Utilities/bck.jpg" >
        </body>
    </html>
<%} else { //session failed
        response.sendRedirect("../index.html?msg=403");
    }
%>