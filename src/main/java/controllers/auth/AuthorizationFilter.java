package controllers.auth;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/products",
        "/products/*"
})
public class AuthorizationFilter implements Filter{

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            resp.sendRedirect(req.getContextPath());
            return;
        }

        String role = (String) session.getAttribute("role");

        if (!"ADMIN".equals(role.toUpperCase())) {
            resp.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "No tienes permisos para acceder a esta sección."
            );
            return;
        }

        chain.doFilter(request, response);
    }

}
