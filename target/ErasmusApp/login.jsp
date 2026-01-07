<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - UNIERA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        :root {
            --primary: #00509e;
            --primary-dark: #003366;
            --accent: #4ecdc4;
            --light: #f8f9fa;
            --dark: #343a40;
            --gray: #6c757d;
            --radius: 12px;
            --shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e4edf5);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: white;
            width: 100%;
            max-width: 420px;
            padding: 2.5rem;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .title {
            text-align: center;
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
        }

        .subtitle {
            text-align: center;
            color: var(--gray);
            margin-bottom: 2rem;
        }

        label {
            font-weight: 600;
            margin-bottom: 0.4rem;
            display: block;
        }

        input {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1.2rem;
            border-radius: var(--radius);
            border: 1px solid #ddd;
            font-size: 1rem;
            transition: 0.3s;
        }

        input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(0,80,158,0.15);
        }

        button {
            width: 100%;
            padding: 0.9rem;
            border: none;
            border-radius: var(--radius);
            background: var(--primary);
            color: white;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: var(--primary-dark);
            transform: scale(1.02);
        }

        .error {
            margin-top: 1rem;
            text-align: center;
            color: #e63946;
            font-weight: 600;
        }

        .footer-text {
            margin-top: 1.8rem;
            text-align: center;
            color: var(--gray);
            font-size: 0.9rem;
        }

        .footer-text a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="login-card">
    <div class="title">UNIERA</div>
    <div class="subtitle">Login to your account</div>

    <form action="LoginServlet" method="post">

        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>

    </form>


    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div class="footer-text">
        Don’t have an account?
        <a href="register.jsp">Register here</a>
    </div>
</div>

</body>
</html>
