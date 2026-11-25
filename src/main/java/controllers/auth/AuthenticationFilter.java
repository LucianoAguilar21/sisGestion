package controllers.auth;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebFilter(urlPatterns = {
        "/dashboard",
        "/products/*",
        "/users/*"
})
public class AuthenticationFilter implements Filter{


    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        HttpSession session = req.getSession(false);

        boolean autenticado = session != null &&
                session.getAttribute("user") != null;

        if (autenticado) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(
                    req.getContextPath()
            );
        }
    }
}
