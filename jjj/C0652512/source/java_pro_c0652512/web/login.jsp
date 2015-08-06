<%-- 
    Document   : login
    Created on : 3-Aug-2015, 11:45:45 AM
    Author     : Harry89
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <title>Untitled Document</title>
                    <style type="text/css">
                        <!--
                        body {
                            background-color: #F4F4F4;
                        }
                        body,td,th {
                            font-family: Verdana, Arial, Helvetica, sans-serif;
                        }
                        a:link {
                            text-decoration: none;
                            color: #465799;
                        }
                        a:visited {
                            text-decoration: none;
                        }
                        a:hover {
                            text-decoration: underline;
                            color: #008080;
                        }
                        a:active {
                            text-decoration: none;
                        }
                        a {
                            font-size: small;
                            font-weight: bold;
                        }
                        .style1 {
                            color: TEAL;
                            font-weight: bold;
                            font-size: x-large;
                        }
                        -->
                    </style>

                    <link rel="stylesheet" href="Utilities/style.css"  />
                </head>
                <body>
                    <div align="center"><span class="style1">Rent - A - Car</span><BR />
                        <BR/><BR/><hr>

                            <a href="index.jsp" target="_parent">BACK</a>
                            
                            <form name="form1" method="post" action="loginAction.jsp" target="_parent">
                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="2">
                                    <tr class="flbl">
                                        <td colspan="2" align="center">
                                            User ID : <input type="text" name="uname" id="uname" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            Password : <input type="password" name="passwd" id="passwd" /> 
                                            <input type="submit" class="fbut" id="b" name="b" value="ACCESS"/>
                                        </td>
                                    </tr>
                                    <tr class="glbl" style="background: mintcream">
                                        <td colspan="2" align="center" style="color:rosybrown">
                                            <%
                                                if (request.getParameter("msg") != null && request.getParameter("msg").equals("-1")) {
                                                    out.print("User ID or Password does not match !");
                                                }
                                                if (request.getParameter("msg") != null && request.getParameter("msg").equals("0")) {
                                                    out.print("Valid User ID and Password are required !");
                                                }
                                            %>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            </body>
                            </html>
