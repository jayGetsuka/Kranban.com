<%-- 
    Document   : TypeQuestion
    Created on : Aug 28, 2021, 10:02:00 AM
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
        <title>TypeQuestion</title>
    </head>
    <body>
         <jsp:include page="navbarWeb.jsp"  />
         <%
                
                //HttpSession sessionsa = request.getSession(false);
                User user = (User) session.getAttribute("user");
                String type = (String) session.getAttribute("type");
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
                            "select QtID, QtText, QtType, Datetime from question where QtType = ? ;");
                    ps.setString(1, type);
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
