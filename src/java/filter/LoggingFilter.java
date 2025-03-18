package filter;

import entity.Account;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

public class LoggingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Lấy đường dẫn trang đang truy cập
        String requestURI = req.getRequestURI();
        String servletPath = req.getServletPath();
        
        // Các đường dẫn không cần xác thực
        if (servletPath.equals("/login") || 
            servletPath.equals("/register") || 
            servletPath.equals("/home") ||
            servletPath.equals("/changePassword") ||  // Add this line to allow access
            requestURI.contains("assets/") || 
            requestURI.endsWith("Login.jsp") || 
            requestURI.endsWith("Register.jsp")) {
            // Cho phép truy cập mà không cần đăng nhập
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession();
        Object account = session.getAttribute("account");
        
        if (account == null) {
            res.sendRedirect("login"); // Nếu chưa đăng nhập, chuyển về trang login
            return;
        } else {
            // Ép kiểu account về Account
            Account acc = (Account) account;

            // Xác định quyền
            boolean isAdmin = acc.getRoleID() == 3;
            boolean isSeller = acc.getRoleID() == 2;

            System.out.println("isSeller: " + isSeller);
            System.out.println("isAdmin: " + isAdmin);
            System.out.println("requestURI: " + requestURI);

            // Phân quyền
            // Nếu không phải Seller hoặc Admin mà truy cập ManagerProduct.jsp => Chặn lại
            if (requestURI.endsWith("ManagerProduct.jsp") && !isSeller) {
                System.out.println("🚨 Không có quyền truy cập ManagerProduct.jsp => Chuyển hướng 404");
                res.sendRedirect("404Loi.jsp");
                return;
            }

            // Nếu không phải Admin mà truy cập ManagerAccount.jsp => Ch��n lại
            if (requestURI.endsWith("ManagerAccount.jsp") && !isAdmin) {
                System.out.println("🚨 Không có quyền truy cập ManagerAccount.jsp => Chuyển hướng 404");
                res.sendRedirect("404Loi.jsp");
                return;
            }

            // Nếu là Seller hoặc Admin, cho vào ManagerProduct.jsp
            if (requestURI.endsWith("ManagerProduct.jsp") && isSeller) {
                System.out.println("🚨 Có quyền truy cập ManagerProduct.jsp => Chuyển hướng");
                req.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
                return;
            }

            // Nếu là Admin, cho vào ManagerAccount.jsp
            if (requestURI.endsWith("ManagerAccount.jsp") && isAdmin) {
                System.out.println("🚨 Có quyền truy cập ManagerAccount.jsp => Chuyển hướng");
                req.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
                return;
            }

            try {
                chain.doFilter(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp nếu cần
    }
}
