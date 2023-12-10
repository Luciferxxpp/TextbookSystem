<%--
  Created by IntelliJ IDEA.
  User: 张大神
  Date: 2023/5/16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <style div="nav">  *{margin:0;padding:0;} ul,li{list-style:none;} #content {width:600px;margin:0 auto;border:1px solid #f00;} ul li.item{width:400px;text-align:center;margin:20px 100px;background:#00f;color:#fff;}
    </style>
    <title>学生/教师登录页面</title>
    </style>
    <title>学生/教师登录页面</title>
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
        p{
            font-family: 华文行楷;
            font-size: 15px;
        }
        .btn1{width:140px;height:36px;line-height:18px;font-size:18px;
            background-color:white;padding-bottom:4px;
            border-radius:20px;
        }
        .btn2{width:140px;height:36px;line-height:18px;font-size:18px;
            background-color:white;padding-bottom:4px;
            border-radius:20px;
        }
        .btn1:hover{
            background-color:#6DFF61;
            color: white;
        }
        .btn2:hover{
            background-color:#FF2525;
            color:white;
        }


    </style>
    <style scoped>
        table{
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
            width: 1520px;
            overflow: hidden;
        }
        table td, table th{
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table thead th{
            background-color: #CCE8EB;
        }
        table tr:nth-child(odd){
            background: #fff;
        }
        table tr:nth-child(even){
            background: #F5FAFA;
        }
        table tbody tr:hover{
            background-color: #ccc;
        }

    </style>
</head>

<body  style="background-color: rgb(159,252,253)">
<script>
    (function () {
        var a_idx = 0;
        window.onclick = function (event) {
            var a = ["❤富强❤", "❤民主❤", "❤文明❤", "❤和谐❤", "❤自由❤", "❤平等❤", "❤公正❤", "❤法治❤", "❤爱国❤",
                "❤敬业❤", "❤诚信❤", "❤友善❤"];

            var heart = document.createElement("b"); //创建b元素
            heart.onselectstart = new Function('event.returnValue=false'); //防止拖动

            document.body.appendChild(heart).innerHTML = a[a_idx]; //将b元素添加到页面上
            a_idx = (a_idx + 1) % a.length;
            heart.style.cssText = "position: fixed;left:-100%;"; //给p元素设置样式

            var f = 16, // 字体大小
                x = event.clientX - f / 2, // 横坐标
                y = event.clientY - f, // 纵坐标
                c = randomColor(), // 随机颜色
                a = 1, // 透明度
                s = 1.2; // 放大缩小

            var timer = setInterval(function () { //添加定时器
                if (a <= 0) {
                    document.body.removeChild(heart);
                    clearInterval(timer);
                } else {
                    heart.style.cssText = "font-size:16px;cursor: default;position: fixed;color:" +
                        c + ";left:" + x + "px;top:" + y + "px;opacity:" + a + ";transform:scale(" +
                        s + ");";

                    y--;
                    a -= 0.016;
                    s += 0.002;
                }
            }, 15)

        }
        // 随机颜色
        function randomColor() {

            return "rgb(" + (~~(Math.random() * 255)) + "," + (~~(Math.random() * 255)) + "," + (~~(Math
                .random() * 255)) + ")";

        }
    }());
</script>
<ul>
    <li><a  class="active" href="../../bookStack.jsp">首页</a></li>
    <li><a  href="../../p4.jsp">提交购书单</a></li>
    <li><a  href="Book2Servlet">查看购书表</a> </li>

    <li><a  href="../../p5.jsp">返回领书单</a></li>

    <li style="float:right"><a  href="../../user.jsp">用户</a></li>
</ul>
<hr/>
</body>
</html>
