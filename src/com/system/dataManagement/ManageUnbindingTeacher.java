package com.system.dataManagement;
import java.util.*;
import com.system.entity.Teacher;
public class ManageUnbindingTeacher {

	public List<Teacher>getUnbindingTeacher(List<Teacher> l1,List<Teacher> l2){
		List<Teacher> teachers=l2;
		for(Teacher t1:l1){
			for(Teacher t2:l2){
				if(t1.getEmail().equals(t2.getEmail())){
					teachers.remove(t2);
				}
			}
			
		}	
		return teachers;
		
	}
}
