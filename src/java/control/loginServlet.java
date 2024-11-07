package control;

import dao.DAO;
import entity.GoogleAccount;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code != null) {
            GoogleLogin gg = new GoogleLogin();
            String accessToken = gg.getToken(code);
            GoogleAccount acc = gg.getUserInfo(accessToken);
            System.out.println(acc.getPicture());
            DAO dao = new DAO();
            int existingUser = dao.getUserInt(acc.getEmail());

            // If the user already exists, we don't need to insert a new record
            if (existingUser == 0) {
                // If not, create a new user and insert into the database
                User newUser = new User(0, acc.getFamily_name(), acc.getGiven_name(), acc.getEmail(), acc.getPicture(),
                        acc.getName(), "", "", "", 1, 1);
                dao.insertUser(newUser);
            }
            if (acc != null) {
                Cookie emailCookie = new Cookie("email", acc.getEmail());
                int maxAge = 60 * 60 * 24 * 3;
                emailCookie.setMaxAge(maxAge);
                response.addCookie(emailCookie);

                response.sendRedirect("home");
                return;
            } else {
                response.sendRedirect("login");
                return;
            }
        } else {
            request.getRequestDispatcher("view/JSP/client/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DAO dao = new DAO();
        User isValidUser = dao.getUser(email, password);

        if (isValidUser != null) {
            Cookie c = new Cookie("email", email);
            c.setMaxAge(60 * 60 * 24 * 3);
            response.addCookie(c);
            response.sendRedirect("home");
            return;
        } else {
            response.sendRedirect("login");
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
