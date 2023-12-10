package servlets;

import bean.Book_lack;
import service.Book_lackService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;



@WebServlet(name = "Book_lackServlet", value = "/Book_lackServlet")
public class Book_lackServlet extends HttpServlet {

    private Book_lack book_lack;

    private int book_id=0;
    private  int price=0;
    private  int number=0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Book_lackService bookService = new Book_lackService();
        Integer n1 = Integer.parseInt(request.getParameter("book_id"));
        int book_id=n1.intValue();
        Integer n3= Integer.parseInt(request.getParameter("number"));
        int number=n3.intValue();

        book_lack = new Book_lack();
        book_lack.setBook_id(book_id);
        book_lack.setNumber(number);
        Book_lack a=bookService.select(book_id);

        try {
            String book_name=bookService.select2(book_id);
            int price=bookService.select3(book_id);
            book_lack.setBook_name(book_name);
            book_lack.setPrice(price);
            if(a==null) {
                    PrintWriter out = response.getWriter();

                    bookService.insert(book_lack);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("h1.jsp");
                    out.write("<script language='javascript'>alert('登记成功')</script>");
                    dispatcher.include(request, response);
                }
            else {
                    bookService.update(book_id, book_name, price, number);
                    PrintWriter out = response.getWriter();
                    RequestDispatcher dispatcher = request.getRequestDispatcher("h1.jsp");
                    out.write("<script language='javascript'>alert('修改成功')</script>");
                    dispatcher.include(request, response);
                }

        }
        catch (Exception e) {
                PrintWriter out = response.getWriter();
                RequestDispatcher dispatcher = request.getRequestDispatcher("h1.jsp");
                out.write("<script language='javascript'>alert('书库没有此书编号，请在书库登记此书')</script>");
                dispatcher.include(request, response);
            }
        }




}