package kr.or.ddit.user.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.user.model.UserVo;

public class UserDao implements UserDaoI{

	@Override
	public List<UserVo> selectAllUser() {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		// select : 리턴되는 값의 복수 유무를 판단
		//		1. 단건 : 일반 객체를 반환(UserVo) selectOne()
		//		2. 여러건 : List<UserVo> selctList()
		// insert, update, delete : insert, update, delete
		
		// 메소드 이름과 실행할 sql id를 동일하게 맞추자(유지보수 - 다른 개발자의 가독성)
		
		List<UserVo> userList = sqlSession.selectList("users.selectAllUser"); // namespace : users 붙임
		
		// 사용한 자원 반환 
		sqlSession.close();
		
		return userList;
	}

	@Override
	public UserVo selectUser(String userid) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		// SELECT * FROM users WHERE userid=
		UserVo user = sqlSession.selectOne("users.selectUser", userid);
		sqlSession.close();
		
		return user;
	}

	@Override
	public List<UserVo> selectPagingUser(PageVo vo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<UserVo> pageList = sqlSession.selectList("users.selectPagingUser", vo);
		sqlSession.close();
		
		return pageList;
	}

	@Override
	public int selectAllUserCnt() {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int userCnt = sqlSession.selectOne("users.selectAllUserCnt");
		sqlSession.close();
		
		return userCnt;
	}

	@Override
	public int modifyUser(UserVo userVo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int updateCnt = sqlSession.update("users.modifyUser", userVo);
		
		if(updateCnt == 1) {
			sqlSession.commit();
		}
		else {
		sqlSession.rollback();
		}
		sqlSession.close();
		
		return updateCnt;
		
	}

	@Override
	public int registUser(UserVo userVo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int insertCnt = sqlSession.insert("users.registUser", userVo);
		
		if(insertCnt == 1) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
			
		}
		sqlSession.close();
		
		
		return insertCnt;
	}

	@Override
	public int deleteUser(String userid) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int deleteCnt = sqlSession.delete("users.deleteUser", userid);
		
		if(deleteCnt == 1) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
			
		}
		sqlSession.close();
		
		
		return deleteCnt;
	}


	
}
