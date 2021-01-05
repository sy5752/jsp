package kr.or.ddit.servlet.mul;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/mulCal")
public class mulCalculation extends HttpServlet{
	private static final Logger logger = LoggerFactory.getLogger(mulCalculation.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/mul.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int start = Integer.parseInt(req.getParameter("start"));
		
		
		int end = Integer.parseInt(req.getParameter("end"));
		
		
		int mul = 0;
		
		mul = start*end;
		logger.debug("start*end :{}", mul);
		
		session.setAttribute("start", start);
		session.setAttribute("end", end);
		session.setAttribute("mul", mul);
		
		req.getRequestDispatcher("/jsp/mulResult.jsp").forward(req, resp);
	
	}
	
}
