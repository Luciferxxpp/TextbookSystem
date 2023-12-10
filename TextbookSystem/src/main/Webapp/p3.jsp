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
  <title>管理员登录页面</title>

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

<body  STYLE="background-color: #EBEBEB">
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
  <li><a href="book.jsp">首页</a></li>
  <li  STYLE="background-color: #000000"><a>销售功能</a> </li>
  <li><a  href="BookServlet">审核购书单</a></li>
  <li><a class="active"  href="p3.jsp">开发票</a></li>
  <li  STYLE="background-color: #000000"><a>采购功能</a> </li>
  <li><a href="h1.jsp">登记缺书记录</a></li>
  <li><a href="Book4Servlet">查看缺书单</a></li>
  <li><a href="Pending1Servlet">待购书信息</a></li>
  <li><a href="Pending2Servlet">进书通知书</a></li>
  <li style="float:right"><a  href="worker.jsp">用户</a></li>
</ul><br><br>
<center>
</center>
<form action="BillServlet" method="POST">
  <div id="city_year">
    <h1>发票单</h1>


    <div class="form">
      <div class="item">
        <p>公司名称</p>
        <input class="form-name" placeholder="" type="text" name="cpy_name" autofocus>
      </div>
    </div><br>
    <div class="form">
      <div class="item">
        <p>金额</p>
        <input class="form-name" placeholder="" type="number" name="money" autofocus>
      </div>
    </div><br>

    <button type="submit">提交</button>
  </div>
</form>







</body>
</html>
