package servlets;

import bean.Book;
import service.BookService2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bookId = request.getParameter("bookId");

        BookService2 service = new BookService2();
        service.deleteBookById(Integer.parseInt(bookId));

        // 将更新后的书籍列表存储在session中，并重定向到书籍列表页面
        List<Book> books = service.selectAll();
        HttpSession session = request.getSession(true);
        session.setAttribute("BookLists", books);
        response.sendRedirect(request.getContextPath() + "/book.jsp");

    }
}
