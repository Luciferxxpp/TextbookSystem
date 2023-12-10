package servlets;

import bean.User;
import service.UserService;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //从前端拿到数据
        String id = request.getParameter("userid");
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String profession = request.getParameter("profession");


        User user = new User(id, name, password, gender, profession);//创建user对象

        //System.out.println(user);

        UserService userService = new UserService();
        boolean flag = userService.register(user);//注册，返回值为true，注册成功，false注册失败
        PrintWriter out = response.getWriter();
        if(!flag){
            RequestDispatcher dispatcher=request.getRequestDispatcher("register.jsp");
            out.write("<script language='javascript'>alert('注册失败，该账号已经注册')</script>");
            dispatcher.include(request,response);

        }else {
            out.write("<script language='javascript'>alert('注册成功')</script>");
            RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
            dispatcher.include(request,response);
        }

    }
}
