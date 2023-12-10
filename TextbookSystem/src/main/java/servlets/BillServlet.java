package servlets;

import bean.Bill;
import service.BookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/BillServlet")

public class BillServlet extends HttpServlet {
    private Bill bill;
    @Override

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String id= Long.toString(System.currentTimeMillis());
        String cpy_name=request.getParameter("cpy_name");
        int money=Integer.parseInt(request.getParameter("money"));
        bill=new Bill();
        bill.setId(id);
        bill.setCpy_name(cpy_name);
        bill.setMoney(money);
        BookService bookService = new BookService();
        PrintWriter out=response.getWriter();
      try{
        bookService.insertBill(bill);

            RequestDispatcher dispatcher=request.getRequestDispatcher("p3.jsp");
        out.print("<script language='javascript'>alert('提交成功，你的单号为:"+id+"')</script>");
            dispatcher.include(request,response);

        }
        catch (Exception e){
            RequestDispatcher dispatcher=request.getRequestDispatcher("p3.jsp");
            out.print("<script language='javascript'>alert('该编号已存在')</script>");
            dispatcher.include(request,response);

        }
    }
}
