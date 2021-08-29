<%-- 
    Document   : QuestionMe
    Created on : Aug 25, 2021, 7:39:45 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuestionMe</title>
        <link rel="stylesheet" href="style.css" type="text/css">
        <style>
            .delete{
                color: white;
                background-color: red;
                margin-top: 0px;
                position:relative;
                left:75%;
                top:0% }
            .delete:hover{
                color: white;
                background-color: black;
                margin-top: 0px;
                position:relative;
                left:75%;
                top:0%}  
            </style>
        </head>
        <body>
            <jsp:include page="navbarWeb.jsp"  />
            <%
                //HttpSession sessionsa = request.getSession(false);
                User user = (User) session.getAttribute("user");
                int id = user.getId();
            %>
            <div class="grid-display">
            <%
                try {
                    String dbDriver = "com.mysql.cj.jdbc.Driver";
                    String dbURL = "jdbc:mysql:// localhost:3333/";
                    // Database name to access
                    String dbName = "kranban?characterEncoding=UTF-8";
                    String dbUsername = "root";
                    String dbPassword = "";

                    Class.forName(dbDriver);
                    Connection con = DriverManager.getConnection(dbURL + dbName,
                            dbUsername,
                            dbPassword);

                    PreparedStatement ps = con.prepareStatement(
                            "select QtID, QtText, QtType, Datetime from question where questUserID = ?");
                    ps.setInt(1, id);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {

            %>
            <div>
                <form action="Delete" method="post">
                    <input type="hidden" name="idquest" value="<%= rs.getString("QtID")%>">
                    <button type="submit" class="delete">ลบคำถาม</button>
                </form>
                <h5><%= rs.getString("QtText")%></h5>
                <p>หมวด <%= rs.getString("QtType")%></p>
                <p>โพสต์เมื่อ <%= rs.getString("Datetime")%></p>
                <%
                    PreparedStatement ps1 = con.prepareStatement("SELECT TextAnswer , Firstname FROM answer INNER JOIN user ON answer.answerUserID = user.ID WHERE answer.questID = ? ;");
                    ps1.setInt(1, rs.getInt("QtID"));
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                %>
                <p>ความคิดเห็นจาก <%= rs1.getString("Firstname")%></p>
                <div style="width:auto;
                     height:auto;
                     background-color:gray;
                     color:white;
                     border-radius: 5px;
                     margin:10px;
                     border:2px solid white;
                     padding:5px;">
                    <p style="font-family: Kanit;"><%= rs1.getString("TextAnswer")%></p>
                </div>
                <%
                    }
                %>
                <form action="Answer" method="post">
                    <input type="hidden" name="id" value="<%= rs.getString("QtID")%>">
                    <textarea name="answer" cols="45" rows="3" class="answer" placeholder="ตอบ...."></textarea>
                    <button type="submit" class="green">ตอบ</button>
                </form>


            </div>

            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </body>
</html>
