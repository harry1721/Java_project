<%-- 
    Document   : cus_regis
    Created on : 5-Aug-2015, 9:38:39 AM
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
                a:link {
                 background-color: #0000;
}
                
                
            }
            #v{
                width: 100px;
                height: 100px;
                background-color: black;
                font:white;
                
            }
            </style>
    </head>
    <body>
         <div id="d">
            <h1 text-align="center">  Customer Registration</h1>
        <form action="signup" method="post">
    Your name<br>
    <input type="text" name="NAME" placeholder="Name"><br>
     Password<br>
    <input type="text" name="PASS" placeholder="Name"><br>
    Password<br>
    <input type="text" name="CPASS" placeholder="Name"><br>
      Contact Number<br>
    <input type="text" name="CON" placeholder="Name"><br>
    
    <input type="submit" value="Submit"><br><br>
    <a href="cus_login.jsp"> Click Here if already registered</a>
    
</form>
            
            ${error}
            
            
        
        
    </body>
</html>
