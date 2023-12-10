package servlets;

import bean.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangeProfessionServlet", value = "/ChangeProfessionServlet")
public class ChangeProfessionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String profession=request.getParameter("profession");
        HttpSession session=request.getSession(true);
        User user = (User) session.getAttribute("user");

        user.setProfession(profession);

        UserService service=new UserService();
        service.changeProfession(user.getUserId(),profession);


    }
}
