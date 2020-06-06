package com.welisit.crowd.test;

import java.util.concurrent.TimeUnit;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.welisit.crowd.api.RedisRemoteService;
import com.welisit.crowd.util.ResultEntity;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AuthTest {
	
	@Autowired
	private RedisRemoteService redisRemoteService;

	@Test
	public void test() {
//		ResultEntity<String> resultEntity = redisRemoteService.setRedisKeyValueRemoteWithTimeout("key", "value", 1, TimeUnit.MINUTES);
		ResultEntity<String> resultEntity = redisRemoteService.setRedisKeyValueRemoteWithTimeout("bb", "cc", 1, TimeUnit.MINUTES);
		System.out.println(resultEntity);
	}
}
