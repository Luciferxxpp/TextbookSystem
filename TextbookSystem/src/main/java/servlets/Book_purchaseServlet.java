package servlets;


import bean.Book_lack;
import bean.In_storage;
import bean.Worker;
import service.Book_lackService;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Book_purchaseServlet", value = "/Book_purchaseServlet")
public class Book_purchaseServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookid = request.getParameter("id");
        int ID = Integer.parseInt(bookid);
        HttpSession session=request.getSession(true);
        Worker worker= (Worker) session.getAttribute("worker");
        String id= worker.getWorkerId();


        Book_lackService book_lackService = new Book_lackService();
        int num = book_lackService.selectnum(ID);
        int num2 = book_lackService.selectnum2(ID);
        int num3 = num + num2;
        book_lackService.updatenum(num3, ID);
        Book_lack book_lack = book_lackService.select(ID);
        In_storage inStorage = new In_storage();
        inStorage.setId(id);
        inStorage.setBook_id(book_lack.getBook_id());
        inStorage.setBook_name(book_lack.getBook_name());
        inStorage.setPrice(book_lack.getPrice());
        inStorage.setNumber(book_lack.getNumber());
        try {
            PrintWriter out = response.getWriter();
            book_lackService.insert2(inStorage);
            Book_lackService bookService = new Book_lackService();
            bookService.delete(ID);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Pending1Servlet");
            out.write("<script language='javascript'>alert('购买成功')</script>");
            dispatcher.include(request, response);

        }
        catch (Exception e){
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("Pending1Servlet");
            out.write("<script language='javascript'>alert('近期已购买此书，请确认进书通知书')</script>");
            dispatcher.include(request, response);
        }

    }
}