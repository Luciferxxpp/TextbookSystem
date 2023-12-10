<%--
  Created by IntelliJ IDEA.
  User: 张大神
  Date: 2023/5/16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <style div="nav">  *{margin:0;padding:0;} ul,li{list-style:none;} #content {width:600px;margin:0 auto;border:1px solid #f00;} ul li.item{width:400px;text-align:center;margin:20px 100px;background:#00f;color:#fff;}
  </style>
  <title>学生/教师登录页面</title>

  <style>
    body {
      /* 首先增加背景图 */
      background-size: cover; /* 设置背景的大小 */
      /* 将背景设置为不重复显示 */
      background: url("img/beijing3.jpg") no-repeat center;
    }

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



  </style>
  <style scoped>
    #city_year {
      border: 1px solid white;
      width: 30%;
      top:150px;
      text-align: center;

      /* 高度调整 */
      margin: 10% auto 0;
      background: #00000080;
      padding: 20px 50px;

      /* 将按钮的左右边框设置为圆弧 */
      border-radius: 30px;
      /* 圆角弧度24px */
      transition:0.2s;
    }

    /* Login标题的颜色控制 */

    #city_year h1 {
      color: white;
    }

    /* 对输入窗口进行修改 */
    #city_year .form .item p {
      font-size: 18px; /* 修改按钮文字的大小 */
      color: white;
    }
    #city_year .form .item input{
      width: 200px; /* 设置合适的宽度 */
      border: 0; /* 首先将边界取消，方便下面修改下部边界宽度 */
      border-bottom: 5px solid white; /* 将下边界进行修改，显示出横线效果 */
      font-size: 18px; /* 将字体适当的变大加粗 */
      background: #ffffff00; /* 将输入框设置为透明 */
      color: white; /* 上面的文本颜色设置为白色，但是placeholder的颜色要单独设置 */
      padding: 5px 10px; /* 为了placeholder的内容不是顶格显示，增加内部边界 */
    }

    /* 对button进行美化 */
    #city_year button {

      width: 150px;
      /* height: 30px; */
      text-transform: uppercase;
      border: 3px solid #FFFFFF; /* 设置按钮的边界粗细和颜色 */
      margin-top: 18px; /* 设置合适的上部外框的宽度，增加与上面的password框的距离 */
      text-align: center;
      font-size: 18px; /* 修改按钮文字的大小 */
      /* 设置按钮里面字体颜色 */
      color: #FFFFFF;
      line-height: 50px;
      border-radius: 30px; /* 将按钮的左右边框设置为圆弧 */
      cursor: pointer;
      /* 圆角弧度24px */
      transition:0.2s;
      /* 设置按钮背景为透明 */
      background:rgba(0,0,0,0);
    }

    input::-webkit-input-placeholder {
      color:white;
    }
    input::-moz-placeholder {
      /* Mozilla Firefox 19+ */
      color: white;
    }
    input:-moz-placeholder {
      /* Mozilla Firefox 4 to 18 */
      color: white;
    }
    input:-ms-input-placeholder {
      /* Internet Explorer 10-11 */
      color: white;
    }

  </style>

</head>



<body STYLE="background-color: #EBEBEB">


<ul>
  <li><a  href="bookStack.jsp">首页</a></li>
  <li><a   class="active" href="p4.jsp">提交购书单</a></li>
  <li><a  href="Book2Servlet">查看购书表</a> </li>

  <li><a  href="p5.jsp">返回领书单</a></li>

  <li style="float:right"><a  href="user.jsp">用户</a></li>
</ul>

  <br><br>
<form action="PurchaseServlet" method="POST">
  <div id="city_year">
    <h1>购书登记表</h1>
    <br>

    <div class="form">
      <div class="item">
        <p>编号</p>
        <input  placeholder="" type="text"   id="equipmentid" name="book_id" >
      </div>
    </div><br><br>

    <div class="form">
      <div class="item">
        <p>数量:(单位 本)</p>
        <input class="form-name" placeholder="" name="number" type="text" autofocus>
      </div>
    </div><br>


    <!-- <input type="submit" value="搜索" class="btn" /></br>   -->
    <!-- 用button实现的Login登陆按钮 -->
    <button type="submit">提交</button>
  </div>
</form>








</body>
</html>
