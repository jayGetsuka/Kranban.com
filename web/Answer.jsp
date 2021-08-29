<%-- 
    Document   : Answer
    Created on : Jul 15, 2021, 2:43:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AddAsk</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <jsp:include page="navbarWeb.jsp" ></jsp:include>
        <form action="Typequestion" method="post" style="position: relative; left: 80%;">
            <label for="type" style="font-family: Kanit;">หมวดหมู่</label>
                <select name="type" required style="padding: 3px; border-radius: 5px; font-family: Kanit;">
                    <option value="science">วิทยาศาสตร์</option>
                    <option value="math">คณิตศาสตร์</option>
                    <option value="health education">สุขศึกษา</option>
                    <option value="thai">ภาษาไทย</option>
                    <option value="english">อังกฤษ</option>
                    <option value="gymnastics">พลศึกษา</option>
                    <option value="career">การงานอาชีพ</option>
                    <option value="technology">เทคโนโลยี</option>
                    <option value="general">ทั่วไป</option>
                </select>
                <button type="submit">เลือก</button>
            
        </form>
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
                            "select QtID, QtText, QtType, Datetime from question");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {

            %>
            <div>
                <h5><%= rs.getString("QtText")%></h5>
                <p>หมวด <%= rs.getString("QtType")%></p>
                <p>โพสต์เมื่อ <%= rs.getString("Datetime")%></p>
                <%
                    PreparedStatement ps1 = con.prepareStatement("SELECT TextAnswer , Firstname FROM answer INNER JOIN user ON answer.answerUserID = user.ID WHERE answer.questID = ? ;");
                    ps1.setInt(1, rs.getInt("QtID"));
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        
                    
                %>
                <p>ความคิดเห็นจาก <%= rs1.getString("Firstname") %></p>
                <div style="width:auto;
                height:auto;
                background-color:gray;
                color:white;
                border-radius: 5px;
                margin:10px;
                border:2px solid white;
                padding:5px;">
                    <p style="font-family: Kanit;"><%= rs1.getString("TextAnswer") %></p>
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

