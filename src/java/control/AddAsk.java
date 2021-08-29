/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import model.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/AddAsk"})
public class AddAsk extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            // Create a SQL query to insert data into demo table
            
            // demo table consists of two columns, so two '?' is used
             HttpSession session= request.getSession();
             User user = (User) session.getAttribute("user");
            int id = (int) user.getId();
            PreparedStatement st = con
                    .prepareStatement("insert into question (QtID,QtText,QtType,questUserID) values(?, ?, ?, ?)");

            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            // Same for second parameter
            st.setInt(1, 0);
            st.setString(2, String.valueOf(request.getParameter("ask")));
            st.setString(3, String.valueOf(request.getParameter("type")));
            st.setInt(4, id);


            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();
            // Close all the connections
            st.close();
            con.close();
            
            
           try{ PrintWriter out = response.getWriter();
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>success</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<script>alert(\"Insert Success \")</script>");
            out.println("</body>");
            out.println("</html>");
            request.getRequestDispatcher("Addask.jsp").forward(request, response);
           }catch (Exception ex){
               ex.printStackTrace();
           }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
