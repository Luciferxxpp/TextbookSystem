package filters;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;


@WebFilter(filterName = "EncodingFilter", urlPatterns = {"/*"},
        initParams = {@WebInitParam(name = "language", value = "java"), @WebInitParam(name = "encoding", value = "utf-8")})
public class EncodingFilter implements Filter {

    private String encoding = "utf-8";


    public EncodingFilter() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String filterName = filterConfig.getFilterName();
        String initParam1 = filterConfig.getInitParameter("language");
        String initParam2 = filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        servletRequest.setCharacterEncoding(encoding);

        servletResponse.setCharacterEncoding(encoding);
        servletResponse.setContentType("text/html;charset=utf-8");

        filterChain.doFilter(servletRequest, servletResponse);

    }

    @Override
    public void destroy() {
        System.out.println("------end-------");
        encoding = null;
    }

}

