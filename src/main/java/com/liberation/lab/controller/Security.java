package com.liberation.lab.controller;

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

/**
 * Servlet Filter implementation class Security
 */
@WebFilter(urlPatterns = { "/*" })
public class Security implements Filter {

	/**
	 * Default constructor.
	 */
	public Security() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		// LVL 1 - CHECK IF STATIC CONTENTS
		if (this.isStaticContent(request) == true) {
			chain.doFilter(request, response);
		} else {

			// LVL 2 - CHECK IF ANNONYMOUS ACCESS
			if (this.isAnnonymous(request) == true) {
				session.removeAttribute("loginRequiredMessage");
				chain.doFilter(request, response);
			} else {
				// LVL 3 - LOG IN REQUIRED - NOW CHECK LOGIN
				if (this.isLoggedIn(request) != true) {
					session.setAttribute("loginRequiredMessage", "You have to log in first.");
					session.removeAttribute("loginErrorMessage");
					req.getRequestDispatcher("/login").forward(req, res);
				}
				// LVL 4 - USER HAS ALREADY LOGGED IN - NOW CHECK AUTHORITIES
				else {
					if (this.isAuthorityGranted(request) != true) {
						session.setAttribute("authorityErrorMessage", "You don't have permission to access this page.");
						req.getRequestDispatcher("/403").forward(req, res);
					} else {
						chain.doFilter(request, response);
					}

				}
			}
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	// 1ST LEVEL - STATIC CONTENT
	public boolean isStaticContent(ServletRequest request) {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);

		String servletPath = req.getServletPath();
		if (servletPath.startsWith("/resources/")) {
			// AUTHORITIES REQUIRED
			return true;
		} else
			return false;
	}

	// 2ND LEVEL - ANNONYMOUS ACCEPTED
	public boolean isAnnonymous(ServletRequest request) {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);
		String servletPath = req.getServletPath();
		String requestURI = req.getRequestURI();
		String requestURL = req.getRequestURL().toString();

		if (servletPath.startsWith("/core") || servletPath.startsWith("/admin")
				|| servletPath.startsWith("/contentManager") || servletPath.startsWith("/trading")
				|| servletPath.startsWith("/user")) {
			// AUTHORITIES REQUIRED
			session.setAttribute("currentDemandingServletPath", servletPath);
			session.setAttribute("currentDemandingURI", requestURI);
			session.setAttribute("currentDemandingURL", requestURL);

			System.out.println("ACCESS AUTHORITIES REQUIRED! ATTEMPTING CONNECT TO:" + requestURI);
			return false;
		} else {
			// ANNONYMOUS REQUEST - INCLUDING:
			// /login
			// /home
			// /logout
			// /article/**
			System.out.println("ANNONYMOUS CONNECT ACCEPTED! ATTEMPTING CONNECT TO :" + requestURI);
			return true;
		}
	}

	// 3RD LEVEL - LOG IN REQUIRED
	public boolean isLoggedIn(ServletRequest request) {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);

		if (session.getAttribute("userId") != null) {
			// USER'S ALREADY LOGGED IN
			return true;
		} else {
			// USER HASN'T LOGGED IN YET
			return false;
		}
	}

	// 4RD LEVEL - AUTHORIRIES REQUIRED
	public boolean isAuthorityGranted(ServletRequest request) {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);

		if (session.getAttribute("userRoleList") != null) {
			// USER'S ALREADY LOGGED IN & HAVING ROLE LIST
			String userCurrentRole = session.getAttribute("userRoleList").toString();
			System.out.println(userCurrentRole);
			String servletPath = req.getServletPath();

			// 1. USER INFO
			if (servletPath.startsWith("/user/")) {
				if (userCurrentRole.contains("CUSTOMER")||userCurrentRole.contains("NEWS_MANAGER") || userCurrentRole.contains("SYSTEM_MANAGER"))
					return true;
			}

			// 2. TRADING
			if (servletPath.startsWith("/trading/")) {
				if (userCurrentRole.contains("CUSTOMER"))
					return true;
			}

			// 3. NEW MANAGER
			if (servletPath.startsWith("/contentManager/")) {
				if (userCurrentRole.contains("NEWS_MANAGER") || userCurrentRole.contains("SYSTEM_MANAGER"))
					return true;
			}

			// 4. SYSTEM MANAGER
			if (servletPath.startsWith("/system/")) {
				if (userCurrentRole.contains("SYSTEM_MANAGER"))
					return true;
			}

			// 5. ADMIN DASHBOARD
			if (servletPath.startsWith("/admin")) {
				if (userCurrentRole.contains("NEWS_MANAGER") || userCurrentRole.contains("SYSTEM_MANAGER"))
					return true;
			}

			// 6. CORE ENGINE
			if (servletPath.startsWith("/core/")) {
				if (userCurrentRole.contains("SYSTEM_MANAGER"))
					return true;
			}

			// DOESN'T MATCH ANY ROLE
			return false;
		} else {
			// CAN'T GET USER'S ROLE LIST
			return false;
		}
	}

}
