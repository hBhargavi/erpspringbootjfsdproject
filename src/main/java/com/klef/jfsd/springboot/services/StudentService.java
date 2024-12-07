package com.klef.jfsd.springboot.services;


import java.util.List;

import java.util.Optional;
import java.util.Set;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;


public interface StudentService 
{
	public Student checkstudentlogin(Long id,String password);
	public void registerStudentForCourse(Long studentId, int courseId);
	public List<Course> getCoursesByFacultyAndSemester(long facultyId, String semester);
	
	 public List<Faculty> getAllFaculties();
	 public Optional<Student> findById(Long studentId);
	public  Set<Course> findRegisteredCoursesByStudentIdAndYearAndSemester(Long studentId, String year, String semester);
	
	public Student findStudentById(Long studentId);
	public List<Student> getStudentsByFaculty(Long id);
	
	public String UpdateStudentProfile(Student student);
	

   public Set<Course> findRegisteredCoursesByStudentId(Long studentId);
   public  void updateStudentCourseRegistration(Long studentId, int courseId, Long facultyId, String semester, String academicYear);
   
   
   	public List<Student> getAllStudents();
   	//exam
   	
    public List<Exam> findExamsForStudent(Long studentId) ;
    public Exam findExamById(Long examId);
    
	public Exam findExamByIdAndYearAndSemester(Long examId, String year, String semester);
	public List<Exam> findExamsForStudentByYearAndSemester(Long studentId, String year, String semester);
	
	public boolean isAlreadyRegistered(Long studentId, int courseId, Faculty faculty, String section, String year,
			String semester);
	
	public Feedback findFeedbackByYearAndSemester(String year, String semester);
	
	public void savestudentfeedback(Feedback feedback);
	
	
	public Feedback findFeedbackById(Long feedbackId);
	public Set<Course> findRegisteredCoursesByStudentIdforfeedback(Long studentId);
	
	//feed
	public List<Feedback> getAllFeedback();
    public Feedback getFeedbackById(Long id);
    public void saveFeedbackResponse(StudentFeedbackResponse feedbackResponse);
	public boolean isFeedbackAlreadySubmitted(Long feedbackId, Long studentId);
	
	    
  

	
	;
	
}
