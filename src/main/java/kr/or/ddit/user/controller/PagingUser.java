package kr.or.ddit.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.scene.control.Pagination;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;

@WebServlet("/pagingUser")
public class PagingUser extends HttpServlet{
	// private UserServiceI service = new UserService();로 적어줘도 됨
	private UserServiceI userService = new UserService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//left.jsp : /pagingUser?page=1&pageSize=5
		// ===> /pagingUser
		
		// doGet 메소드에서 page, pageSize파라미터가 request 객체에 존재하지 않을 때
		// page는 1로, pageSize 5로 생각을 코드를 작성
		// 파라미터가 존재하면 해당 파라미터를 이동
		
		
		
		
		// primitive Type ==> class(Wrapper) Integer
		// if / else ==> ? // 조건 ? true일때 반환할 값 : false일때 반환할 값
		// refactoring : 코드를 (깔끔하게) 바꾸는데 기존 동작방식을 유지한채로 변경하는 기법
		
		
		
		
		/*
		 * request객체에서 제공하는 파라미터 관련 메소드
		 * 
		  */
		
		// 밑에 주석처리한 코드를 삼항연산자로 짧게 표현가능
		// int page = Integer.parseInt(req.getParameter("page"));
		// int pageSize = Integer.parseInt(req.getParameter("pageSize"));
		
		
		/*if(req.getParameter("page")  != null) {
			page = Integer.parseInt(req.getParameter("page")) ;
		}else {
			page = 1;
		}
		if(req.getParameter("pageSize")  != null) {
			pageSize = Integer.parseInt(req.getParameter("pageSize")) ;
		}else {
			pageSize = 5;
		}*/
		

		String pageParam = req.getParameter("page");
		String pageSizeParam = req.getParameter("pageSize");
		
		int page = pageParam == null ? 1 : Integer.parseInt(pageParam);
		int pageSize = pageSizeParam == null ? 5 : Integer.parseInt(pageSizeParam);
		
		PageVo pageVo = new PageVo(page, pageSize);
		
		Map<String, Object> map = userService.selectPagingUser(pageVo);
		
		List<UserVo> userList = (List<UserVo>)map.get("userList");
		int userCnt = (int)map.get("userCnt");
		int pagination = (int)Math.ceil((double) userCnt / pageSize); 
	
	 	req.setAttribute("List", userList); 
	 	req.setAttribute("pagination", pagination); 
	 	req.setAttribute("pageVo", pageVo);
		
		req.getRequestDispatcher("/user/pagingUser.jsp").forward(req, resp);
	}
	

}
