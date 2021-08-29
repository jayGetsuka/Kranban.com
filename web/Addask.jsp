<%-- 
    Document   : Addask
    Created on : Jul 13, 2021, 12:07:27 PM
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
        <title>AddAsk</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body style="background-color:#b7c6cb;">
        <script>
            function AddQuestion() {
                alert("Add success!!! ");
            }
        </script>
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
                   สวัสดีครับคุณ  <%= fname%>  <%= lname%>
                </span>

                <a class="nav-link" href="editInformation.jsp">แก้ไขข้อมูลส่วนตัว</a>

                <a class="nav-link" href="Logout">LOG OUT</a>
            </div>
        </nav>
        <div class="container" style="background-color:#F8F5F1; color:black;margin-top:50px;border:2px solid #b7c6cb;">
            <h2>คำถาม</h2>
            <form action="AddAsk" method="post">
                <label for="ask">คำถาม</label><br>
                <textarea name="ask" cols="38" rows="10" required style="background-color:white;font-family:Kanit;padding: 5px; border-radius: 5px;" placeholder="ใส่คำถาม...."></textarea>
                <label for="type">หมวดหมู่</label><br>
                <select name="type" required>
                    <option value="science">วิทยาศาสตร์</option>
                    <option value="math">คณิตศาสตร์</option>
                    <option value="health education">สุขศึกษา</option>
                    <option value="thai">ภาษาไทย</option>
                    <option value="english">อังกฤษ</option>
                    <option value="gymnastics">พลศึกษา</option>
                    <option value="career">การงานอาชีพ</option>
                    <option value="technology">เทคโนโลยี</option>
                    <option value="general">ทั่วไป</option>
                </select><br>
                <button type="submit" value="submit" class="green" onclick="AddQuestion();">ยืนยัน</button>
            </form>

        </div>


    </body>
</html>
