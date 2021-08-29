/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

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
import model.DatabaseConnection;
import model.User;

/**
 *
 * @author User
 */
@WebServlet(name = "Delete", urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

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
            HttpSession sessions = request.getSession();
            User user = (User) sessions.getAttribute("user");
            int idquestion = Integer.valueOf(request.getParameter("idquest"));
            Connection con = DatabaseConnection.initializeDatabase();
             PreparedStatement st = con.prepareStatement("DELETE FROM question WHERE QtID = ? ;");

            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            // Same for second parameter
            st.setInt(1, idquestion);
            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.execute();
            // Close all the connections
            st.close();
            
            PreparedStatement st1 = con.prepareStatement("DELETE FROM answer WHERE questID = ?;");

            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            // Same for second parameter
            st1.setInt(1, idquestion);
            // Execute the insert command using executeUpdate()
            // to make changes in database
            st1.execute();
            // Close all the connections
            st1.close();
            
            con.close();
            request.getRequestDispatcher("QuestionMe.jsp").forward(request, response);
    }catch(Exception e){
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
