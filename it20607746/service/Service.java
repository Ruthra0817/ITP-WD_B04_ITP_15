package eschool.teacher.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import eschool.student.model.StudentAttendanceReport;
import eschool.teacher.model.Teacher;
import eschool.util.DbUtil;

public class Service {
	
	private static final String SELECT_TEACHERS = "SELECT * FROM teachers";
	private static final String SELECT_TEACHER_BY_NAME = "SELECT * FROM teachers WHERE name = ?";
	private static final String INSERT_TEACHER  = "INSERT INTO teachers(name,address,DOB,phoneNumber,password) VALUES(?,?,?,?,?)";
	private static final String UPDATE_TEACHER = "UPDATE teachers SET name = ?,address = ?,DOB = ?,phoneNumber = ?,password = ? WHERE teacherID = ?";
	private static final String DELETE_TEACHER = "DELETE FROM teachers WHERE teacherID = ?";
	private static final String SELECT_TEACHER_BY_ID = "SELECT * FROM teachers WHERE teacherID = ?";
	private static final String COUNT_TEACHERS = "SELECT COUNT(*) AS count FROM teachers";
	
	public static int teacherCount() {
		Connection connection = DbUtil.getConnection();
		int count = 0;
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(COUNT_TEACHERS);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	

	
	public static Teacher getTeacherByID(int id) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TEACHER_BY_ID);
			preparedStatement.setInt(1,id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				Teacher teacher = new Teacher();
				int teacherID = rs.getInt("teacherID");
				String phoneNumber = rs.getString("phoneNumber");
				java.sql.Date dob = rs.getDate("DOB");
				String address = rs.getString("address");
				String name = rs.getString("name");
				String password = rs.getString("password");
				teacher.setAddress(address);
				teacher.setDOB(dob);
				teacher.setName(name);
				teacher.setPassword(password);
				teacher.setPhoneNumber(phoneNumber);
				teacher.setTeacherID(teacherID);
				return teacher;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<Teacher> getStudents(){
		Connection connection = DbUtil.getConnection();
		ArrayList<Teacher> teachers = new ArrayList<Teacher>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TEACHERS);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Teacher teacher = new Teacher();
				int teacherID = rs.getInt("teacherID");
				String phoneNumber = rs.getString("phoneNumber");
				java.sql.Date dob = rs.getDate("DOB");
				String address = rs.getString("address");
				String name = rs.getString("name");
				String password = rs.getString("password");
				teacher.setAddress(address);
				teacher.setDOB(dob);
				teacher.setName(name);
				teacher.setPassword(password);
				teacher.setPhoneNumber(phoneNumber);
				teacher.setTeacherID(teacherID);
				teachers.add(teacher);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teachers;
	}
	
	public static ArrayList<Teacher> getTeacherByName(String nme){
		Connection connection = DbUtil.getConnection();
		ArrayList<Teacher> teachers = new ArrayList<Teacher>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TEACHER_BY_NAME);
			preparedStatement.setString(1, nme);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Teacher teacher = new Teacher();
				int teacherID = rs.getInt("teacherID");
				String phoneNumber = rs.getString("phoneNumber");
				java.sql.Date dob = rs.getDate("DOB");
				String address = rs.getString("address");
				String name = rs.getString("name");
				String password = rs.getString("password");
				teacher.setAddress(address);
				teacher.setDOB(dob);
				teacher.setName(name);
				teacher.setPassword(password);
				teacher.setPhoneNumber(phoneNumber);
				teacher.setTeacherID(teacherID);
				teachers.add(teacher);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teachers;
	}
	
	public static void newTeacher(String name, String address, String phoneNumber, java.sql.Date DOB,String password) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TEACHER);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2,address);
			preparedStatement.setDate(3, DOB);
			preparedStatement.setString(4,phoneNumber);
			preparedStatement.setString(5, password);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void updateTeacher(int teacherID,String name, String address, String phoneNumber, java.sql.Date DOB,String password) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TEACHER);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2,address);
			preparedStatement.setDate(3, DOB);
			preparedStatement.setString(4,phoneNumber);
			preparedStatement.setString(5, password);
			preparedStatement.setInt(6, teacherID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void deleteTecaher(int teacherID) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TEACHER);
			preparedStatement.setInt(1, teacherID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
