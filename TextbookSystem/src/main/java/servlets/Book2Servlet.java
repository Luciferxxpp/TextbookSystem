package servlets;


import bean.Book_purchase;
import service.BookService;
import util.Paging;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "Book2Servlet", value = "/Book2Servlet")
public class Book2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
        BookService bookService = new BookService();
        List<Book_purchase> list=bookService.bookPurchases();


        //将paging对象其设置在作用域中，以便后面页面调用

        request.setAttribute("list", list);
        request.getRequestDispatcher("p6.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

}

