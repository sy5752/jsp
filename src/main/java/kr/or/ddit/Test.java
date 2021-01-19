
package kr.or.ddit;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.tomcat.jni.Local;

public class Test {
	public static void main(String[] args) {
		
		for(Locale locale : SimpleDateFormat.getAvailableLocales()){
			System.out.println(locale);
		}
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("userid", "brown");
//		
//		Map<String, String> otherMap = map;
//		otherMap.put("userid", "sally");
//		
//		// 동치, 동일
////		(== 메모리 상의 주소가 같은것)
//				
//		// System.out.println(map.get("userid"));
//		System.out.println(map==otherMap);
//		
//		Map<String, String> anotherMap = new HashMap<String, String>();
//		anotherMap.put("userid", "sally");
//		System.out.println(map.equals(anotherMap));
	}
}
