
package control;

import dao.DAO;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ProductAccessDataControl", urlPatterns = {"/product-access-data"})
public class ProductAccessDataControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        
        if (a == null || (a.getRoleID() != 2 && a.getRoleID() != 3)) {
            response.sendRedirect("login");
            return;
        }
        
        // Get the product access data
        DAO dao = new DAO();
        request.setAttribute("mostClickedProducts", dao.getMostClickedProducts(50));
        
        // Forward to the JSP
        request.getRequestDispatcher("productAccessData.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}