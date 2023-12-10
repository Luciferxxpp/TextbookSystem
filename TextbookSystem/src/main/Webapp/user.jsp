
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style div="nav">  * {
    margin: 0;
    padding: 0;
  }

  ul, li {
    list-style: none;
  }

  #content {
    width: 600px;
    margin: 0 auto;
    border: 1px solid #f00;
  }

  ul li.item {
    width: 400px;
    text-align: center;
    margin: 20px 100px;
    background: #00f;
    color: #fff;
  }
  </style>
  <title>学生/教师登录页面</title>
  <script type="text/javascript" src="js/jquery-3.6.4.min.js"></script>
  <style>
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #333;
    }

    li {
      float: left;
    }

    li a {
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    li a:hover:not(.active) {
      background-color: #111;
    }

    .active {
      background-color: #4CAF50;
    }

    li {
      border-right: 1px solid #bbb;
    }

    li:last-child {
      border-right: none;
    }

    h1 {
      text-align: center;
      margin-top: 50px;
      margin-bottom: 30px;
      color: #333;
    }

    table {
      margin: auto;
      border-collapse: collapse;
      width: 50%;
      background-color: #fff;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
    }

    td, th {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f2f2f2;
      font-weight: bold;
      color: #333;
    }

    tr:hover {
      background-color: #f5f5f5;
    }

    .button {
      background-color: #4CAF50;
      border: none;
      color: white;
      padding: 10px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 5px;
    }

    input[type=text], input[type=password] {
      padding: 8px 10px;
      border-radius: 5px;
      border: none;
      background-color: #f2f2f2;
      margin-right: 10px;
    }

    input[type=submit] {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 10px;
      margin-right: 10px;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>
</head>
<body style="background-color: rgb(159,252,253)">

<ul>
  <li><a href="bookStack.jsp">首页</a></li>
  <li><a href="p4.jsp">提交购书单</a></li>
  <li><a href="Book2Servlet">查看购书表</a></li>
  <li><a href="p5.jsp">返回领书单</a></li>
  <li style="float:right"><a class="active" href="user.jsp">${user.getUsername()}</a></li>
</ul>


<h1>个人信息</h1>
<table>

  <tr>
    <td>学号</td>
    <td>${user.getUserId()}</td>
    <td><form action="UserLogOutServlet" method="post">
      <input type="submit" value="退出登录" onclick="alert('确认退出登录？')">
    </form></td>
  </tr>
  <tr>
    <td>用户名</td>
    <td><span id="username">${user.getUsername()}</span></td>
    <td>
      <button class="button" onclick="changeName()">修改用户名</button>
    </td>
  </tr>
  <tr>
    <td>密码</td>
    <td><span id="password">********</span></td>
    <td>
      <button class="button" onclick="changePassword()">修改密码</button>
    </td>
  </tr>
  <tr>
    <td>专业</td>
    <td><span id="major">${user.getProfession()}</span></td>
    <td>
      <button class="button" onclick="changeProfession()">修改专业</button>
    </td>
  </tr>
</table>


</body>
<script>

  function changeName() {
    var name = prompt("请输入修改后的用户名");

    $.ajax({
      url: "ChangeUsernameServlet",
      type: "post",
      data: {
        "name": name
      },
      dataType: "json",
    })
    location.reload();
  }


  function changePassword() {
    var password1 = prompt("请输入修改后的密码");
    var regexp = new RegExp('^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]{8,20}$');
    if (!regexp.test(password1) && password1 !== "") {
      alert("密码格式有误（必须包含大写字母、数字、特殊字符且至少8位）");
    } else {
      var password2 = prompt("请再次输入密码");
      if (password1 === password2) {
        $.ajax({
          url: "ChangeUserPasswordServlet",
          type: "post",
          data: {
            "password": password2
          },
          dataType: "json",
        })
        location.reload();
      } else {
        alert("两次密码不一致！")
      }
    }
  }

  function changeProfession() {
    var profession = prompt("请输入修改后的专业");

    $.ajax({
      url: "ChangeProfessionServlet",
      type: "post",
      data: {
        "profession": profession
      },
      dataType: "json",
    })
    location.reload();
  }

</script>
</html>
