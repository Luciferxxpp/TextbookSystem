<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员书库</title>
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
    </style>
    <style type="text/css">
        /* 界面美化样式 */
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            background-color: #f2f2f2;
        }

        #header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        #content {
            margin: 20px auto;
            width: 80%;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 搜索框样式 */
        #search-form {
            margin-bottom: 10px;
        }

        #search-form input[type=text] {
            width: 80%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
        }

        #search-form input[type=submit] {
            width: 20%;
            background-color: #333;
            color: #fff;
            padding: 12px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #search-form input[type=submit]:hover {
            background-color: #555;
        }

        /* 添加书籍表单样式 */
        #add-form {
            display: none;
        }

        #add-form input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
        }

        #add-form input[type=submit] {
            background-color: #333;
            color: #fff;
            padding: 12px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #add-form input[type=submit]:hover {
            background-color: #555;
        }
        .return-btn {
            float: right;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<ul>

    <li><a class="active" href="book.jsp">首页</a></li>
    <li STYLE="background-color: #000000"><a>销售功能:</a> </li>
    <li><a  href="BookServlet">审核购书单</a></li>
    <li><a  href="p3.jsp">开发票</a></li>
    <li STYLE="background-color: #000000"><a>采购功能</a> </li>
    <li><a href="h1.jsp">登记缺书记录</a></li>
    <li><a href="Book4Servlet">查看缺书单</a></li>
    <li><a href="Pending1Servlet">待购书信息</a></li>
    <li><a href="Pending2Servlet">进书通知书</a></li>

    <li style="float:right"><a  href="worker.jsp">当前用户</a></li>

</ul>
<div id="header">
    <h1>书库</h1>
</div>
<div id="content">
    <h2>书库列表</h2>
    <div id="search-form">
        <form method="post" action="SearchServlet">
            <input type="text" placeholder="输入书名、作者或出版社进行搜索" name="key" id="key">
            <input type="submit" value="搜索">
        </form>
    </div>

    <!-- 在标签中遍历搜索结果 -->
    <!-- 判断是否有搜索结果，如果没有则不显示表格 -->
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
            <c:forEach var="Book" items="${BookList}">
                
                <tr>
                    <td>${Book.book_id}</td>
                    <td>${Book.book_name}</td>
                    <td>${Book.author}</td>
                    <td>${Book.press}</td>
                    <td>${Book.price}</td>

                    <td>
                        <form method="post" action="">
                            <input type="submit" value="">
                        </form>
                        <form method="post" action="">
                            <input type="hidden" name="bookId" value="${Book.book_id}">
                            <input type="submit" name="deleteId" value="">
                        </form>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </c:if>

    <hr/>    <hr/>

    <button onclick="showAddForm()">添加书籍</button>
    <div id="add-form">
        <form method="post" action="AddServlet">
            <label>编号：</label>
            <input type="text" name="book_Id" id="BookId"><br>
            <label>书名：</label>
            <input type="text" name="book_name" id="BookName"><br>
            <label>作者：</label>
            <input type="text" name="author" id="Author"><br>
            <label>出版社：</label>
            <input type="text" name="press" id="Press"><br>
            <label>价格：</label>
            <input type="text" name="price" id="Price"><br>
            <input type="submit" value="添加">
            <button type="button" onclick="hideAddForm()">取消</button>
        </form>
    </div>

    <form id="refreshForm" name="refreshForm" method="post" action="printServlet">
        <input type="submit" value="刷新" >
    </form>
    <table>
        <tr>
            <th>ID</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>价格</th>
            <th>操作</th>
            <th>数量</th>
        </tr>
        <c:forEach var="Book" items="${BookLists}"   varStatus="loop">
            <tr>
                <td>${Book.book_id}</td>
                <td>${Book.book_name}</td>
                <td>${Book.author}</td>
                <td>${Book.press}</td>
                <td>${Book.price}</td>
                <td>
                    <form method="post" action="edit.jsp">
                        <input type="hidden" name="book_id" value="${Book.book_id}">
                        <input type="hidden" name="book_name" value="${Book.book_name}">
                        <input type="hidden" name="author" value="${Book.author}">
                        <input type="hidden" name="press" value="${Book.press}">
                        <input type="hidden" name="price" value="${Book.price}">
                        <input type="submit" value="编辑">
                    </form>
                    <!-- 添加一个表单，用于提交删除操作 -->
                    <form method="post" action="DeleteServlet">
                        <!-- 添加一个隐藏输入字段，用于传递bookId -->
                        <input type="hidden" name="bookId" value="${Book.book_id}">
                        <input type="submit" name="deleteId" value="删除">
                    </form>
                </td>
                <td>${numbers.get(loop.count-1)}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<script type="text/javascript">
    function showAddForm() {
        document.getElementById("add-form").style.display = "block";
    }

    function hideAddForm() {
        document.getElementById("add-form").style.display = "none";
    }

    function deleteBook(id) {
        if (confirm("确定删除该书籍吗？")) {
            window.location.href = "${pageContext.request.contextPath}/book/delete?id=" + id;
        }
    }
    function deleteBook(bookId) {
        if (confirm("确定要删除吗？")) {
            $.ajax({
                url: "deleteBook",
                type: "post",
                data: {book_id: bookId},
                success: function () {
                    alert("删除成功！");
                    location.reload();
                },
                error: function () {
                    alert("删除失败！");
                }
            });
        }
    }
</script>
</body>
</html>
