package controllers.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import persistence.commons.DaoFactory;
import persistence.dao.UserDao;
import services.UserService;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/dashboard");
            return;
        }

        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        req.getRequestDispatcher("/index.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User user = userService.login(email, password);
            //System.out.println(user.getPasswordHash());
            if(user != null && !user.isNull()) {
                HttpSession session = req.getSession(true);

                req.changeSessionId();

                session.setAttribute("user", user.getName());
                session.setAttribute("role", user.getRole().getRoleName());
                req.setAttribute("pageTitle", "Dashboard");

                System.out.println("Usuario autenticado: " + user.getName() + " (" + user.getEmail() + ")");

                session.setMaxInactiveInterval(30 * 60);

                resp.sendRedirect(req.getContextPath() + "/dashboard");


            } else {
                req.setAttribute("email", email);
                req.setAttribute("errorMessage", "Credenciales inválidas. Por favor, inténtalo de nuevo.");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("email", email);
            req.setAttribute("errorMessage", "Ocurrió un error al intentar iniciar sesión. Por favor, inténtalo de nuevo.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }


    }
}
