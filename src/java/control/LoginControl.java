package control;

import dao.DAO;
import dao.WishlistDAO;
import entity.Account;
import entity.Wishlist;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {
    private DAO dao;
    private WishlistDAO wishlistDAO;

    @Override
    public void init() {
        dao = new DAO();
        wishlistDAO = new WishlistDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code"); // Lấy mã code từ Google
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        try {
            // Bước 1: Lấy access token từ Google
            LoginGmail gg = new LoginGmail();
            String accessToken = gg.getToken(code);
            if (accessToken == null) {
                throw new IOException("Failed to get access token");
            }

            // Bước 2: Lấy thông tin user từ Google
            GoogleAccount acc = gg.getUserInfo(accessToken);
            if (acc == null || acc.getEmail() == null) {
                throw new IOException("Failed to get Google account info");
            }

            // Bước 3: Kiểm tra user trong database
            Account a = dao.loginByEmail(acc.getEmail());

            // Kiểm tra nếu không tìm thấy tài khoản trong database
            if (a == null) {
                request.setAttribute("error", "Email not found. Please register or try again.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                // Nếu tìm thấy tài khoản, thiết lập session
                HttpSession session = request.getSession();
                session.setAttribute("account", a);
                session.setAttribute("acc", a);
                session.setAttribute("userID", a.getId());
                session.setMaxInactiveInterval(600);

                // Lấy danh sách wishlist và cập nhật số lượng
                List<Wishlist> wishlist = wishlistDAO.getWishlistByUser(a.getId());
                int wishlistCount = (wishlist != null) ? wishlist.size() : 0;
                session.setAttribute("wishlistCount", wishlistCount);

                // Chuyển hướng về trang chủ
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error during Google login: " + e.getMessage());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rememberMe = request.getParameter("rememberMe");
        String u = request.getParameter("user");
        String p = request.getParameter("pass");

        // Thêm log để debug
        System.out.println("Username: " + u);
        System.out.println("Password: " + p);

        Account a = dao.login(u, p);

        if (a == null) {
            request.setAttribute("error", "username or password invalid");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            session.setAttribute("acc", a); // Có cần thiết lưu 2 lần không?
            session.setAttribute("userID", a.getId());
            session.setMaxInactiveInterval(600);

            // Lấy danh sách wishlist và cập nhật số lượng
            List<Wishlist> wishlist = wishlistDAO.getWishlistByUser(a.getId());
            int wishlistCount = (wishlist != null) ? wishlist.size() : 0;
            session.setAttribute("wishlistCount", wishlistCount);

            // Xử lý cookie cho "Remember Me"
            if (rememberMe != null && rememberMe.equals("on")) {
                Cookie usernameCookie = new Cookie("COOKIE_USERNAME", u);
                Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", p);
                usernameCookie.setMaxAge(60 * 60 * 24);
                passwordCookie.setMaxAge(60 * 60 * 24);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            } else {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("COOKIE_USERNAME") || c.getName().equals("COOKIE_PASSWORD")) {
                            c.setValue("");
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                }
            }

            // Chuyển hướng đến trang chủ
            response.sendRedirect("home");
        }
    }
}
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}