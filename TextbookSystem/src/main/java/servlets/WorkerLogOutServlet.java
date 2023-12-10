package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WorkerLogOutServlet", value = "/WorkerLogOutServlet")
public class WorkerLogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(true);
        session.setAttribute("worker",null);

        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
        dispatcher.include(request,response);
    }
}
