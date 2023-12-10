

<%--
  Created by IntelliJ IDEA.
  User: 张大神
  Date: 2023/5/16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="servlets.BookServlet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:set value="${pageContext.request.contextPath}" var="path"></c:set>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<html>
<head>
  <style div="nav">  *{margin:0;padding:0;} ul,li{list-style:none;}
  #content {width:600px;margin:0 auto;border:1px solid #f00;}
  ul li.item{width:400px;text-align:center;margin:20px 100px;
    background:#00f;color:#fff;}
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
      font-family: 华文楷体;
      font-size: 15px;
    }
    .btn1:hover{
      background-color:#6DFF61;

    }
    .btn2:hover{
      background-color:#FF2525;

    }
    .divbutton{
      float:left;
      font-family: 华文中宋, serif;
      font-size: 15px;
      position: absolute;
      height:100px;
      width: 25%;
      bottom: 0px;
    }
    .btn{
      bottom:0px;
      position: absolute;
      width:320px ;
      left:600px;
      height: 55px;
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
    table tbody tr:hover{
      background-color: #ccc;
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
    button {

      width: 150px;
      /* height: 30px; */
      text-transform: uppercase;
      border: 3px solid #FFFFFF; /* 设置按钮的边界粗细和颜色 */
      margin-top: 18px; /* 设置合适的上部外框的宽度，增加与上面的password框的距离 */
      text-align: center;
      font-size: 18px; /* 修改按钮文字的大小 */
      /* 设置按钮里面字体颜色 */
      color: black;
      line-height: 50px;
      border-radius: 30px; /* 将按钮的左右边框设置为圆弧 */
      cursor: pointer;
      /* 圆角弧度24px */
      transition:0.2s;
      /* 设置按钮背景为透明 */
      background:white;
    }
    button:hover{
      background-color: #cccccc;
    }

  </style>

</head>


<body  style="background-color: rgb(159,252,253)">



<ul>
  <li><a href="book.jsp">首页</a></li>
  <li  STYLE="background-color: #000000"><a>销售功能</a> </li>
  <li><a class="active"  href="BookServlet">审核购书单</a></li>
  <li><a  href="p3.jsp">开发票</a></li>
  <li  STYLE="background-color: #000000"><a>采购功能</a> </li>
  <li><a href="h1.jsp">登记缺书记录</a></li>
  <li><a href="Book4Servlet">查看缺书单</a></li>
  <li><a href="Pending1Servlet">待购书信息</a></li>
  <li><a href="Pending2Servlet">进书通知书</a></li>
  <li style="float:right"><a  href="worker.jsp">用户</a></li>
</ul>
<form action="${path}/BookServlet">
  <input type="hidden" name="currentPage" value="1">
  <%--  <input type="submit" value="查看">--%>
</form>
<table frame="below" border="1">
<tr>
  <thead>
  <th>编号</th>
  <th>书名</th>
  <th>价格 （单位: 元）</th>
  <th>所缺数量 (单位: 本)</th>
  </thead>
</tr>
  <tbody>
  <c:forEach items="${list}" var="book_lack">
    <tr>
      <td>${book_lack.book_id}</td>
      <td>${book_lack.book_name}</td>
      <td>${book_lack.price}</td>
      <td>${book_lack.number}</td>

    </tr>
  </c:forEach>
  </tbody>
</table>
  <form action="Book3Servlet">
   <button type="submit" href="Book3Servlet" class="btn1">同意</button>

      <button type="submit"  class="btn2"   onclick="book('${book_lack.book_id}')">不同意</button><br></form>

</body>
</html>
