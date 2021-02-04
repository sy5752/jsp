package kr.or.ddit.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;
import kr.or.ddit.util.FileUtil;

@WebServlet("/registUser")
@MultipartConfig
public class RegistUser extends HttpServlet{
	private static final Logger logger = LoggerFactory.getLogger(RegistUser.class);
	
	private UserServiceI userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/user/registUser.jsp").forward(req, resp);
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
		
		// 사용자가 profile을 업로드 한 경우
		// 전송한 파일이름(filename)
		// 파일 확장자
		// 서버에 저장할 파일 이름(realfilename)
		// 서버에 지정된 공간에 저장
		Part profile = req.getPart("profile");
		
		String filename = "";
		String realfilename = "";
		
		if(profile.getSize() > 0){
			filename = FileUtil.getFileName(profile.getHeader("Content-Disposition"));
			String fileExtension = FileUtil.getFileExtension(filename);
			//brown / brown.png
			 realfilename = UUID.randomUUID().toString() + fileExtension;
			
			profile.write("d:\\upload\\"+realfilename);
		}
		
		UserVo userVo = new UserVo(userid, usernm, pass, new Date(), alias, addr1, addr2, zipcode, filename, realfilename);
		
		int insertCnt = 0;
		 try {
			 insertCnt = userService.registUser(userVo);
		} catch (Exception e) {
			insertCnt =0;
			e.printStackTrace();
		}
		
		if(insertCnt == 1) {
			resp.sendRedirect(req.getContextPath()+"/pagingUser");
		}
		else {
			req.setAttribute("vo", userVo);
//			req.getRequestDispatcher("/user/registUser.jsp").forward(req, resp);
			doGet(req, resp);
		}
	}
	
}

		




