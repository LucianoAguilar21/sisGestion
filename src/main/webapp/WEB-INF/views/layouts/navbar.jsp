<header class="navbar">
    <div class="navbar-greeting">
        <span class="navbar-kicker">Panel de control</span>
        <span class="navbar-user">
            Bienvenido, <strong><c:out value="${user}" default="usuario" /></strong>
        </span>
    </div>

    <div class="navbar-actions">
        <span class="role-badge"><c:out value="${role}" default="Invitado" /></span>

        <a class="logout-link" href="${pageContext.request.contextPath}/logout">
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                <path d="M10 5H6a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h4" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
                <path d="M15 8l4 4-4 4M9 12h10" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Cerrar sesión
        </a>
    </div>
</header>