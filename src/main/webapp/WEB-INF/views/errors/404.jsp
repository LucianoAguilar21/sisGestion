<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Página no encontrada | SisGestion</title>
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
            display: grid;
            min-height: 100vh;
            margin: 0;
            padding: 28px;
            place-items: center;
        }

        .error-card {
            display: grid;
            grid-template-columns: 1fr 1fr;
            width: min(100%, 980px);
            min-height: 500px;
            overflow: hidden;
            border: 1px solid #e8edf4;
            border-radius: 22px;
            background: #fff;
            box-shadow: 0 24px 70px rgba(27, 47, 78, .12);
        }

        .message-panel {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            padding: 64px;
        }

        .brand {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            margin-bottom: auto;
            color: #172b4d;
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

        .error-copy {
            margin: auto 0;
            padding: 52px 0;
        }

        .eyebrow {
            margin: 0 0 14px;
            color: #137b78;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.8px;
            text-transform: uppercase;
        }

        h1 {
            margin: 0 0 16px;
            color: #172b4d;
            font-size: clamp(30px, 4vw, 42px);
            letter-spacing: -1.3px;
            line-height: 1.15;
        }

        .description {
            max-width: 360px;
            margin: 0;
            color: #78869a;
            font-size: 15px;
            line-height: 1.75;
        }

        .home-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 48px;
            gap: 9px;
            padding: 0 20px;
            border-radius: 9px;
            background: #137b78;
            color: #fff;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: background .2s, transform .2s;
        }

        .home-link:hover {
            transform: translateY(-1px);
            background: #0e6967;
        }

        .home-link svg {
            width: 17px;
            height: 17px;
        }

        .illustration-panel {
            position: relative;
            display: grid;
            overflow: hidden;
            place-items: center;
            padding: 40px;
            background: linear-gradient(145deg, #123f54 0%, #126d70 100%);
        }

        .illustration-panel::before,
        .illustration-panel::after {
            position: absolute;
            content: "";
            border: 1px solid rgba(255, 255, 255, .12);
            border-radius: 50%;
            pointer-events: none;
        }

        .illustration-panel::before {
            width: 470px;
            height: 470px;
        }

        .illustration-panel::after {
            width: 350px;
            height: 350px;
        }

        .number-art {
            position: relative;
            z-index: 1;
            color: #fff;
            font-size: clamp(100px, 18vw, 180px);
            font-weight: 800;
            letter-spacing: -12px;
            line-height: 1;
            text-shadow: 0 12px 30px rgba(0, 0, 0, .14);
        }

        .number-art span {
            color: #f4b740;
        }

        @media (max-width: 700px) {
            body {
                padding: 16px;
            }

            .error-card {
                grid-template-columns: 1fr;
                min-height: auto;
            }

            .illustration-panel {
                grid-row: 1;
                min-height: 210px;
            }

            .number-art {
                font-size: 112px;
            }

            .message-panel {
                min-height: 370px;
                padding: 32px;
            }

            .brand {
                margin-bottom: 32px;
            }

            .error-copy {
                margin: 0;
                padding: 0 0 30px;
            }
        }
    </style>
</head>
<body>
<main class="error-card">
    <section class="message-panel" aria-labelledby="error-title">
        <div class="brand">
            <span class="brand-mark" aria-hidden="true">
                <svg viewBox="0 0 24 24" width="23" height="23" fill="none">
                    <path d="M4 19V9l8-5 8 5v10h-6v-6h-4v6H4Z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/>
                    <path d="M8 10h.01M16 10h.01" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
                </svg>
            </span>
            SisGestion
        </div>

        <div class="error-copy">
            <p class="eyebrow">Error 404</p>
            <h1 id="error-title">No encontramos esa página.</h1>
            <p class="description">Es posible que el enlace haya cambiado o que la página ya no esté disponible. Vuelve al inicio para continuar.</p>
        </div>

        <a class="home-link" href="${pageContext.request.contextPath}/dashboard">
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                <path d="m10 17-5-5 5-5M5 12h14" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Volver al inicio
        </a>
    </section>

    <section class="illustration-panel" aria-hidden="true">
        <div class="number-art">4<span>0</span>4</div>
    </section>
</main>
</body>
</html>
