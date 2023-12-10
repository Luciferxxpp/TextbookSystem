package servlets;

import bean.Book;
import service.BookService2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddServlet", value = "/AddServlet")
public class AddServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从前端拿到数据
        String bookId = request.getParameter("book_Id");
        String bookName = request.getParameter("book_name");
        String author = request.getParameter("author");
        String press = request.getParameter("press");
        String prise = request.getParameter("price");


        Book book = new Book(Integer.parseInt(bookId),bookName,author,press,Integer.parseInt(prise));

        // System.out.println(book);
        BookService2 service=new BookService2();
        service.addBook(book);

        List<Book> books=service.selectAll();

        HttpSession session= request.getSession(true);
        session.setAttribute("BookLists",books);
        response.sendRedirect(request.getContextPath() + "/book.jsp");


    }
}
