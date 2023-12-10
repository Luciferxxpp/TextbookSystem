//package nouse;
//
//import bean.Book_purchase;
//import service.BookService;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "SubmitServlet", value = "/SubmitServlet")
//
//public class SubmitServlet extends HttpServlet {
//    @Override
//
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request,response);
//
//    }
//    @Override
//
//    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        BookService bookService = new BookService();
//        List<Book_purchase> list=bookService.lackBook();
//        request.setAttribute("list", list);
//        request.getRequestDispatcher("p2.jsp").forward(request, response);
//
//
//    }
//
//}
