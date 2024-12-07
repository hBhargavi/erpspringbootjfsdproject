package com.klef.jfsd.springboot.services;

import java.util.List;


import com.klef.jfsd.springboot.Models.Admin;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.Leave;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;


public interface AdminService 
{
	public Admin checkadminlogin(String uname,String pwd);
	public List<Faculty> viewallfaculty();
	public String studentregistration(Student student);
	public List<Student> viewallstudents();
	public String deletestudent(long id);
	public void deleteFaculty(long facultyId);
	public String updatefacultystatus(String status,String email);
	public String UpdateAdminProfile(Admin a);
	public Admin  displayadminbyusername(String name);
	public long faccount();
	public long stucount();
	public String addcourse(Course  course);
	
	 public List<Course> getAllCourses() ;
	 public String deleteCourse(int id);
	 
	 public void unregisterStudentsFromCourse(int courseId);
	
	
	 
	 public String updatefacultydetails(Faculty faculty);
	 
	 
	 
	 public List<Leave> viewAllLeaves();
	 public void updateLeaveStatus(Long leaveId, String status);
	public List<Course> getCoursesByYearAndSemester(String year, String semester);
	
	//exam
	public Exam uploadExamPDF(Student student, Course course, Faculty faculty, byte[] pdfFile, String pdfFileName, String year, String semester);
	
	 public boolean isExamPDFAlreadyUploaded(Long studentId, int courseId, Long facultyId, String year, String semester);
	 
	public List<Exam> viewallexampdfs();
	
	public List<Exam> getExamsByYearAndSemester(String year, String semester);
	
	public String updatestudentdetails(Student student);
	public List<Student> viewAllMappedStudents();
	//update course
	public Course findCourseByStudentIdAndCourseCode(Long studentId, String courseCode);
    
    public void updateCourse(Course course);
    
    
    //unregister
    public List<Student> findStudentsByCourseId(int courseId); // Fetch all students for the course
   
	public Course findCourseById(int courseId);
	public void unregisterStudentFromCourse(Long studentId, int courseId);
	
	public void saveFeedback(Feedback feedback);
	public List<StudentFeedbackResponse> getAllFeedbackResponses();
	
}
