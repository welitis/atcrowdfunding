package com.welisit.crowd.service.api;

import java.util.List;

import com.welisit.crowd.entity.Menu;

public interface MenuService {
	
	List<Menu> getAll();

	void saveMenu(Menu menu);

	void updateMenu(Menu menu);

	void deleteMenu(Integer id);
}
