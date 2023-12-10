<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path"></c:set>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
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
  <script src="${path}/js/jquery-3.6.4.min.js"></script>
  <script>

    function delBook_purchase(id){

        location.href= "${pageContext.request.contextPath}/Book_purchaseServlet?id=" + id;
    }
  </script>
</head>
<link href="./style.css" rel="stylesheet" type="text/css">
<body  style="background-color: rgb(159,252,253)">
<ul>
  <li><a href="book.jsp">首页</a></li>
  <li  STYLE="background-color: #000000"><a>销售功能</a> </li>
  <li><a  href="BookServlet">审核购书单</a></li>
  <li><a   href="p3.jsp">开发票</a></li>
  <li  STYLE="background-color: #000000"><a>采购功能</a> </li>
  <li><a  href="h1.jsp">登记缺书记录</a></li>
  <li><a   href="Book4Servlet">查看缺书单</a></li>
  <li><a  class="active" href="Pending1Servlet">待购书信息</a></li>
  <li><a href="Pending2Servlet">进书通知书</a></li>
  <li style="float:right"><a  href="worker.jsp">用户</a></li>

</ul>

<table frame="below" border=1>
  <thead>
  <th>编号</th>
  <th>书名</th>
  <th>价格 （单位: 元）</th>
  <th>数量</th>
  <th>购买情况</th>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="book_lack">
    <tr>
      <td>${book_lack.book_id}</td>
      <td>${book_lack.book_name}</td>
      <td>${book_lack.price}</td>
      <td>${book_lack.number}</td>
      <td><a href="javascript:delBook_purchase(${book_lack.book_id})">已购</a> </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<div class="divbutton">
  <center>
    第${paging.page+1}页/共${paging.pagenumber}页<br>

    <a class="previous round" href="Pending1Servlet?page=${paging.indexpage-1}">&#8249;首页</a>
    <a  class="previous" href="Pending1Servlet?page=${paging.page-1 }">&laquo; 上一页</a>
    <a class="next" href="Pending1Servlet?page=${paging.page+1}">下一页 &raquo;</a>
    <a class="next round" href="Pending1Servlet?page=${paging.pagenumber-1}">&#8250;末页</a></center>
</div>
</body>


</html>
