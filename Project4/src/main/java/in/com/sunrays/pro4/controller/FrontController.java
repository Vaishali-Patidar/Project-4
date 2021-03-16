package in.com.sunrays.pro4.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.com.sunrays.pro4.util.ServletUtility;

/**
 * Main Controller performs session checking and logging operations before
 * calling any application controller. It prevents any user to access
 * application without login.
 * @author Vaishali
 *
 */
@WebFilter(filterName ="FrontCtl",urlPatterns={"/ctl/*", "/doc/*"})
	public class FrontController implements Filter {


		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
				throws IOException, ServletException {
			System.out.println("Im in FrontCtrl");
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			
			HttpSession session = req.getSession();

			
			if (session.getAttribute("user") == null) {
			System.out.println("Front");
				
				req.setAttribute("message", " Your Session has been Expired... Please Login Again");

				// Set the URI
				String str = req.getRequestURI();
				System.out.println("uri front--"+ str);
				
				session.setAttribute("uri", str);

				ServletUtility.forward(ORSView.LOGIN_VIEW, req, resp);
				return;
			} else {
				chain.doFilter(req, resp);
			}// TODO Auto-generated method stub
			
		}

		public void init(FilterConfig filterConfig) throws ServletException {
			// TODO Auto-generated method stub
			
		}

		
		public void destroy() {
			// TODO Auto-generated method stub
			
		}

		
}
