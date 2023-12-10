package servlets;

import bean.Book;
import service.BookService2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取要编辑的书籍的ID
        String bookId = request.getParameter("bookId");
        // 根据ID获取对应的Book对象
        BookService2 service = new BookService2();
        Book book = service.selectById(Integer.parseInt(bookId));
        // 获取表单数据
        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        String press = request.getParameter("press");
        String price = request.getParameter("price");

        // 更新Book对象
        book.setBook_name(bookName);
        book.setAuthor(author);
        book.setPress(press);
        book.setPrice(Integer.parseInt(price));

        // 通过BookService2类的updateBook方法将更新后的Book对象更新到数据库中
        service.updateBook(book);

        // 将更新后的书籍列表存储在session中，并重定向到书籍列表页面
        List<Book> books = service.selectAll();
        HttpSession session = request.getSession(true);
        session.setAttribute("BookLists", books);
        response.sendRedirect(request.getContextPath() + "/book.jsp");
    }

}
