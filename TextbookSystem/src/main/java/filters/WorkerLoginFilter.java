package filters;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "WorkerLoginFilter", urlPatterns = {"/h1.jsp","/h2.jsp","/h3.jsp","/h4.jsp","/book.jsp","/p2.jsp","/p3.jsp"})
public class WorkerLoginFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
        Filter.super.init(config);
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        PrintWriter out = resp.getWriter();
        String requestURI = req.getRequestURI();        //获得发出请求的客户端URL地址
        String contextPath = req.getContextPath();

        HttpSession session = req.getSession(true);

        System.out.println(requestURI);
        //如果是login页面或验证页面，则不过滤，直接放行。
        if (requestURI.equals("workerlogin.jsp")) {
            chain.doFilter(request, response);        //直接放行
        } else { //如果不是login页面，则过滤后再放行
            if (session.getAttribute("worker") == null) {
                RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
                out.write("<script language='javascript'>alert('尊敬的用户，您要访问的网络资源，需要管理员权限才能访问。')</script>");
                dispatcher.include(req, resp);
            } else {
                chain.doFilter(request, response);
            }
        }
    }
}
