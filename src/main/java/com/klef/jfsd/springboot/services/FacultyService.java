package com.klef.jfsd.springboot.services;

import java.util.List;
import java.util.Set;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;

public interface FacultyService 
{
	public String FacultyRegistration(Faculty f);
	public Faculty checkfacultylogin(String email,String pwd);
	public Faculty getFacultyByEmail(String email);
	public Faculty getFacultyById(long facultyId);
	public String UpdateFacultyProfile(Faculty f);
	public Set<Student> findRegisteredStudentsByFacultyId(Long facultyId);
	public Set<Student> findRegisteredStudentsByFacultyYearAndSemester(Long facultyId, String year, String semester);
	public Faculty findByEmail(String femail);
	
	public List<Attendance> getAttendanceByFacultyCoursesAndYearAndSemester(Set<Course> courses, String year, String semester);

	
	
	
	public  Set<Course> getCoursesByFacultyId(Long facultyId);
	    
	public    Faculty getFacultyById(Long facultyId);
	 
	
	public List<Faculty> getAllFaculties();
	public Faculty findById(Long facultyId);
	
	public List<Course> findCoursesByFacultyYearAndSemester(Long facultyId, String year, String semester);
	
	public List<Attendance> getAttendanceByCourseIdAndYearAndSemester(int courseId, String year, String semester);
	
	
	
	
	//exam
	
	public List<Exam> findExamsByFacultyId(Long facultyId);
    public Exam findExamById(Long examId);
    public String gradeExam(Long examId, String grade);
	
	
	
    public List<StudentFeedbackResponse> getFeedbackByFacultyId(long facultyId) ;
	
	
	
	
	
	}
