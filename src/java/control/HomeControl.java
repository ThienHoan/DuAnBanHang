package control;

import dao.DAO;
import entity.Category;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {

    // Khởi tạo DAO để truy vấn database
    DAO dao = new DAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy danh sách tất cả sản phẩm
        List<Product> list = dao.getAllProduct();
        request.setAttribute("listP", list);

        // Lấy danh sách tất cả danh mục
        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);

        // Lấy sản phẩm mới nhất
        //Product last = dao.getLast();
        //request.setAttribute("p", last);
        
        // Lấy 3 sản phẩm mới nhất
        List<Product> listTop5Newsest = dao.getTop5NewestProducts();
        request.setAttribute("listTop5Newsest", listTop5Newsest);

        request.getRequestDispatcher("Home.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
    }// </editor-fold>

}
