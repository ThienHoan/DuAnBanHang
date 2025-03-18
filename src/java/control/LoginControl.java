package control;

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
@WebServlet(name="LoginControl", urlPatterns={"/login"})
public class LoginControl extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       //processRequest(request, response);
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        response.sendRedirect("home");
    }
}
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
