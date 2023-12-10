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

@WebServlet(name = "WorkerLoginServlet", value = "/WorkerLoginServlet")
public class WorkerLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("workerid");
        String password = request.getParameter("password");//从前端页面拿到数据

        WorkerService service = new WorkerService();

        Worker worker = service.login(id, password);//在数据库中查询当前id是否存在以及密码是否正确
        PrintWriter out = response.getWriter();
        System.out.println(worker);
        if (worker == null) {//若返回值为null，说明id不存在或者密码错误，即登录失败
            RequestDispatcher dispatcher = request.getRequestDispatcher("workerlogin.jsp");
            out.print("<script language='javascript'>alert('登录失败！该用户不存在或密码错误')</script>");
            dispatcher.include(request, response);
        } else {//返回值不为null，登录成功
            HttpSession session = request.getSession(true);
            session.setAttribute("worker", worker);
            RequestDispatcher dispatcher = request.getRequestDispatcher("book.jsp");
            out.print("<script language='javascript'>alert('登录成功')</script>");
            dispatcher.include(request, response);
        }
    }
}
