package kr.or.ddit.servlet.scope;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/scope")
public class Scope extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/scope.jsp").forward(req, resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String scopeParameter = req.getParameter("scope");
		
		// request : 속성명 = request, 속성값=scope파라미터값 + "_request"
		req.setAttribute("request", scopeParameter + "_request");
		
		HttpSession session = req.getSession();
		session.setAttribute("session", scopeParameter + "_session");
		
		ServletContext application =  getServletContext();
		application.setAttribute("application", scopeParameter + "_application");
	
		// webapp/jsp/scope.jsp로 forward
		req.getRequestDispatcher("/jsp/scopeResult.jsp").forward(req, resp);
		
	
	}

			
}
