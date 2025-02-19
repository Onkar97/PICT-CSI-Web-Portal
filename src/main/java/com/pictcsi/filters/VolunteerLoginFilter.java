package com.pictcsi.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/volunteer/*")
public class VolunteerLoginFilter implements Filter {

    List<String> allowedUrls;

    public VolunteerLoginFilter() {
        super();
        allowedUrls = new ArrayList<>();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterUrl((HttpServletRequest) servletRequest, (HttpServletResponse) servletResponse, filterChain, allowedUrls);
    }

    static void filterUrl(HttpServletRequest servletRequest, HttpServletResponse servletResponse, FilterChain filterChain, List<String> allowedUrls) throws IOException, ServletException {

        if(!allowedUrls.contains(servletRequest.getServletPath())) {

            HttpSession session = servletRequest.getSession();
            if (session != null) {
                String user_name = (String) session.getAttribute("user_name");
                String accessType = (String) session.getAttribute("user_type");
                if (user_name != null && !user_name.isEmpty()
                        && accessType!= null && (accessType.equals("volunteer") || accessType.equals("admin") )) {
//                    System.out.println("USER EXISTS" + user_name);
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    servletResponse.sendRedirect("/index.jsp");

                }
            }
        }
    }

    @Override
    public void destroy() {

    }
}
