package servlets;

import bean.Book;
import bean.Worker;
import service.BookService;
import service.BookService2;
import service.WorkerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet1", value = "/SearchServlet1")
public class SearchServlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String key = request.getParameter("key");
        BookService2 service=new BookService2();

        List<Book> book=service.searchBook(key);
        HttpSession session= request.getSession(true);
        session.setAttribute("BookList",book);
        response.sendRedirect(request.getContextPath() + "/bookStack.jsp");


    }
}
