package kr.or.ddit.util;

import static org.junit.Assert.*;

import org.junit.Test;

public class FileUtilTest {

	@Test
	public void FileUtilTest() {
		
		/***Given***/
		String cd = "form-data; name=\"file\"; filename=\"brown.png\"";
		
		/***When***/
		String filename = FileUtil.getFileName(cd);

		/***Then***/
		assertEquals("brown.png", filename);
	
	
	}
	@Test
	public void FileUtilFailTest() {
		
		/***Given***/
		String cd = "form-data; name=\"file\"";
		
		/***When***/
		String filename = FileUtil.getFileName(cd);

		/***Then***/
		assertEquals("", filename);
	
	}
	@Test
	public void getFileExtensionTest() {
		
		/***Given***/
		String filename = "brown.png";

		/***When***/
		String extension = FileUtil.getFileExtension(filename);
		
		/***Then***/
		assertEquals(".png", extension);
		
	}
	
	@Test
	public void getFileExtensionTest2() {
		
		/***Given***/
		String filename = "line.brown.png";

		/***When***/
		String extension = FileUtil.getFileExtension(filename);
		
		/***Then***/
		assertEquals(".png", extension);
		
	}
	@Test
	public void getFileExtensionTest3() {
		
		/***Given***/
		String filename = "brown";
		
		/***When***/
		String extension = FileUtil.getFileExtension(filename);
		
		/***Then***/
		assertEquals("", extension);
		
	}
}
