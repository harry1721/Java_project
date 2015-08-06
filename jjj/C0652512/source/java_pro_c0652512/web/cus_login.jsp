<%-- 
    Document   : cus_login
    Created on : 5-Aug-2015, 9:52:56 AM
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
                a:link {
                 background-color: #0000;
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
        <a href="index.jsp" target="_parent">BACK</a>
         <div id="d">
            <h1 text-align="center"> Customer  Login</h1>
        <form action="Clogin_ser" method="post">
    Name<br>
    <input type="text" name="cus_n" placeholder="Name"><br>
     Password<br>
    <input type="text" name="cus_p" placeholder="Password    "><br>
      
    
    <input type="submit" value="Submit"><br><br>
    
    
</form>
            
                ${error}
               
    </body>
</html>
