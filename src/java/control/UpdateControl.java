/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hoan6
 */
@WebServlet(name="UpdateControl", urlPatterns={"/update"})
public class UpdateControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String image = request.getParameter("image");
    double price = Double.parseDouble(request.getParameter("price"));
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    int category = Integer.parseInt(request.getParameter("category"));

    // In ra để kiểm tra dữ liệu
    System.out.println("ID: " + id);
    System.out.println("Name: " + name);
    System.out.println("Image: " + image);
    System.out.println("Price: " + price);
    System.out.println("Title: " + title);
    System.out.println("Description: " + description);
    System.out.println("Category: " + category);

    DAO dao = new DAO();
    dao.updateProduct(id, name, image, price, title, description, category);

    response.sendRedirect("product-list"); // Chuyển hướng sau khi cập nhật
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
