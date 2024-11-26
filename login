<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro e Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            display: none;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #218838;
        }
        .message {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="registrationContainer" class="container">
        <h1>Cadastro</h1>
        <form id="registrationForm">
            <div class="form-group">
                <label for="login">Login:</label>
                <input type="text" id="login" name="login" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Cadastrar">
            </div>
        </form>
        <div id="registrationMessage" class="message"></div>
    </div>

    <div id="loginContainer" class="container">
        <h1>Login</h1>
        <form id="loginForm">
            <div class="form-group">
                <label for="loginLogin">Login:</label>
                <input type="text" id="loginLogin" name="login" required>
            </div>
            <div class="form-group">
                <label for="loginSenha">Senha:</label>
                <input type="password" id="loginSenha" name="senha" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Entrar">
            </div>
        </form>
        <div id="loginMessage" class="message"></div>
    </div>

    <script>
        document.getElementById('registrationContainer').style.display = 'block';

        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const login = document.getElementById('login').value;
            const senha = document.getElementById('senha').value;

            localStorage.setItem('login', login);
            localStorage.setItem('senha', senha);

            document.getElementById('registrationMessage').textContent = `Cadastro realizado com sucesso! Redirecionando...`;

            setTimeout(function() {
                document.getElementById('registrationContainer').style.display = 'none';
                document.getElementById('loginContainer').style.display = 'block';
            }, 2000);
        });

        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const login = document.getElementById('loginLogin').value;
            const senha = document.getElementById('loginSenha').value;

            const storedLogin = localStorage.getItem('login');
            const storedSenha = localStorage.getItem('senha');

            if (login === storedLogin && senha === storedSenha) {
                document.getElementById('loginMessage').textContent = 'Login bem-sucedido!';
            } else {
                document.getElementById('loginMessage').textContent = 'Login ou senha inválidos.';
            }
        });
    </script>
</body>
</html>

