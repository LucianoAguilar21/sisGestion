<!DOCTYPE html>
<html lang="es">

<jsp:include page="/WEB-INF/views/layouts/head.jsp" />

<body>

<div class="app-container">

    <jsp:include page="/WEB-INF/views/layouts/sidebar.jsp" />

    <div class="main-content">

        <jsp:include page="/WEB-INF/views/layouts/navbar.jsp" />

        <main class="content">

            <jsp:include page="${contentPage}" />

        </main>

        <jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

    </div>

</div>

</body>
</html>
