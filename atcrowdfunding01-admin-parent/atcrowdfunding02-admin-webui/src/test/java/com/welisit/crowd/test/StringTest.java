package com.welisit.crowd.test;

import org.junit.Test;

import com.welisit.crowd.util.CrowdUtil;

public class StringTest {
	
	@Test
	public void testMd5() {
		String source = "123";
		String encoded = CrowdUtil.md5(source);
		System.out.println(encoded);
	}
}
