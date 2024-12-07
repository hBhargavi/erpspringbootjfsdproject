package com.klef.jfsd.springboot.services;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;
import com.klef.jfsd.springboot.repository.AttendanceRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.ExamRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.StudentFeedbackResponseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

import jakarta.transaction.Transactional;


@Service
public class FacultyServiceImpl implements FacultyService
{
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private ExamRepository examRepository;
	
	@Autowired
	private AttendanceRepository attendanceRepository;
	@Autowired
	private StudentFeedbackResponseRepository feedbackResponseRepository;
	
	 @Autowired
	    private AttendanceService attendanceService;
	 
	 @Autowired
	 private EmailService emailService;


	    @Override
	    public String FacultyRegistration(Faculty f) {
	        try {
	            facultyRepository.save(f);
	            emailService.sendfacultyregistrationEmail(f.getEmail(), f.getId(), f.getPassword());
	            return "Faculty Registered Successfully. Email sent to " + f.getEmail();
	        } catch (Exception e) {
	            System.err.println("Error in Faculty Registration: " + e.getMessage());
	            return "Faculty Registration failed: " + e.getMessage();
	        }
	    }

	@Override
	public Faculty checkfacultylogin(String email, String pwd) 
	{
		return facultyRepository.checkfacultylogin(email, pwd);
	}
	  public Faculty getFacultyByEmail(String email) 
	  {
	        return facultyRepository.findByEmail(email);
	    }
	@Override
	public Faculty getFacultyById(long facultyId)
	{
		 Optional<Faculty> faculty = facultyRepository.findById((long) facultyId);
	        return faculty.orElse(null); 
	}
	@Override
	public String UpdateFacultyProfile(Faculty f)
	{
		Faculty fd=facultyRepository.findById(f.getId()).get();
		fd.setPassword(f.getPassword());
		facultyRepository.save(fd);
		return "Profile Updated Successfully";
		
	}
	public Set<Student> findRegisteredStudentsByFacultyId(Long facultyId) 
	{
	    System.out.println("Executing query with faculty ID: " + facultyId);
	    Set<Student> students = studentRepository.findStudentsByFacultyId(facultyId);
	    System.out.println("Query result size: " + students.size());
	    return students;
	}
	public Set<Student> findRegisteredStudentsByFacultyYearAndSemester(Long facultyId, String year, String semester) {
        return studentRepository.findRegisteredStudentsByFacultyYearAndSemester(facultyId, year, semester);
    }
	@Override
	public Faculty findByEmail(String femail) 
	{
		return facultyRepository.findByEmail(femail);
	}
	

	 @Override
	    public Set<Course> getCoursesByFacultyId(Long facultyId) {
	        
	        return facultyRepository.findCoursesByFacultyId(facultyId);
	    }

	    @Override
	    public List<Attendance> getAttendanceByFacultyCoursesAndYearAndSemester(Set<Course> courses, String year, String semester) {
	        
	        return attendanceRepository.findAttendanceByCoursesAndYearAndSemester(courses, year, semester);
	    }

	    @Override
	    public Faculty getFacultyById(Long facultyId) {
	        
	        return facultyRepository.findById(facultyId).orElse(null);
	    }
		@Override
		public List<Faculty> getAllFaculties() 
		{
			 return facultyRepository.findAll();
			
		}
		@Override
		public Faculty findById(Long facultyId) 
		{
	        Optional<Faculty> faculty = facultyRepository.findById(facultyId);
	        return faculty.orElse(null);  
	    }
		@Override
		public List<Course> findCoursesByFacultyYearAndSemester(Long facultyId, String year, String semester)
		{
			
			return courseRepository.findByFacultyIdAndYearAndSemester(facultyId, year, semester) ;
		}
		@Override
		
		
		public List<Attendance> getAttendanceByCourseIdAndYearAndSemester(int courseId, String year, String semester) {
		   
		    return attendanceRepository.findAttendanceByCoursesIdAndYearAndSemester(courseId, year, semester);
		}
		//exam
		public List<Exam> findExamsByFacultyId(Long facultyId) {
	        return examRepository.findByFacultyId(facultyId);
	    }

	    @Override
	    public Exam findExamById(Long examId) {
	        return examRepository.findById(examId).orElse(null);
	    }

	    @Transactional
	    @Override
	    public String gradeExam(Long examId, String grade)
	    {
	        Exam exam = findExamById(examId);
	        if (exam != null) {
	            exam.setGrade(grade);
	            exam.setStatus("Graded");
	            examRepository.save(exam);
	            return "Exam graded successfully";
	        }
	        return "Exam not found";
	    }
	
	  
	    public List<StudentFeedbackResponse> getFeedbackByFacultyId(long facultyId) 
	    {
	    
	        return feedbackResponseRepository.findByFacultyId(facultyId);
	    }
}
