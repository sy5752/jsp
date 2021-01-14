package kr.or.ddit.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;

@WebServlet("/registUser")
public class RegistUser extends HttpServlet{
	private static final Logger logger = LoggerFactory.getLogger(RegistUser.class);
	
	private UserServiceI userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/user/registerUser.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String userid = req.getParameter("userid");
		String usernm = req.getParameter("usernm");
		String pass = req.getParameter("pass");
		String alias = req.getParameter("alias");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String zipcode = req.getParameter("zipcode");
		
		UserVo userVo = new UserVo(userid, usernm, pass, new Date(), alias, addr1, addr2, zipcode);
		int insertCnt = 0;
		 try {
			 insertCnt = userService.registUser(userVo);
		} catch (Exception e) {
			insertCnt =0;
			e.printStackTrace();
		}
		
		if(insertCnt == 1) {
			resp.sendRedirect(req.getContextPath()+"/user?userid=" + userid);
		}
		else {
			req.setAttribute("vo", userVo);
			req.getRequestDispatcher("/user/registerUser.jsp").forward(req, resp);
//			doGet(req, resp);
		}
	}
	
}

		




