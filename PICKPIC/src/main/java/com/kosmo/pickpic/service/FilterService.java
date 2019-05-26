package com.kosmo.pickpic.service;

import java.util.List;
import java.util.Map;

public interface FilterService {
	
	List<Map> albumDownFilterName(Map map);
	FilterDTO selectFilter_buy(Map map);
	int addPayment(Map map);
	List<Map> filterList();
}
