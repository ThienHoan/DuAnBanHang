package control;

import entity.GoogleAccount;
import dao.DAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hoan6
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String code = request.getParameter("code");

        LoginGmail gg = new LoginGmail();

        String accessToken = gg.getToken(code);

        GoogleAccount acc = gg.getUserInfo(accessToken);

        System.out.println(acc);

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
        DAO dao = new DAO();
        Account a = dao.loginByEmail(acc.getEmail());

        // Kiểm tra nếu không tìm thấy tài khoản trong database
        if (a == null) {
            request.setAttribute("error", "Email not found. Please register or try again.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            // Nếu tìm thấy tài khoản, thiết lập session và chuyển hướng về trang chủ
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            session.setAttribute("acc", a);
            session.setAttribute("userID", a.getId());
            session.setMaxInactiveInterval(600); // Đồng bộ với doPost
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

        DAO dao = new DAO();

        Account a = dao.login(u, p);

        if (a == null) {

            request.setAttribute("error", "username or password invalid");

            request.getRequestDispatcher("Login.jsp").forward(request, response);

        } else {

            HttpSession session = request.getSession();

            session.setAttribute("account", a);

            session.setAttribute("acc", a);

            session.setAttribute("userID", a.getId());

            session.setMaxInactiveInterval(600); // 10 phút

            if (rememberMe != null && rememberMe.equals("on")) { // Kiểm tra giá trị "on" từ checkbox

                Cookie usernameCookie = new Cookie("COOKIE_USERNAME", u);

                Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", p);

                usernameCookie.setMaxAge(60 * 60 * 24); // 1 ngày

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

        }

    }

    @Override

    public String getServletInfo() {

        return "Short description";

    }// </editor-fold>

}
