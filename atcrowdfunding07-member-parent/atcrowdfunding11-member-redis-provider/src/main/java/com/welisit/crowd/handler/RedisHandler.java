package com.welisit.crowd.handler;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.welisit.crowd.util.ResultEntity;

@RestController
public class RedisHandler {
	
	@Autowired
	private StringRedisTemplate redisTemplate;

	@RequestMapping("/set/redis/key/value/remote")
	ResultEntity<String> setRedisKeyValueRemote(@RequestParam("key") String key, @RequestParam("value") String value) {
		try {
			ValueOperations<String, String> operations = redisTemplate.opsForValue();
			operations.set(key, value);
			return ResultEntity.successWithoutData();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultEntity.failed(e.getMessage());
		}
	}

	@RequestMapping("/set/redis/key/value/remote/with/timeout")
	ResultEntity<String> setRedisKeyValueRemoteWithTimeout(@RequestParam("key") String key,
			@RequestParam("value") String value, @RequestParam("time") long time,
			@RequestParam("timeUnix") TimeUnit timeUnit) {
		try {
			ValueOperations<String, String> operations = redisTemplate.opsForValue();
			operations.set(key, value, time, timeUnit);
			return ResultEntity.successWithoutData();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultEntity.failed(e.getMessage());
		}
	}

	@RequestMapping("/get/redis/string/value/by/key/remote")
	ResultEntity<String> getRedisStringValueByKeyRemote(@RequestParam("key") String key) {
		try {
			ValueOperations<String, String> operations = redisTemplate.opsForValue();
			String value = operations.get(key);
			return ResultEntity.successWithData(value);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultEntity.failed(e.getMessage());
		}
	}

	@RequestMapping("/remove/redis/key/remote")
	ResultEntity<String> removeRedisKeyRemote(@RequestParam("key") String key) {
		try {
			redisTemplate.delete(key);
			return ResultEntity.successWithoutData();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultEntity.failed(e.getMessage());
		}
	}

}
