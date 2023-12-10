package servlets;

import bean.Bill;
import bean.Book_purchase;
import service.BookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/Book3Servlet")

public class Book3Servlet extends HttpServlet {
    private Bill bill;

    @Override

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        BookService service=new BookService();
        List<Book_purchase> list=service.bookPurchases();
        PrintWriter out=response.getWriter();
//        if(list!=null)
//        System.out.print(list.get(1));
        try {
            for(int i = 0; i < list.size(); i++)
                service.insertPendingAll(list.get(i));

            service.deleteall1();
            RequestDispatcher dispatcher=request.getRequestDispatcher("p2.jsp");
            out.print("<script language='javascript'>alert('提交成功')</script>");
            dispatcher.include(request,response);

        }
        catch (Exception e){
            RequestDispatcher dispatcher=request.getRequestDispatcher("p2.jsp");
            out.print("<script language='javascript'>alert('提交失败或者请勿重复提交')</script>");
            dispatcher.include(request,response);
        }

    }

}