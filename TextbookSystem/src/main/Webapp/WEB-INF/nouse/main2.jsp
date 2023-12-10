<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <style div="nav">  *{margin:0;padding:0;} ul,li{list-style:none;} #content {width:600px;margin:0 auto;border:1px solid #f00;} ul li.item{width:400px;text-align:center;margin:20px 100px;background:#00f;color:#fff;}
    </style>
    <title>管理员登录页面</title>
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
            font-size: 25px;
        }
        .btn{width:140px;height:36px;line-height:18px;font-size:18px;
            background:url("../../img/button.jpg") no-repeat left top;color:#FFF;padding-bottom:4px}
        table{
            font-family:华文中宋;
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
    </style>
</head>
<link href="./style.css" rel="stylesheet" type="text/css">
<body  style="background-color: rgb(159,252,253)">
<ul>

    <li><a class="active" href="../../book.jsp">首页</a></li>
    <li><a>销售功能</a> </li>
    <li><a  href="BookServlet">审核购书单</a></li>
    <li><a  href="../../p3.jsp">开发票</a></li>
    <li><a>采购功能</a> </li>
    <li><a href="../../h1.jsp">登记缺书记录</a></li>
    <li><a href="Book4Servlet">查看缺书单</a></li>
    <li><a href="Pending1Servlet">待购书信息</a></li>
    <li><a href="Pending2Servlet">进书通知书</a></li>

    <li style="float:right"><a  href="../../worker.jsp">当前用户</a></li>

</ul>
<div id="d">
    <div id="a">
        模块一
    </div>
    <div id="b">
        模块二
    </div>
    <div id="c">
        模块三
    </div>
</div>

</body>
</html>
