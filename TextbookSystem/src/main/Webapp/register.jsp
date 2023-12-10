
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <script type="text/javascript" src="js/jquery-3.6.4.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
        }

        body {
            height: 100%;
        }

        .container {
            height: 100%;
            background-image: linear-gradient(to right, #fbc2eb, #a6c1ee);
        }

        .login-wrapper {
            background-color: #fff;
            width: 358px;
            height: 588px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 150px;
        }

        .input-item {
            display: block;
            width: 100%;
            margin-bottom: 10px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128, 125, 125);
            font-size: 15px;
            outline: none;
        }

        .input-item::placeholder {
            text-transform: uppercase;
        }

        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            color: #fff;

        }

        .msg {
            text-align: center;
            line-height: 70px;
        }

        a {
            text-decoration-line: none;
            color: #abc1ee;
        }

        .warning-item {
            color: red;
            font-size: small;
        }
    </style>
</head>
<body>
<form class="container" id="app"  action="RegisterServlet" method="post">
    <div class="login-wrapper">
        <div class="header">注册</div>
        <div class="form-wrapper">
            <input type="text" name="userid" placeholder="学号或教师编号" class="input-item" id="userid" onblur="idCheck()">
            <span id="warning1" class="warning-item" style="display: none">编号不能为空</span>
            <input type="text" name="username" placeholder="用户名" class="input-item" id="username" onblur="nameCheck()">
            <span id="warning2" class="warning-item" style="display: none">用户名不能为空</span>
            <input type="password" name="password" placeholder="密码" class="input-item" id="password" onblur="passwordCheck()">
            <span id="warning3" class="warning-item"
                  style="display: none">密码必须包含大写字母、数字、特殊字符且至少8位</span>
            <input type="password" name="confirm" placeholder="确认密码" class="input-item" id="confirm" onblur="confirmCheck()">
            <span id="warning4" class="warning-item" style="display: none">密码不一致</span>
            <input type="text" name="profession" placeholder="专业" class="input-item" id="profession" onblur="professionCheck()">
            <span id="warning5" class="warning-item" style="display: none">专业不能为空</span>
            性别：
            <input type="radio" name="gender" value="男" checked class="gender">男
            <input type="radio" name="gender" value="女" class="gender">女
            <input type="submit" class="btn" id="submit" value="提交">
        </div>
        <div class="msg">
            已有账号？
            <a href="login.jsp">点击登录</a>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">

    var useridInput = document.getElementById("userid");
    function idCheck() {
        var userid = useridInput.value.trim();
        if (userid.length === 0) {
            document.getElementById("warning1").style.display = '';
            return false;
        } else {
            document.getElementById("warning1").style.display = 'none';
            return true;
        }
    }


    var usernameInput = document.getElementById("username");



    function nameCheck() {

        var username = usernameInput.value.trim();
        if (username.length === 0) {
            document.getElementById("warning2").style.display = '';
            return false;
        } else {
            document.getElementById("warning2").style.display = 'none';
            return true;
        }
    }


    var passwordInput = document.getElementById("password");



    function passwordCheck() {

        var password = passwordInput.value.trim();
        var regexp = new RegExp('^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]{8,20}$');
        if (regexp.test(password)) {
            document.getElementById("warning3").style.display = 'none';
            return true;
        } else {
            document.getElementById("warning3").style.display = '';
            return false;
        }

    }

    var confirmInput = document.getElementById("confirm");


    function confirmCheck() {
        var confirm = confirmInput.value.trim();
        var password = passwordInput.value.trim();
        if (confirm === password) {
            document.getElementById("warning4").style.display = 'none';
            return true;
        } else {
            document.getElementById("warning4").style.display = '';
            return false;
        }
    }


    var professionInput = document.getElementById("profession");



    function professionCheck() {
        var profession = professionInput.value.trim();
        if (profession.length === 0) {
            document.getElementById("warning5").style.display = '';
            return false;
        } else {
            document.getElementById("warning5").style.display = 'none';
            return true;
        }
    }

    document.getElementById("app").onsubmit = function () {
        return nameCheck() && passwordCheck() && idCheck() && confirmCheck() && professionCheck();
    }

    $("#submit").click(function (){
        $("#submit").style.color="#aaa"
    })

</script>
</html>
