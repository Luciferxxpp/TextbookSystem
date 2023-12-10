import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/HelloServlet")
public class hello implements Servlet {

    public void init(ServletConfig servletConfig) throws ServletException {

    }


    public ServletConfig getServletConfig() {
        return null;
    }
 @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        servletResponse.setContentType("text/html;charset=utf-8");
        //servletResponse.setCharacterEncoding("UTF-8");
        PrintWriter out = servletResponse.getWriter();
        out.println("这是我们的Servlet页面，Hello！！！");
        System.out.println("1111");
    }


    public String getServletInfo() {
        return null;
    }


    public void destroy() {

    }
}
