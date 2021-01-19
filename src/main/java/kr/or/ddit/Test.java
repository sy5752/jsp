
package kr.or.ddit;

import java.util.HashMap;
import java.util.Map;

public class Test {
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", "brown");
		
		Map<String, String> otherMap = map;
		otherMap.put("userid", "sally");
		
		// 동치, 동일
//		(== 메모리 상의 주소가 같은것)
				
		// System.out.println(map.get("userid"));
		System.out.println(map==otherMap);
		
		Map<String, String> anotherMap = new HashMap<String, String>();
		anotherMap.put("userid", "sally");
		System.out.println(map.equals(anotherMap));
	}
}
