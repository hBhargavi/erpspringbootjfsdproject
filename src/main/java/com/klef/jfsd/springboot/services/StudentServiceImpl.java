package com.klef.jfsd.springboot.services;

import java.util.Collections;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.ExamRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.FeedbackRepository;
import com.klef.jfsd.springboot.repository.StudentFeedbackResponseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

import jakarta.transaction.Transactional;
@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private FacultyRepository facultyRepository;
	@Autowired
	private StudentFeedbackResponseRepository studentFeedbackResponseRepository;
	
	@Autowired
	private ExamRepository examRepository;
	@Autowired
	private FeedbackRepository feedbackRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	
	
	@Override
	public Student checkstudentlogin(Long id, String password) 
	{
		return studentRepository.checkstudentlogin(id, password);
	}
	public void registerStudentForCourse(Long studentId, int courseId) 
	{
	    
	    Student student = studentRepository.findById(studentId)
	            .orElseThrow(() -> new RuntimeException("Student not found"));
	    Course course = courseRepository.findById(courseId)
	            .orElseThrow(() -> new RuntimeException("Course not found"));

	    
	    if (student.getRegisteredCourses().contains(course))
	    {
	        throw new RuntimeException("You are already registered for this course in the same semester");
	    }


	    Long facultyId = course.getFaculty().getId();
	    student.setFacultyId(facultyId);

	    student.getRegisteredCourses().add(course);

	    
	    studentRepository.saveAndFlush(student);
	}


	 public List<Course> getCoursesByFacultyAndSemester(long facultyId, String semester) {
		    System.out.println("Fetching courses for Faculty ID: " + facultyId + " and Semester: " + semester);
		    List<Course> courses = courseRepository.findByFacultyIdAndSemester(facultyId, semester);
		    System.out.println("Fetched courses: " + courses);
		    return courses;
		}

	 public List<Faculty> getAllFaculties() 
	 {
	        return facultyRepository.findAll(); 
	    }
	 public Optional<Student> findById(Long studentId) 
	 {
	        return studentRepository.findById(studentId); 
	    }
	@Override
	public Set<Course> findRegisteredCoursesByStudentIdAndYearAndSemester(Long studentId, String year,
			String semester)
	{
		
		return studentRepository.findCoursesByStudentIdYearAndSemester(studentId, year, semester);
		
	}
	@Override
	public Student findStudentById(Long studentId) 
	{
	  
	    return studentRepository.findById(studentId)
	        .orElseThrow(() -> new RuntimeException("Student not found with ID: " + studentId));
	}
    public List<Student> getStudentsByFaculty(Long facultyId) 
    {
        return studentRepository.findByFacultyId(facultyId);
    }
	@Override
	@Transactional
	public String UpdateStudentProfile(Student student)
	{
		Student stu=studentRepository.findById(student.getId()).get();
		stu.setPassword(student.getPassword());
		//facultyRepository.save(stu);
		studentRepository.save(student);
		return "Profile Updated Successfully";
	}


	
	
	
	
	
	  @Override
	    public Set<Course> findRegisteredCoursesByStudentId(Long studentId) {
	        return courseRepository.findCoursesByStudentId(studentId);
	    }

	  public void updateStudentCourseRegistration(Long studentId, int courseId, Long facultyId, String semester, String academicYear) 
	  {
		
		    Course course = courseRepository.findById(courseId).orElse(null);
		    if (course != null)
		    {
		
		        Faculty faculty = facultyRepository.findById(facultyId).orElse(null);
		        if (faculty != null) 
		        {
		        
		            course.setFaculty(faculty);
		            course.setSemester(semester);
		            course.setYear(academicYear);
		            
		        
		            courseRepository.save(course);
		        }
		    }
		}
	  @Override
	    public List<Student> getAllStudents()
	  	{
	        return studentRepository.findAll();
	    }

	  //exam
	  public List<Exam> findExamsForStudent(Long studentId) 
	  {
	        
	        return examRepository.findExamsByStudentId(studentId);  // Example query
	    }

	    // Fetch a particular exam's details for viewing (including the PDF)
	    public Exam findExamById(Long examId)
	    {
	        return examRepository.findById(examId).orElse(null);
	    }
	
	 
	    public List<Exam> findExamsForStudentByYearAndSemester(Long studentId, String year, String semester) {
	        return examRepository.findExamsByStudentIdAndYearAndSemester(studentId, year, semester);
	    }

	    
	    public Exam findExamByIdAndYearAndSemester(Long examId, String year, String semester) {
	        return examRepository.findExamByIdAndYearAndSemester(examId, year, semester);
	    }
		@Override
		public boolean isAlreadyRegistered(Long studentId, int courseId, Faculty faculty, String section, String year,String semester)
		{
		
			return studentRepository.existsByIdAndCourses_CourseIdAndCourses_FacultyAndCourses_SectionAndCourses_YearAndCourses_Semester(
		            studentId, courseId, faculty, section, year, semester);
		}
		@Override
		public Feedback findFeedbackByYearAndSemester(String year, String semester)
		{
		
			return feedbackRepository.findFeedbackByYearAndSemester(year, semester);
		}
		@Override
		public void savestudentfeedback(Feedback feedback)
		{
		feedbackRepository.save(feedback);			
		}
		



		 public Feedback findFeedbackById(Long feedbackId)
		 {
		        return feedbackRepository.findById(feedbackId)
		                .orElse(null); 
		    }
		@Override
		public Set<Course>findRegisteredCoursesByStudentIdforfeedback(Long studentId) {
		    Student student = studentRepository.findById(studentId).orElse(null);

		    if (student != null) 
		    {
		        return student.getRegisteredCourses();
		    } 
		    else
		    {
		        return Collections.emptySet();
		    }
		}

		
		public List<Feedback> getAllFeedback() 
		{
	        return feedbackRepository.findAll();
	    }

	    public Feedback getFeedbackById(Long id)
	    {
	        return feedbackRepository.findById(id).orElse(null);
	    }

	    public void saveFeedbackResponse(StudentFeedbackResponse feedbackResponse)
	    {
	        studentFeedbackResponseRepository.save(feedbackResponse);
	    }
	    @Override
	    public boolean isFeedbackAlreadySubmitted(Long feedbackId, Long studentId) {
	        return studentFeedbackResponseRepository.existsByFeedbackIdAndStudentId(feedbackId, studentId);
	    }
	    //studentcoursedisplay
		
		
	   

}
