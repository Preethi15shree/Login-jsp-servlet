<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: linear-gradient(to right, #ffafbd, #ffc3a0);
        margin: 0;
    }
    .container {
        background: #fff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    .container h1 {
        margin-bottom: 20px;
        color: #333;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    form input[type="text"],
    form input[type="password"] {
        margin-bottom: 15px;
        padding: 10px;
        width: 80%;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    form input[type="submit"] {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background: #ff6f61;
        color: #fff;
        cursor: pointer;
        font-size: 16px;
        transition: background 0.3s;
    }
    form input[type="submit"]:hover {
        background: #ff3d2e;
    }
    .register {
        margin-top: 20px;
    }
    .register a {
        color: #ff6f61;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s;
    }
    .register a:hover {
        color: #ff3d2e;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form name="f1" action="LoginServlet1" method="post" onSubmit="return validate1()">
            <input type="text" name="username" placeholder="Username" /><br>
            <input type="password" name="password" placeholder="Password" /><br>
            <input type="submit" value="Login" /><br>
        </form>
        <div class="register">
            New User? <a href="register.jsp">Register</a>
        </div>
    </div>
    <script>
        function validate1() {
            let x1 = document.f1.username.value;
            let x2 = document.f1.password.value;
            if (x1 == null || x1 == "") {
                alert("Username should not be empty");
                return false;
            }
            if (x2 == null || x2 == "") {
                alert("Password should not be empty");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
