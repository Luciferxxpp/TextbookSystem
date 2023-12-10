

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
  <title>教师/学生登录页面</title>
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
      height:100px;
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

  </style>

<%--  <script>--%>
<%--    $(function(){--%>
<%--      $("#btn2").click(function(){--%>
<%--        var pageNum=$("#pageNum").val();--%>
<%--        var pw=$("#").val();--%>

<%--        $.ajax({--%>
<%--          type:"post",--%>
<%--          url:"Book",--%>
<%--          data:{"name":nm,"password":pw},--%>
<%--          dataType:"text",--%>
<%--          success:function(data) {--%>
<%--            alert("提交成功"+data);--%>
<%--            $("#div1").html("<h2>"+data+"</h2>");--%>
<%--          },--%>
<%--          error:function(message) {--%>
<%--            alert("提交失败");--%>
<%--          }--%>
<%--        })--%>
<%--      })--%>
<%--    })--%>
<%--  </script>--%>
</head>

<body  style="background-color: rgb(159,252,253)">


<ul>
  <li><a  href="bookStack.jsp">首页</a></li>
  <li><a    href="p4.jsp">提交购书单</a></li>
  <li><a  class="active" href="Book2Servlet">查看购书表</a> </li>

  <li><a  href="p5.jsp">返回领书单</a></li>

  <li style="float:right"><a  href="user.jsp">用户</a></li>
</ul>
<%--<form action="${path}/BookServlet">--%>
<%--  <input type="hidden" name="currentPage" value="1">--%>
<%--  &lt;%&ndash;  <input type="submit" value="查看">&ndash;%&gt;--%>
<%--</form>--%>
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

</body>
<script src="js/jquery-3.6.4.min.js" type="text/javascript" charset="utf-8"></script>
</html>
