package com.welisit.crowd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.welisit.crowd.entity.Menu;
import com.welisit.crowd.mapper.MenuMapper;
import com.welisit.crowd.service.api.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Menu> getAll() {
		return menuMapper.selectByExample(null);
	}

	@Override
	public void saveMenu(Menu menu) {
		menuMapper.insertSelective(menu);
	}

	@Override
	public void updateMenu(Menu menu) {
		menuMapper.updateByPrimaryKeySelective(menu);
	}

	@Override
	public void deleteMenu(Integer id) {
		menuMapper.deleteByPrimaryKey(id);
	}

	
	
}
