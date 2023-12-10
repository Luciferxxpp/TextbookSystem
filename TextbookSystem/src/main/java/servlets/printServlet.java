package servlets;

import bean.Book;
import service.BookService2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "printServlet", value = "/printServlet")
public class printServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookService2 service=new BookService2();

        List<Book> books=service.selectAll();
        HttpSession session= request.getSession(true);
        List<Integer> numbers = service.selectNumber(books);
        session.setAttribute("BookLists",books);
        session.setAttribute("numbers", numbers);
        response.sendRedirect(request.getContextPath() + "/book.jsp");
    }
}
