package com.system.dataManagement;
import java.util.*;
import com.system.entity.Teacher;
public class ManageUnbindingTeacher {

	public List<Teacher>getUnbindingTeacher(List<Teacher> l1,List<Teacher> l2){
		List<Teacher> teachers=l2;
		for(int i=0;i<l1.size();i++){
			for(int j=0;j<l2.size();j++){
				if(l1.get(i).getEmail().equals(l2.get(j).getEmail())){
					teachers.remove(j);
				}
			}
		}
		return teachers;

	}
}
