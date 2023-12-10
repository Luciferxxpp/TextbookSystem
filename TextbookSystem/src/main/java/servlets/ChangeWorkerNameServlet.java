package servlets;

import bean.Worker;
import service.WorkerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeWorkerNameServlet", value = "/ChangeWorkerNameServlet")
public class ChangeWorkerNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name=request.getParameter("name");

        HttpSession session=request.getSession(true);
        Worker worker= (Worker) session.getAttribute("worker");//从session中拿到当前登录的员工
        worker.setWorkerName(name);//将当前员工的用户名设置为新修改的用户名

        WorkerService service=new WorkerService();
        service.changeName(worker.getWorkerId(),name);//修改数据库

        session.setAttribute("worker",worker); //将修改后的员工写入session
        PrintWriter out=response.getWriter();
        out.write("<script language='javascript'>alert('修改成功')</script>");
        RequestDispatcher dispatcher=request.getRequestDispatcher("worker.jsp");
        dispatcher.include(request,response);

    }
}
