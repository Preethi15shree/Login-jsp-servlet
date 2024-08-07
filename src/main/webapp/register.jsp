<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
</style>
</head>
<body>
    <div class="container">
        <h1>Register</h1>
        <form name="f2" action="RegisterServlet1" method="post" onSubmit="return validate2()">
            <input type="text" name="name" placeholder="Name" /><br>
            <input type="text" name="username" placeholder="Username" /><br>
            <input type="password" name="password" placeholder="Password" /><br>
            <input type="password" name="repassword" placeholder="Retype Password" /><br>
            <input type="submit" value="Register" />
        </form>
    </div>
    <script>
        function validate2() {
            let x1 = document.f2.name.value;
            let x2 = document.f2.username.value;
            let x3 = document.f2.password.value;
            let x4 = document.f2.repassword.value;
            if (x1 == null || x1 == "") {
                alert("Name should not be empty");
                return false;
            }
            if (x2 == null || x2 == "") {
                alert("Username should not be empty");
                return false;
            }
            if (x3 == null || x3 == "") {
                alert("Password should not be empty");
                return false;
            }
            if (x3 != x4) {
                alert("Password and Retype Password should match");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
