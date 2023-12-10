//package nouse;
//
//
//
//import java.util.*;
//
//import bean.Book_purchase;
//import service.BookService;
//import nouse.PageUtil;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet(name = "Book1Servlet", value = "/Book1Servlet")
//
//public class Book1Servlet extends HttpServlet {
//    @Override
//
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//     doPost(request,response);
////    }
//
//    @Override
//    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//        BookService bookService = new BookService();
//        List<Book_purchase> list=bookService.lackBook();
//        PageUtil pageUtil = new PageUtil(5, list.size(), 1);
//        List<Book_purchase> list1=new ArrayList<>();
//        for (int i = pageUtil.getFromIndex(); i < pageUtil.getToIndex(); i++) {
//            list1.add(list.get(i));
//        }
//
//
//        HttpSession session = request.getSession();
//        request.setAttribute("list", list1);
//        request.setAttribute("pageUtil", pageUtil);
//        request.getRequestDispatcher("p1.jsp").forward(request, response);
//
//
//    }
//}
