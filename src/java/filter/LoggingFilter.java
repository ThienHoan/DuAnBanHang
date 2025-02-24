
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
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        
//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse res = (HttpServletResponse) response;
//        
//        HttpSession session = req.getSession();
//        if(session.getAttribute("account")==null){
//            res.sendRedirect("login");
//            return;
//        }try {
//            chain.doFilter(request, response);
//        } catch (Exception e) {
//        }
//        
//    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {

    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    HttpSession session = req.getSession();
    Object account = session.getAttribute("account");
//   
//    System.out.println("Filter is working. Request URI: " + req.requestURI);
//System.out.println("Session Account: " + session.getAttribute("account"));


    if (account == null) {
        res.sendRedirect("login"); // Nếu chưa đăng nhập, chuyển về trang login
        return;
    }

    // Ép kiểu account về Account
    Account acc = (Account) account;

    // Xác định quyền
    boolean isAdmin = acc.getIsAdmin() == 1;
    boolean isSeller = acc.getIsSell() == 1;

    // Lấy đường dẫn trang đang truy cập
    String requestURI = req.getRequestURI();

    // Phân quyền
    if (requestURI.endsWith("ManagerProduct.jsp") && acc.getIsAdmin() != 1 && acc.getIsSell() != 1) {
        res.sendRedirect("404Loi.jsp"); // Không có quyền, chuyển về trang lỗi
        return;
    }
    if (requestURI.endsWith("/ManagerAccount") && !isSeller && !isAdmin) {
        res.sendRedirect("404Loi.jsp"); // Nếu không phải seller/admin mà vào trang seller, chặn lại
        return;
    }

    try {
        chain.doFilter(request, response);
    } catch (Exception e) {
        e.printStackTrace();
    }
}



    @Override
    public void destroy() {
        // Dọn dẹp nếu cần
    }
}

