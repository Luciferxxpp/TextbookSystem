package servlets;

import bean.Book_purchase;
import bean.idname;
import service.BookService;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PurchaseServlet", value = "/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
    private Book_purchase purchase;
    private int book_id=0;
    private  int price=0;
    private  int number=0;



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BookService bookService = new BookService();
        Book_lackService book2Service = new Book_lackService();
        int Bookid = Integer.parseInt(request.getParameter("book_id"));
        String name=book2Service.select2(Bookid);
        int price = book2Service.select3(Bookid);
        int number= Integer.parseInt(request.getParameter("number"));

         purchase=new Book_purchase();
         purchase.setBook_id(Bookid);
         purchase.setBook_name(name);
         purchase.setPrice(price);
         purchase.setNumber(number);
        HttpSession session = request.getSession(true);
        List<idname> list1=new ArrayList<>();
        idname t=new idname(Bookid,number);
        list1.add(t);
       String id =  (String)session.getAttribute("id");
        purchase.setId(id);
        PrintWriter out=response.getWriter();


           int number1=bookService.selectBook(Bookid);
        number=number1-number;
               if(number<0){
                   RequestDispatcher dispatcher = request.getRequestDispatcher("p4.jsp");
                   out.print("<script language='javascript'>alert('该书库存不足，请提醒采购人员')</script>");
                   dispatcher.include(request, response);

               }

               else {

                   try {

                       bookService.insert(purchase);
                       RequestDispatcher dispatcher = request.getRequestDispatcher("p4.jsp");
                       out.print("<script language='javascript'>alert('提交成功！')</script>");
                       dispatcher.include(request, response);
                   } catch (Exception e) {

                       bookService.update(purchase);
                       RequestDispatcher dispatcher = request.getRequestDispatcher("p4.jsp");
                       out.print("<script language='javascript'>alert('修改成功！')</script>");
                       dispatcher.include(request, response);

                   }
               }

    }
}
