package control;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.OrderDAO;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderDAO = new OrderDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Lấy dữ liệu doanh thu theo tháng
            Map<String, Double> revenueByMonth = orderDAO.getRevenueByMonth();
            request.setAttribute("revenueByMonth", new Gson().toJson(revenueByMonth));

            // Lấy dữ liệu doanh thu theo năm
            Map<String, Double> revenueByYear = orderDAO.getRevenueByYear();
            request.setAttribute("revenueByYear", new Gson().toJson(revenueByYear));

            // Lấy sản phẩm bán chạy nhất
            List<Map<String, Object>> topSellingProducts = orderDAO.getTopSellingProducts();
            request.setAttribute("topSellingProducts", new Gson().toJson(topSellingProducts));

            // Chuyển hướng đến dashboard.jsp
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lấy dữ liệu dashboard");
        }
    }
}
