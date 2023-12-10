<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户书库</title>
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
    <style>
        /* 样式表 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        body {
            font-family: Arial, sans-serif;
            background-image: url("img/book.jpg");
            background-size: cover;
            background-position: center;
        }
        .container {
            margin: 0 auto;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        input[type=text] {
            padding: 8px;
            border-radius: 2px;
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type=submit] {
            padding: 8px 16px;
            background-color: #555;
            color: #fff;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        input[type=submit]:hover {
            background-color: #050303;
        }
        .return-btn {
            float: right;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<ul>
    <li><a  class="active" href="bookStack.jsp">首页</a></li>
    <li><a  href="p4.jsp">提交购书单</a></li>
    <li><a  href="Book2Servlet">查看购书表</a> </li>

    <li><a  href="p5.jsp">返回领书单</a></li>

    <li style="float:right"><a  href="user.jsp">用户</a></li>
</ul>
<div class="container">
    <h1>书库</h1>
    <form method="post" action="SearchServlet1">
        <input type="text" placeholder="请输入书名、作者或出版方名称" name="key" id="key">
        <input type="submit" value="搜索">
    </form>
    <c:if test="${empty BookList}">
        <p>无搜索结果</p>
    </c:if>

    <!-- 如果有搜索结果，则显示表格 -->
    <c:if test="${not empty BookList}">
        <table>
            <tr>
                <th>ID</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>价格</th>
                <th>操作</th>

            </tr>
            <c:forEach var="Book" items="${BookList}" >
                <tr>
                    <td>${Book.book_id}</td>
                    <td>${Book.book_name}</td>
                    <td>${Book.author}</td>
                    <td>${Book.press}</td>
                    <td>${Book.price}</td>
                    <td>
                        <form method="post" action="">
                            <input type="hidden" name="bookId" value="${Book.book_id}">
                            <input type="submit" value="购买">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <hr/><hr/>

    <form id="refreshForm" name="refreshForm" method="post" action="printServlet1">
        <input type="submit" name="look" value="查看书籍" >
    </form>
    <table>
        <tr>
            <th>ID</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版方</th>
            <th>价格</th>
            <th> &nbsp;数量</th>
        </tr>

        <%-- 获取书籍信息 --%>
        <c:forEach var="Book" items="${BookLists}" varStatus="loop">
            <tr>
                <td>${Book.book_id}</td>
                <td>${Book.book_name}</td>
                <td>${Book.author}</td>
                <td>${Book.press}</td>
                <td>${Book.price}</td>
                <td>
                    <form method="post" action="">
                        <input type="hidden" name="book_id" value="${Book.book_id}">
                        <input type="hidden" name="book_name" value="${Book.book_name}">
                        <input type="hidden" name="author" value="${Book.author}">
                        <input type="hidden" name="press" value="${Book.press}">
                        <input type="hidden" name="price" value="${Book.price}">
                    </form>
                </td>
                <td>${numbers.get(loop.count-1)}</td>
            </tr>
        </c:forEach>
        <%-- 结束循环 --%>
    </table>
</div>
</body>
</html>
