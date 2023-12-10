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
  <title>管理员登录页面</title>
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

    p {
      font-family: 华文行楷;
      font-size: 25px;
    }

    .btn {
      width: 140px;
      height: 36px;
      line-height: 18px;
      font-size: 18px;
      background: url("img/button.jpg") no-repeat left top;
      color: #FFF;
      padding-bottom: 4px
    }

    table {
      font-family: 华文中宋;
      font-size: 25px;
      width: 1500px;
    }

    body {
      /* 加载背景图 */
      background-image: url(images/R-C.jfif);
      /* 背景图垂直、水平均居中 */
      background-position: center center;
      /* 背景图不平铺 */
      background-repeat: no-repeat;
      /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
      background-attachment: fixed;
      /* 让背景图基于容器大小伸缩 */
      background-size: cover;
      /* 设置背景颜色，背景图加载过程中会显示背景色 */
      background-color: #464646;
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
<link href="./style.css" rel="stylesheet" type="text/css">
<body style="background-color: rgb(159,252,253)">
<ul>

  <li><a href="book.jsp">首页</a></li>
  <li STYLE="background-color: #000000"><a>销售功能</a></li>
  <li><a href="BookServlet">审核购书单</a></li>
  <li><a href="p3.jsp">开发票</a></li>
  <li STYLE="background-color: #000000"><a>采购功能</a></li>
  <li><a href="h1.jsp">登记缺书记录</a></li>
  <li><a href="Book4Servlet">查看缺书单</a></li>
  <li><a href="Pending1Servlet">待购书信息</a></li>
  <li><a href="Pending2Servlet">进书通知书</a></li>
  <li style="float:right"><a class="active" href="user.jsp">${worker.getWorkerName()}</a></li>

</ul>
<h1>个人信息</h1>
<table>
  <tr>
    <td>员工号</td>
    <td>${worker.getWorkerId()}</td>
    <td><form action="WorkerLogOutServlet" method="post" onclick="alert('确认退出登录？')">
      <input type="submit" value="退出登录">
    </form></td>
  </tr>
  <tr>
    <td>用户名</td>
    <td><span id="username">${worker.getWorkerName()}</span></td>
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
</table>

<form action="WorkerLogOutServlet" method="post" onclick="alert('确认退出登录？')">
  <input type="submit" value="退出登录">
</form>
</body>
<script>

  function changeName() {
    var name = prompt("请输入修改后的用户名");

    $.ajax({
      url: "ChangeWorkerNameServlet",
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
          url: "ChangeWorkerPasswordServlet",
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

</script>
</html>
