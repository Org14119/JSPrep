package com.system.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.system.daoImpl.FileDaoImpl;
import com.system.entity.SaveFile;
import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class NormalFileService {
	/*
	 * 学生获得已经上传的文件
	 */
	public Map<SaveFile, Teacher> getSendFile(Student student) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ConsultService service = new ConsultService();
		student = service.getStudentID(student);
		ResultSet fileSet = null;
		try {
			conn.setAutoCommit(false);
			fileSet = new FileDaoImpl().getFromOf(conn, student);
			while (fileSet.next()) {
				return null;
			}
			conn.commit();
			return null;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (fileSet != null) {
				try {
					fileSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/*
	 * 下载的时候获取输入流
	 */
	public InputStream downFile(String ablocate) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		File file = new File(ablocate);
		try {
			conn.setAutoCommit(false);
			SaveFile sfile = new SaveFile();
			sfile.setFileLocate(ablocate);
			sfile.setAccept(true);
			new FileDaoImpl().update(conn, sfile);
			conn.commit();
			return new FileInputStream(file);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/*
	 * 该方法获得给某个学生的所有文件，并下载
	 */
	public Map<SaveFile, Student> getRecvFiles(Teacher teacher) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		// List<SaveFile>fileList=new ArrayList<SaveFile>();
		Map<SaveFile, Student> map = new HashMap<SaveFile, Student>();
		ConsultService consult = new ConsultService();
		ResultSet set = null;
		if (teacher.getId() == 0) {
			teacher = consult.getTeacherID(teacher);
		}
		try {
			conn.setAutoCommit(false);
			set = new FileDaoImpl().getToOf(conn, teacher);
			while (set.next()) {
				long studentID = set.getLong("fromID");
				Student tempS = new Student();
				tempS.setId(studentID);
				tempS = consult.getStudentByID(tempS);

				SaveFile sfile = new SaveFile();
				sfile.setFileID(set.getLong("fileID"));
				sfile.setFileName(set.getString("fileName"));
				sfile.setFileLocate(set.getString("fileLocate"));
				int tempState = set.getInt("acceptState");
				if (tempState == 0) {
					sfile.setAccept(false);
				} else if (tempState == 1) {
					sfile.setAccept(true);
				} else {
					sfile.setAccept(false);
				}
				map.put(sfile, tempS);
			}
			conn.commit();
			return map;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (set != null) {
				try {
					set.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	public boolean upFile(Student student, Teacher teacher, SaveFile file) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		student = new ConsultService().getStudentID(student);
		teacher = new ConsultService().getTeacherID(teacher);
		try {
			conn.setAutoCommit(false);
			new FileDaoImpl().insert(conn, student, teacher, file);
			conn.commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public boolean upFile(Teacher teacher, Student student, SaveFile file) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		student = new ConsultService().getStudentID(student);
		teacher = new ConsultService().getTeacherID(teacher);
		try {
			conn.setAutoCommit(false);
			new FileDaoImpl().insert(conn, teacher, student, file);
			conn.commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
