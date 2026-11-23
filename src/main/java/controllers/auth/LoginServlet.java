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
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User user = userService.userExists(email) ? userService.login(email, password) : null;

            if(user != null && !user.isNull() && user.checkPassword(password)) {
                HttpSession session = req.getSession(true);

                req.changeSessionId();

                session.setAttribute("user", user.getName());
                session.setAttribute("role", user.getRol());
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
            req.setAttribute("errorMessage", "Ocurrió un error al intentar iniciar sesión. Por favor, inténtalo de nuevo.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
//        if(!userService.userExists(email)) {
//            req.setAttribute("errorMessage", "El usuario no existe.");
//            req.getRequestDispatcher("index.jsp").forward(req, resp);
//            return;
//        }
//
//        User user = userService.login(email, password);
//
//        if(!user.isNull()){
//            req.getSession().setAttribute("user", user);
//            System.out.println("Usuario autenticado: " + user.getName() + " (" + user.getEmail() + ")");
//            resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/dashboard.jsp"); // Redirect to dashboard
//        } else {
//            req.setAttribute("errorMessage", "Credenciales inválidas. Por favor, inténtalo de nuevo.");
//            req.getRequestDispatcher("index.jsp").forward(req, resp);
//        }

    }
}
