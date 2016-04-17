package com.system.dataManagement;


import java.util.Iterator;
import java.util.List;

import com.system.entity.Teacher;

public class ManageUnbindingTeacher {

	public List<Teacher> getUnbindingTeacher(List<Teacher> l1, List<Teacher> l2) {
		List<Teacher> tempList = l2;
		Iterator<Teacher> itBinding = l1.iterator();
		Iterator<Teacher> itAll = l2.iterator();
		while (itAll.hasNext()) {
			while (itBinding.hasNext()) {
				Teacher t1 = itAll.next();
				Teacher t2 = itBinding.next();
				if (t1.getEmail().equals(t2.getEmail())) {
					tempList.remove(t1);
				}
			}
		}
		return tempList;
	}
}
