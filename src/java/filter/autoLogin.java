/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lim
 */
@WebFilter(filterName = "autoLogin", urlPatterns = {"/*"})
public class autoLogin implements Filter {

    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        System.out.println("Testing Filter");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
        Cookie[] cookies = httpRequest.getCookies();
        
        // if customer is not logged in and has cookies
        if (!loggedIn && cookies != null) {
            String tokenValue = "";
            
            //find the tokenValue from cookies
            
            //if tokenValue is not empty
            
                // find the tokenValue from db
                    //if the tokenValue in db is same as tokenValue in COokies
                        //set the loggedInCustomer session from the token Customer
                        
                        //update new token in db
                        
                        //update new tokenValue in cookies
        }
        
        
        //if customer is not logged in and do not have cookies
       // else use is login
//       chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        filterConfig = null;
    }

}
