
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar sesión | SisGestion</title>
    <style>
        :root {
            color-scheme: light;
            font-family: Inter, "Segoe UI", Arial, sans-serif;
            color: #172b4d;
            background: #f5f7fb;
        }

        * {
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            margin: 0;
            display: grid;
            place-items: center;
            padding: 32px;
        }

        .login-shell {
            display: grid;
            grid-template-columns: 1fr 1fr;
            width: min(100%, 1050px);
            min-height: 620px;
            overflow: hidden;
            background: #fff;
            border: 1px solid #e8edf4;
            border-radius: 22px;
            box-shadow: 0 24px 70px rgba(27, 47, 78, .12);
        }

        .welcome-panel {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
            padding: 42px;
            color: #fff;
            background: linear-gradient(145deg, #123f54 0%, #126d70 100%);
        }

        .welcome-panel::before,
        .welcome-panel::after {
            position: absolute;
            content: "";
            border: 1px solid rgba(255, 255, 255, .12);
            border-radius: 50%;
            pointer-events: none;
        }

        .welcome-panel::before {
            width: 430px;
            height: 430px;
            right: -190px;
            top: 100px;
        }

        .welcome-panel::after {
            width: 330px;
            height: 330px;
            right: -140px;
            top: 150px;
        }

        .brand,
        .welcome-copy,
        .panel-note {
            position: relative;
            z-index: 1;
        }

        .brand {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            width: fit-content;
            color: #fff;
            font-size: 19px;
            font-weight: 700;
            letter-spacing: -.3px;
        }

        .brand-mark {
            display: grid;
            width: 42px;
            height: 42px;
            place-items: center;
            border-radius: 13px;
            background: #f4b740;
            color: #173b4c;
        }

        .welcome-copy {
            max-width: 380px;
            margin: auto 0;
            padding: 54px 0;
        }

        .eyebrow {
            margin: 0 0 18px;
            color: #9ce1d2;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.8px;
            text-transform: uppercase;
        }

        .welcome-copy h1 {
            margin: 0 0 18px;
            font-size: clamp(32px, 4vw, 46px);
            line-height: 1.13;
            letter-spacing: -1.5px;
        }

        .welcome-copy p {
            max-width: 360px;
            margin: 0;
            color: rgba(255, 255, 255, .76);
            font-size: 15px;
            line-height: 1.75;
        }

        .panel-note {
            color: rgba(255, 255, 255, .62);
            font-size: 12px;
        }

        .form-panel {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 56px 52px;
        }

        .login-form {
            width: min(100%, 370px);
        }

        .login-form h2 {
            margin: 0 0 9px;
            color: #172b4d;
            font-size: 29px;
            letter-spacing: -.8px;
        }

        .intro {
            margin: 0 0 34px;
            color: #78869a;
            font-size: 14px;
            line-height: 1.6;
        }

        .field {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 9px;
            color: #34445b;
            font-size: 13px;
            font-weight: 600;
        }

        .input-wrap {
            position: relative;
        }

        .input-wrap svg {
            position: absolute;
            top: 50%;
            left: 15px;
            width: 18px;
            height: 18px;
            transform: translateY(-50%);
            color: #98a5b6;
            pointer-events: none;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            height: 49px;
            padding: 0 14px 0 44px;
            border: 1px solid #dfe5ed;
            border-radius: 9px;
            outline: none;
            background: #fff;
            color: #172b4d;
            font: inherit;
            font-size: 14px;
            transition: border-color .2s, box-shadow .2s;
        }

        input::placeholder {
            color: #a5afbd;
        }

        input:focus {
            border-color: #16847f;
            box-shadow: 0 0 0 3px rgba(22, 132, 127, .12);
        }

        .form-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            margin: 4px 0 26px;
            font-size: 12px;
        }

        .remember {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin: 0;
            color: #69788d;
            font-weight: 400;
        }

        .remember input {
            width: 15px;
            height: 15px;
            margin: 0;
            accent-color: #16847f;
        }

        a {
            color: #137b78;
            font-weight: 600;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .submit-button {
            width: 100%;
            height: 50px;
            border: 0;
            border-radius: 9px;
            background: #137b78;
            color: #fff;
            cursor: pointer;
            font: inherit;
            font-size: 14px;
            font-weight: 700;
            transition: background .2s, transform .2s;
        }

        .submit-button:hover {
            transform: translateY(-1px);
            background: #0e6967;
        }

        .security-note {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            margin: 24px 0 0;
            color: #93a0af;
            font-size: 11px;
        }

        .security-note svg {
            width: 14px;
            height: 14px;
        }

        .alert {
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }

        .alert-danger{
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            text-align: center;
        }

        @media (max-width: 760px) {
            body {
                padding: 20px;
            }

            .login-shell {
                grid-template-columns: 1fr;
                min-height: auto;
            }

            .welcome-panel {
                min-height: 220px;
                padding: 25px 28px;
            }

            .welcome-copy {
                padding: 36px 0 20px;
            }

            .welcome-copy h1 {
                font-size: 32px;
            }

            .welcome-copy p,
            .panel-note {
                display: none;
            }

            .form-panel {
                padding: 38px 28px 42px;
            }
        }

        @media (max-width: 380px) {
            body {
                padding: 12px;
            }

            .form-options {
                align-items: flex-start;
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<main class="login-shell">
    <section class="welcome-panel" aria-label="Bienvenida">
        <div class="brand">
            <span class="brand-mark" aria-hidden="true">
                <svg viewBox="0 0 24 24" width="23" height="23" fill="none">
                    <path d="M4 19V9l8-5 8 5v10h-6v-6h-4v6H4Z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/>
                    <path d="M8 10h.01M16 10h.01" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
                </svg>
            </span>
            SisGestion
        </div>
        <div class="welcome-copy">
            <p class="eyebrow">Todo en un solo lugar</p>
            <h1>Gestiona tu negocio con claridad.</h1>
            <p>Accede a tus herramientas y mantén el control de tu operación desde un solo lugar.</p>
        </div>
        <div class="panel-note">Simple, organizado y siempre a tu alcance.</div>
    </section>

    <section class="form-panel" aria-labelledby="login-title">


        <form class="login-form" method="POST" action="${pageContext.request.contextPath}/login">
            <h2 id="login-title">Bienvenido</h2>
            <p class="intro">Ingresa tus datos para acceder a tu cuenta.</p>

            <div class="field">
                <label for="email">Correo electrónico</label>
                <div class="input-wrap">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                        <rect x="3" y="5" width="18" height="14" rx="2" stroke="currentColor" stroke-width="1.7"/>
                        <path d="m4 7 8 6 8-6" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    <input id="email" name="email" type="email" autocomplete="username" placeholder="nombre@empresa.com" required value="${email}">
                </div>
            </div>

            <div class="field">
                <label for="password">Contraseña</label>
                <div class="input-wrap">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                        <rect x="5" y="10" width="14" height="11" rx="2" stroke="currentColor" stroke-width="1.7"/>
                        <path d="M8 10V7a4 4 0 1 1 8 0v3M12 14v3" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>
                    </svg>
                    <input id="password" name="password" type="password" autocomplete="current-password" placeholder="Ingresa tu contraseña" required>
                </div>
            </div>

            <div class="form-options">
                <label class="remember" for="remember">
                    <input id="remember" name="remember" type="checkbox">
                    Recordarme
                </label>
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>

            <button class="submit-button" type="submit">Iniciar sesión</button>
            <p class="security-note">
                <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                    <path d="M12 3 19 6v5c0 4.5-3 8-7 10-4-2-7-5.5-7-10V6l7-3Z" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/>
                    <path d="m9 12 2 2 4-4" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                Tu información está protegida
            </p>

            <div>
                <c:if test="${errorMessage != null}">
                    <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                    </div>
                </c:if>
            </div>


        </form>
    </section>
</main>
</body>
</html>
