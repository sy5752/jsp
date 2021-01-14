package kr.or.ddit.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;
import kr.or.ddit.user.repository.UserDaoI;

public class UserService implements UserServiceI {
	private UserDaoI userDao = new UserDao();
	
	@Override
	public List<UserVo> selectAllUser() {
		//SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		// select : 리턴되는 값의 복수 유무를 판단
		//		1. 단건 : 일반 객체를 반환(UserVo) selectOne()
		//		2. 여러건 : List<UserVo> selctList()
		// insert, update, delete : insert, update, delete
		
		// 메소드 이름과 실행할 sql id를 동일하게 맞추자(유지보수 - 다른 개발자의 가독성)
		
		//List<UserVo> userList = sqlSession.selectList("users.selectAllUser"); // namespace : users 붙임
		
		// 사용한 자원 반환 
		//sqlSession.close();
		
		//return userList;
		return userDao.selectAllUser();
		}
		
	

	@Override
	public UserVo selectUser(String userid) {
		return userDao.selectUser(userid);
	}

	
		
	

	@Override
	public Map<String, Object> selectPagingUser(PageVo pageVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<UserVo> userList = userDao.selectPagingUser(pageVo);
		int userCnt = userDao.selectAllUserCnt();
		
		map.put("userList", userList);
		map.put("userCnt", userCnt);
		
		return map;
	}



	@Override
	public int modifyUser(UserVo userVo) {
		
		return userDao.modifyUser(userVo);
	}



	@Override
	public int registUser(UserVo userVo) {
		return userDao.registUser(userVo);
	}
	
}
