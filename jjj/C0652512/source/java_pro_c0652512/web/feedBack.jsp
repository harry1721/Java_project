<%-- 
    Document   : feedBack
    Created on : 3-Aug-2015, 11:26:45 AM
    Author     : Harry89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rent-A-Car</title>
        <style>
            #d{
                font-size: 20px;
                border:2px solid silver;
                padding: 20px;
                background-color: lightblue;
                padding-left:50px; 
                
                
            }
            </style>
    </head>
    <body>
        <div id="d">
            <h1 text-align="center">  Feed Back Form</h1>
        <form action="MailsenderServlets" method="post">
    Your name<br>
    <input type="text" name="f_name" placeholder="Name"><br>
    Your e-mail<br>
    <input type="text" name="f_email" placeholder="Email"><br>
    Message<br>
    <textarea rows="7" cols="40" name="f_message" placeholder="Message"></textarea><br><br>
    <input type="submit" value="Send">
    <input type="reset" value="Clear">
</form>
            </div>
    </body>
</html>
