<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教材管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d3e0ea;
            background-image: url(img/index.png);
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        h1 {
            text-align: center;
            color: firebrick;
            margin-top: 50px;
        }

        .container {
            margin: auto;
            width: 50%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .btn {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color .3s;
            margin-bottom: 20px;
        }

        .btn:hover {
            background-color: #3e8e41;
        }

    </style>
</head>
<body>
<h1>教材管理系统</h1>
<div class="container">
    <a href="register.jsp" class="btn">用户注册</a>
    <a href="login.jsp" class="btn">用户登录</a>
    <a href="workerlogin.jsp" class="btn">管理员登录</a>
</div>
</body>
</html>
