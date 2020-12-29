package kr.or.ddit.servlet.basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;


public class TimesTablesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("	<head>");
		pw.println("		<title>TimesTablesServlet</title>");
		pw.println("	</head>");
		pw.println("	<body>");
		pw.println("		<table border='1' style='width : 100%;'>");
		
		for(int j = 1; j <=9; j++) {
			
			pw.println("			<tr>");
			for(int i=2; i<=9; i++) {				
				pw.println("				<td>"+ i + " * "+ j + "=" + i * j + "</td>");
			}	
			pw.println("			</tr>");
		}

		pw.println("		</table>");
		
		pw.println("	</body>");
		
		pw.println("</html>");
		
		
		pw.flush(); 
		pw.close(); 
		

	}
	


}
