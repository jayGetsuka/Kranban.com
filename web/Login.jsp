<%-- 
    Document   : Login
    Created on : Jul 15, 2021, 1:20:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body class="bg_image">
    <h1 class="title" style="color:#2060e8;">KRANBAN.COM</h1>
    <div class="container-login">
        <h2>Login</h2>

        <form method="post" action="LoginServlet">
        <label for="user"> ชื่อผู้ใช้ </label><br>
        <input type="text" name="user" required ><br>
        <label for="password"> รหัสผ่าน </label><br>
        <input type="password" name="passwd" required><br>
        <button type="submit" value="Login">Login</button>
        </form>

        <p class="signup">Or sign up Using <a href="register.html" class="login">Sign up</a></p>
        
    </div>
    

    
</body>
</html>

