package servlets;


import bean.Book_purchase;
import service.BookService;
import nouse.PageUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet( name="PendingServlet",value="/PendingServlet")
public class PendingServlet extends HttpServlet {
    @Override

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        List<Book_purchase> list = null;
        int flat=1;

        int id = Integer.parseInt(request.getParameter("id"));
        flat = Integer.parseInt(request.getParameter("flat"));
        BookService departmentList = new BookService();
        if(flat==1)
            list=departmentList.returnPendingAll();
        else
            list=departmentList.selectPendName(id);




        request.setAttribute("list", list);

        request.getRequestDispatcher("p5.jsp").forward(request, response);
    }
}
