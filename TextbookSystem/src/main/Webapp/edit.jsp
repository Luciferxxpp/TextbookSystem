<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑图书</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            background-color: #f8f8f8;
        }
        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        label {
            display: inline-block;
            width: 100px;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 200px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
<h2>编辑图书</h2>
<%
    String bookId = request.getParameter("book_id");
    String bookName = request.getParameter("book_name");
    String author = request.getParameter("author");
    String press = request.getParameter("press");
    String price = request.getParameter("price");
%>

<form method="post" action="UpdateServlet">
    <p>
        <label for="bookId">编号：</label>
        <input type="text" name="bookId" id="bookId" value="<%= bookId %>" />
    </p>
    <p>
        <label for="bookName">图书名称：</label>
        <input type="text" name="bookName" id="bookName" value="<%= bookName %>" />
    </p>
    <p>
        <label for="author">作者：</label>
        <input type="text" name="author" id="author" value="<%= author %>" />
    </p>
    <p>
        <label for="press">出版社：</label>
        <input type="text" name="press" id="press" value="<%= press %>"/>
    </p>
    <p>
        <label for="price">价格：</label>
        <input type="text" name="price" id="price"value="<%= price %>"/>
    </p>
    <p>
        <input type="submit" value="保存" />
    </p>
</form>
</body>
</html>
