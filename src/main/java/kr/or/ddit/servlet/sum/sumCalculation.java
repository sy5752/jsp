package kr.or.ddit.servlet.sum;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/sumCalculation")
public class sumCalculation extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(sumCalculation.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/sum.jsp").forward(req, resp);
		
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
				
		int start = Integer.parseInt(req.getParameter("start"));
		int end =  Integer.parseInt(req.getParameter("end"));
		
		int sum = 0;
		for(int i=start; i<=end; i++) {
			sum += i;
		}
		logger.debug("start : {}", start);
		logger.debug("end : {}", end);
		logger.debug("sum : {}", sum);
		
		session.setAttribute("start", start);
		session.setAttribute("end", end);
		session.setAttribute("sum", sum);
		
		req.getRequestDispatcher("/jsp/sumResult.jsp").forward(req, resp);
		
		
	}
	
}
