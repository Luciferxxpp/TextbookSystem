package servlets;

import bean.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("userid");
        String password = request.getParameter("password");

        System.out.println(id);
        UserService userService = new UserService();
        User user = userService.login(id, password);

        HttpSession session=request.getSession(true);
        session.setAttribute("user",user);
        session.setAttribute("id",id);
        System.out.println(user);

        PrintWriter out=response.getWriter();
        if(user==null){
            RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
            out.write("<script language='javascript'>alert('登录失败！该用户不存在或密码错误')</script>");
            dispatcher.include(request,response);
        }else {
            RequestDispatcher dispatcher=request.getRequestDispatcher("bookStack.jsp");
            dispatcher.include(request,response);
            System.out.println("登录成功");
        }

    }
}
