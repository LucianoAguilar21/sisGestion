<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />

<aside class="sidebar">
    <div class="sidebar-brand">
        <span class="sidebar-brand-mark" aria-hidden="true">
            <svg viewBox="0 0 24 24" width="23" height="23" fill="none">
                <path d="M4 19V9l8-5 8 5v10h-6v-6h-4v6H4Z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/>
                <path d="M8 10h.01M16 10h.01" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
            </svg>
        </span>
        SisGestion
    </div>

    <p class="sidebar-section-title">Menú principal</p>

    <nav aria-label="Navegación principal">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard"
                   class="sidebar-link<c:if test="${fn:contains(currentUri, '/dashboard')}"> is-active</c:if>">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                        <rect x="3" y="3" width="7" height="7" rx="1.5" stroke="currentColor" stroke-width="1.7"/>
                        <rect x="14" y="3" width="7" height="7" rx="1.5" stroke="currentColor" stroke-width="1.7"/>
                        <rect x="3" y="14" width="7" height="7" rx="1.5" stroke="currentColor" stroke-width="1.7"/>
                        <rect x="14" y="14" width="7" height="7" rx="1.5" stroke="currentColor" stroke-width="1.7"/>
                    </svg>
                    Dashboard
                </a>
            </li>


            <c:if test="${role == 'admin'}">
                <li>
                    <a href="${pageContext.request.contextPath}/products"
                       class="sidebar-link<c:if test="${fn:contains(currentUri, '/products')}"> is-active</c:if>">
                        <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                            <path d="m3 8 9-5 9 5-9 5-9-5Z" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/>
                            <path d="M3 8v8l9 5 9-5V8M12 13v8" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/>
                        </svg>
                        Productos
                    </a>
                </li>
            </c:if>


            <li>
                <a href="${pageContext.request.contextPath}/users"
                   class="sidebar-link<c:if test="${fn:contains(currentUri, '/users')}"> is-active</c:if>">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                        <circle cx="9" cy="8" r="3.2" stroke="currentColor" stroke-width="1.7"/>
                        <path d="M3.5 19c.6-3 2.8-4.5 5.5-4.5s4.9 1.5 5.5 4.5" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>
                        <path d="M16 5.2a3.2 3.2 0 0 1 0 6.1M17.5 14.8c2 .6 3.2 2 3.6 4.2" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>
                    </svg>
                    Usuarios
                </a>
            </li>
        </ul>
    </nav>

    <p class="sidebar-note">Simple, organizado y siempre a tu alcance.</p>
</aside>