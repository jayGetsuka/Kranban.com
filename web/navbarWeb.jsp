<%-- 
    Document   : navbarWeb
    Created on : Aug 25, 2021, 7:41:38 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>navbar</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <%
        //HttpSession sessionsa = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String fname = (String) user.getFname();
        String lname = (String) user.getLname();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html" >KRANBAN.COM</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Addask.jsp" >เพิ่มคำถาม<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Answer.jsp">คำถาม</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="QuestionMe.jsp">คำถามของฉัน</a>
                    </li>
                </ul>
                <span class="navbar-text">
                    <%= fname %>  <%= lname %>
                </span>
                
                <a class="nav-link" href="editInformation.jsp">แก้ไขข้อมูลส่วนตัว</a>
                
                <a class="nav-link" href="Logout">LOG OUT</a>
            </div>
        </nav>
    </body>
</html>
