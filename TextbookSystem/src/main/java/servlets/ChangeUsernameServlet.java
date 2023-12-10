package servlets;

import bean.User;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeUsernameServlet", value = "/ChangeUsernameServlet")
public class ChangeUsernameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(true);
        User user = (User) session.getAttribute("user");
        String name=request.getParameter("name");
        user.setUsername(name);
        UserService service=new UserService();
        service.changeName(user.getUserId(),name);

        System.out.println(name);

        PrintWriter out=response.getWriter();
        session.setAttribute("user",user);
        out.write("<script language='javascript'>alert('修改成功')</script>");
        RequestDispatcher dispatcher=request.getRequestDispatcher("user.jsp");
        dispatcher.include(request,response);
    }
}
