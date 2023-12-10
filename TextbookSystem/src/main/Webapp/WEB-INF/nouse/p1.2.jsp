
<%--
  Created by IntelliJ IDEA.
  User: 张大神
  Date: 2023/5/16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="servlets.BookServlet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../../js/jquery-3.6.4.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" >
  function book(name){
    var flag=window.confirm("表单为空");
    if(flag){
      location.href="p1.2.jsp?name="+name;
    }

  }

</script>
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
      font-family: 华文楷体;
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
    .divbutton{
      font-family: 华文中宋, serif;
      font-size: 15px;
      position: absolute;
      height:150px;
      width: 100%;
      bottom: 0px;
    }


  </style>


  <%--        <script src="${path}/js/jquery-3.6.4.min.js"></script>--%>
  <%--        <script>--%>
  <%--         function formSubmit(currentPage) {--%>
  <%--            $('input[name="currentPage"]').val(currentPage);--%>
  <%--            $('form:first').submit();--%>
  <%--        }--%>
  <%--        </script>--%>

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
      height: 50px;
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
    a {
      text-decoration: none;
      display: inline-block;
      padding: 8px 16px;
    }

    /*a:hover {*/
    /*    background-color: #ddd;*/
    /*}*/

    .previous {
      background-color: #f1f1f1;

    }

    .next {
      background-color: #4CAF50;
    }

    .round {
      border-radius: 50%;
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
  <li><a  href="main1.jsp">首页</a></li>
  <li><a  class="active" href="../../p4.jsp">提交购书单</a></li>
  <li><a  href="Book2Servlet">查看购书表</a> </li>
  <li><a  href="BookServlet">审核购书单</a></li>
  <li><a  href="../../p3.jsp">开发票</a></li>
  <li><a  href="../../p5.jsp">返回领书单</a></li>
  <li style="float:right"><a  href="../../user.jsp">用户</a></li>
</ul>
<table frame="below" border=1>
<thead>
  <tr>
    <th>编号</th>
    <th>书名</th>
    <th>价格 （单位: 元）</th>
    <th>所缺数量</th>
  </tr>
</thead>

  <tbody>
    <tr>
    </tr>

  </tbody>
</table>
<div class="divbutton">
  <center> <input type="submit" class="btn1" value="同意" onclick="book1('${list}')">
    <input type="submit" class="btn2" value="不同意"onclick="book('${book_lack.book_id}')"><br>


    第${paging.page+1}页/共${paging.pagenumber}页<br>

    <a class="previous round" href="Staff_ListServlet?page=${paging.indexpage-1}">&#8249;首页</a>
    <a  class="previous" href="Staff_ListServlet?page=${paging.page-1 }">&laquo; 上一页</a>
    <a class="next" href="Staff_ListServlet?page=${paging.page+1}">下一页 &raquo;</a>
    <a class="next round" href="Staff_ListServlet?page=${paging.pagenumber-1}">&#8250;末页</a></center>
</div>







</body>
</html>
