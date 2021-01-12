package kr.or.ddit.etc;

import static org.junit.Assert.*;

import org.junit.Test;

import kr.or.ddit.user.repository.UserDao;
import kr.or.ddit.user.repository.UserDaoI;

public class PaginationTest {

	@Test
	public void PaginationTest() {
		/***Given***/
		
		int userTotCnt = 32;
		int pageSize = 5;

		/***When***/
		int pagination = (int)Math.ceil((double)userTotCnt / pageSize);

		/***Then***/
		assertEquals(7, pagination);

	}
	
	@Test
	public void selectAllUserCntTest() {
		/***Given***/
		UserDaoI userDao = new UserDao();

		/***When***/
		int userCnt = userDao.selectAllUserCnt();

		/***Then***/
		
		assertEquals(16, userCnt);

	}

}
