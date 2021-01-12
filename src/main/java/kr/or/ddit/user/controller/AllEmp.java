package kr.or.ddit.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.user.model.EmpVo;
import kr.or.ddit.user.service.EmpService;
import kr.or.ddit.user.service.EmpServiceI;

@WebServlet("/allEmp")
public class AllEmp extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 EmpServiceI service = new EmpService();
		// EmpService service = new EmpService();
		 
		 List<EmpVo> emps = service.empList();
		 
		 
		 req.setAttribute("List", emps);
		 
		 req.getRequestDispatcher(req.getContextPath()+"/user/allEmp.jsp").forward(req, resp);
		 
		
		
		
	
	
	}

}
