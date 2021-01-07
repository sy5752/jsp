package kr.or.ddit.cookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class CookieUtil {
//	private static final Logger logger = (Logger) LoggerFactory.getLogger(CookieUtil.class);


	

	/**  
	 * Method : getCookieValue 
	 * 작성자 : PC-05 
	 * 변경이력 :  
	 * @param cookieStr
	 * @param cookieName
	 * @return  
	 * Method 설명 :  cookieStr에서 cookieName에 해당하는 쿠키값을 조회
	 */ 
	private static final Logger logger = LoggerFactory.getLogger(CookieUtil.class);
	
	//cookieStr : "userid=brown; rememberme=Y; test=testcookie"
	//cookieName : userid, rememberme
	//return : brown, Y
	public static String getCookieValue(String cookieStr, String cookieName) {
		
		//userid=brown; rememberme=Y; test=testcookie
		String[] cookies = cookieStr.split("; ");
		String[] name = new String[cookies.length];
		//cookies[0] = userid=brown
		//cookies[1] = rememberme=Y
		//cookies[2] = test=testcookie
		
//		for(int i=0; i<=cookies.length; i++) {
//			logger.debug("cookies : {}",cookies );
		
		for(String cookieString : cookies){
			logger.debug(cookieString);
			// cookieString : 쿠키이름=쿠키값
			
			String[] cookie = cookieString.split("=");
			//cookie[0] = 쿠키이름
			//cookie[1] = 쿠키값
			
			//찾고자하는 쿠키 이름인지 확인
			if(cookie[0].equals(cookieName)) {
				return cookie[1];
			}
			
		}
		
		return "";
	}
}
