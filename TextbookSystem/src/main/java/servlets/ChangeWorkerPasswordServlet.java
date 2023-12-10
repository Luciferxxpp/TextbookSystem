package servlets;

import bean.Worker;
import service.WorkerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeWorkerPasswordServlet", value = "/ChangeWorkerPasswordServlet")
public class ChangeWorkerPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password");

        HttpSession session = request.getSession(true);

        Worker worker = (Worker) session.getAttribute("worker");

        WorkerService service = new WorkerService();
        service.changePassword(worker.getWorkerId(), password);

        worker.setPassword(password);

        session.setAttribute("worker", worker); //将修改后的员工写入session
        PrintWriter out = response.getWriter();
        out.write("<script language='javascript'>alert('修改成功')</script>");
        RequestDispatcher dispatcher = request.getRequestDispatcher("worker.jsp");
        dispatcher.include(request, response);
    }
}
