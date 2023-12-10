<%--<jsp:useBean id="pageUtil" scope="request" type="com.sun.rowset.internal.SyncResolverImpl"/>--%>


<%--
  Created by IntelliJ IDEA.
  User: 张大神
  Date: 2023/5/16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"></c:set>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>

<html>
<head>
  <style div="nav">  *{margin:0;padding:0;} ul,li{list-style:none;} #content {width:600px;margin:0 auto;border:1px solid #f00;} ul li.item{width:400px;text-align:center;margin:20px 100px;background:#00f;color:#fff;}
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
    label{
      font-family: 华文楷体;
      font-size: 15px;
    }
    * {
      box-sizing: border-box;
    }

    form.example input[type=text] {
      padding: 10px;
      font-size: 17px;
      border: 1px solid grey;
      float: left;
      width: 80%;
      background: #f1f1f1;
    }

    form.example button {
      float: left;
      width: 20%;
      padding: 10px;
      background: #2196F3;
      color: white;
      font-size: 17px;
      border: 1px solid grey;
      border-left: none;
      cursor: pointer;
    }

    form.example button:hover {
      background: #0b7dda;
    }

    form.example::after {
      content: "";
      clear: both;
      display: table;
    }
    from{
      width: 30%;
    }
    .divbutton{
      font-family: 华文中宋, serif;
      font-size: 15px;
      position: absolute;
      height:50px;
      width: 50%;
      bottom: 0px;
      float: left;
    }
    .excel{
      position: absolute;
      float:right;
      bottom: 0px;
      right:0px;
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
    input{
      width:70px ;
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
      background-color: #EBEBEB;
    }



  </style>

</head>

<body  style="background-color: rgb(159,252,253)">
<ul>
  <li><a  href="bookStack.jsp">首页</a></li>
  <li><a    href="p4.jsp">提交购书单</a></li>
  <li><a  href="Book2Servlet">查看购书表</a> </li>

  <li><a   class="active"href="p5.jsp">返回领书单</a></li>

  <li style="float:right"><a  href="user.jsp">用户</a></li>
  </ul>
<form action="${path}/PendingServlet">
  <input type="hidden"  name="id"  value="1">
  <input type="hidden" name="currentPage" value="1">
  <input type="hidden" name="flat" value="1">
    <input type="submit" value="查看全部" id="btn2">
</form>
<form action="${path}/PendingServlet">

  <input type="text"  placeholder="购书人编号.."  name="id"  value="${param.id}">
  <input type="hidden" name="currentPage" value="1">
  <input type="hidden" name="flat" value="0">
  <input type="submit" value="查询" id="btn1">
</form>

  <table frame="below" border=1>
    <thead>
    <tr>
      <th>编号</th>
      <th>书名</th>
      <th>价格 （单位: 元）</th>
      <th>数量 （单位: 本）</th>
      <th>购书人id</th>
    </tr>
    </thead>
    <tbody>
<%--    <jsp:useBean id="list" scope="request" type="java.util.List"/>--%>
    <c:forEach items="${list}" var="pending_purchase">
      <tr>
        <td>${pending_purchase.book_id}</td>
        <td>${pending_purchase.book_name}</td>
        <td>${pending_purchase.price}</td>
        <td>${pending_purchase.number}</td>
        <td>${pending_purchase.id}</td>
      </tr>
    </c:forEach>

    </tbody>
  </table>


</body>
</html>
