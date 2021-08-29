<%-- 
    Document   : editInformation
    Created on : Jul 13, 2021, 1:19:47 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%@page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>register</title>
</head>
<body style="background-color:#00C9A7;">
    <jsp:include page="navbarWeb.jsp" ></jsp:include>
    <div class="container">
        <%
        //HttpSession sessionsa = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String fname = (String) user.getFname();
        String lname = (String) user.getLname();
        String email = (String) user.getEmail();
        %>
        <h2>แก้ไขข้อมูลส่วนตัว</h2>
        <form action="editServlet" method="post">
            <table class="tb_center">
                <tr>
                    <td><label for="fname">First name: </label></td>
                    <td><input type="text" name="fname" value="<%= fname %>"></td>
                </tr>
                <tr>
                    <td><label for="lname">Last name: </label></td>
                    <td><input type="text" name="lname" value="<%= lname %>"></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" name="email" value="<%= email %>"></td>
                </tr>
            </table>
            <button type="submit" style="position: absolute; left: 40%;">Edit</button>
        </form>
    </div>
    </body>
</html>
