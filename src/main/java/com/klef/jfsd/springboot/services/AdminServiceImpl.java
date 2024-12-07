package com.klef.jfsd.springboot.services;

import java.util.List;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Admin;
import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.Leave;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.AttendanceRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.ExamRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.FeedbackRepository;
import com.klef.jfsd.springboot.repository.LeaveRepository;
import com.klef.jfsd.springboot.repository.StudentFeedbackResponseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.TimetableRepository;

import jakarta.transaction.Transactional;
@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminrepository;
	@Autowired
	private FacultyRepository facultyRepository;
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private LeaveRepository leaveRepository;
	@Autowired
	private FeedbackRepository feedbackRepository;
	@Autowired
	private StudentFeedbackResponseRepository studentFeedbackResponseRepository;
	
	@Autowired
	private AttendanceRepository attendanceRepository;
	
	@Autowired
	private TimetableRepository timetableRepository;
	
	@Autowired
	private ExamRepository examRepository;
	
	@Autowired
	private EmailService emailService;

	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
	
		return adminrepository.checkadminlogin(uname, pwd);
	}
	@Override
	public List<Faculty> viewallfaculty() 
	{
		return facultyRepository.findAll() ;
	}

	@Override
	public String studentregistration(Student student) {
	    try {
	        // Save student to DB
	        studentRepository.save(student);

	        // Send email after successful registration
	        emailService.sendRegistrationEmail(student.getPersonalEmail(), student.getId(), student.getPassword());

	        // Return success message
	        return "Student Added Successfully. Email sent to " + student.getPersonalEmail();
	    } catch (Exception e) {
	        // Handle any exceptions and return error message
	        return "Registration failed: " + e.getMessage();
	    }
	}


	@Override
	public List<Student> viewallstudents() 
	{
		return studentRepository.findAll();
	}
	@Override
	public String deletestudent(long id) 
	{
	studentRepository.deleteById((long) id);
	return "Studnet Deleted Successfully";
	}
	@Override
	@Transactional
	public void deleteFaculty(long facultyId) 
	{
	
	    List<Course> facultyCourses = courseRepository.findByFacultyId(facultyId);
	    for (Course course : facultyCourses) 
	    {
	    
	        course.getStudents().clear();
	        courseRepository.save(course);
	    }
	    
	    // Nullify faculty reference in course_table
	    for (Course course : facultyCourses) 
	    {
	        course.setFaculty(null);
	        courseRepository.save(course);
	    }
	    
	    // Nullify faculty reference in student_table
	    List<Student> students = studentRepository.findByFacultyId(facultyId);
	    for (Student student : students) 
	    {
	        student.setFacultyId(null);

	        studentRepository.save(student);
	    }

	    // Now delete the faculty
	    facultyRepository.deleteById(facultyId);
	}


	
	
	@Override
	public String updatefacultystatus(String status, String email) 
	{
		facultyRepository.updateempstatus(status, email);
		return "Faculty Status Updated Successfully";
	
	}
	@Override
	public String UpdateAdminProfile(Admin a) 
	{
	Admin ad=adminrepository.findById(a.getUsername()).get();
	ad.setPassword(a.getPassword());
	adminrepository.save(ad);
	return "Profile Updated Successfully";
	}
	@Override
	public Admin displayadminbyusername(String name) 
	{
	
		return adminrepository.findById(name).get();
	}
	@Override
	public long faccount()
	{
		
		return facultyRepository.count();
	}
	@Override
	public long stucount() 
	{
		return studentRepository.count();
	}
	@Override
	public String addcourse(Course course) 
	{
	courseRepository.save(course);
		return "Course Added Successfully";
	}

	public List<Course> getAllCourses() 
	{
        // Fetch all courses from the repository
        return courseRepository.findAll();
    }
	
	@Override
	public String updatefacultydetails(Faculty faculty)
	{
		Faculty f=facultyRepository.findById(faculty.getId()).get();
		f.setFirstName(faculty.getFirstName());
		f.setMiddleName(faculty.getMiddleName());
		f.setLastName(faculty.getLastName());
		f.setGender(faculty.getGender());
		f.setFatherName(faculty.getFatherName());
		f.setMotherName(faculty.getMotherName());
		f.setDob(faculty.getDob());
	    f.setBloodGroup(faculty.getBloodGroup());
	    f.setMaritalStatus(faculty.getMaritalStatus());
	    f.setMotherTongue(faculty.getMotherTongue());
	    f.setCastCategory(faculty.getCastCategory());
	    f.setEmail(faculty.getEmail());
	    f.setPhoneNumber(faculty.getPhoneNumber());
	    f.setIdentification(faculty.getIdentification());
	    f.setReligion(faculty.getReligion());
	    f.setNationality(faculty.getNationality());
	    f.setJoiningDate(faculty.getJoiningDate());
	    f.setDesignation(faculty.getDesignation());
	    f.setDepartment(faculty.getDepartment());
	    f.setCoursestaught(faculty.getCoursestaught());
	    f.setRecruitAgency(faculty.getRecruitAgency());
	    f.setPfNumber(faculty.getPfNumber());
	    f.setRecruitmentType(faculty.getRecruitmentType());
	    f.setResumeLink(faculty.getResumeLink());
	    f.setApprovalStatus(faculty.getApprovalStatus());
	    f.setDisability(faculty.getDisability());
	    f.setPlaceOfBirth(faculty.getPlaceOfBirth());
	   
	    f.setExperience(faculty.getExperience());
	    f.setAddress(faculty.getAddress());
	    f.setCity(faculty.getCity());
	    f.setState(faculty.getState());
	    f.setCountry(faculty.getCountry());
	    f.setPostalCode(faculty.getPostalCode());

	    
	    // Save the updated faculty back to the repository
	    facultyRepository.save(f);
	    
	    return "Faculty details updated successfully.";
		
	}
	
	
	public void unregisterStudentsFromCourse(int courseId) 
	{
		
	   
	    attendanceRepository.deleteByCourseId(courseId); 
	   
	}
	public String deleteCourse(int id)
	{
       courseRepository.deleteById(id);
       return "Course Deleted Successfully";
    }
	
	
	public List<Leave> viewAllLeaves() 
	{
        return leaveRepository.findAll();  
    }
	 public void updateLeaveStatus(Long leaveId, String status)
	 {
	        Optional<Leave> leave = leaveRepository.findById(leaveId);
	        if (leave.isPresent()) {
	            Leave leaveRecord = leave.get();
	            leaveRecord.setStatus(status); 
	            leaveRepository.save(leaveRecord);  
	        }
	    }
	
	 
	 public List<Course> getCoursesByYearAndSemester(String year, String semester) {
		    return courseRepository.findByYearAndSemester(year, semester);
		}
	 
	 
	 //exam
	 public Exam uploadExamPDF(Student student, Course course, Faculty faculty, byte[] pdfFile, String pdfFileName, String year, String semester)
	 {
	        Exam exam = new Exam();
	        exam.setStudent(student);
	        exam.setCourse(course);
	        exam.setFaculty(faculty); // Set faculty
	        exam.setPdfFile(pdfFile);
	        exam.setPdfFileName(pdfFileName);
	        exam.setYear(year);
	        exam.setSemester(semester);
	        return examRepository.save(exam);
	    }
	 
	 public boolean isExamPDFAlreadyUploaded(Long studentId, int courseId, Long facultyId, String year, String semester) 
	 {
		    return examRepository.existsByStudentIdAndCourseCourseIdAndFacultyIdAndYearAndSemester(studentId, courseId, facultyId, year, semester);
		}
	@Override
	public List<Exam> viewallexampdfs()
	{
	   
		return examRepository.findAll();
	}
	@Override
	public List<Exam> getExamsByYearAndSemester(String year, String semester)
	{
	
		return examRepository.findExamByYearAndSemester(year, semester);
	}
	
	public String updatestudentdetails(Student student)
	{
	    Student s = studentRepository.findById(student.getId()).orElse(null);
	    
	    if (s == null) 
	    {
	        return "Student not found.";
	    }

	    
	    s.setFirstName(student.getFirstName());
	    s.setLastName(student.getLastName());
	    s.setGender(student.getGender());
	    s.setFatherName(student.getFatherName());
	    s.setMotherName(student.getMotherName());
	    s.setDateOfBirth(student.getDateOfBirth());
	    s.setBloodGroup(student.getBloodGroup());
	    s.setMaritalStatus(student.getMaritalStatus());
	    s.setMotherTongue(student.getMotherTongue());
	    s.setCasteCategory(student.getCasteCategory());
	    s.setPersonalEmail(student.getPersonalEmail());
	    s.setContactNo(student.getContactNo());
	    s.setIdentification(student.getIdentification());
	    s.setDisability(student.getDisability());
	    s.setPlaceOfBirth(student.getPlaceOfBirth());
	    s.setHeight(student.getHeight());
	    s.setWeight(student.getWeight());
	    s.setReligion(student.getReligion());
	    s.setNationality(student.getNationality());
	    s.setAdmissionDate(student.getAdmissionDate());
	    s.setMajorDegree(student.getMajorDegree());
	    s.setReferredBy(student.getReferredBy());
	    s.setProgram(student.getProgram());
	    s.setRegulation(student.getRegulation());
	    s.setHostelStatus(student.getHostelStatus());
	    s.setHighSchool(student.getHighSchool());
	    s.setIntermediate(student.getIntermediate());
	    
	    s.setStudentprofile(student.getStudentprofile());

	    // Update associated courses if necessary
	    s.setCourses(student.getCourses());
	    s.setRegisteredCourses(student.getRegisteredCourses());

	    // Update faculty ID if necessary
	    s.setFacultyId(student.getFacultyId());

	    // Save the updated student back to the repository
	    studentRepository.save(s);

	    return "Student details updated successfully.";
	}
	@Override
	public List<Student> viewAllMappedStudents() 
	{
		  return studentRepository.findAllWithMappedCourses();
		
	}
	
	//course update
	 @Override
	    public Course findCourseByStudentIdAndCourseCode(Long studentId, String courseCode) {
	        return courseRepository.findCourseByStudentIdAndCourseCode(studentId, courseCode);
	    }

	    @Override
	    public void updateCourse(Course course) {
	        courseRepository.save(course); // `save` will perform an update if the course ID already exists
	    }
	    
	    
	    
	    public List<Student> findStudentsByCourseId(int courseId) 
	    {
	        
	        return studentRepository.findStudentsByCourseId(courseId);
	    }

	    @Override
	    public void unregisterStudentFromCourse(Long studentId, int courseId) 
	    {
	        Optional<Student> studentOptional = studentRepository.findById(studentId);
	        if (studentOptional.isPresent())
	        {
	            Student student = studentOptional.get();
	            
	            Optional<Course> courseOptional = courseRepository.findById(courseId);
	            if (courseOptional.isPresent()) 
	            {
	                Course course = courseOptional.get();
	                
	                
	                student.getCourses().remove(course);

	                
	                course.getStudents().remove(student);

	                
	                List<Attendance> attendanceRecords = attendanceRepository.findByStudentAndCourse(student, course);
	                if (!attendanceRecords.isEmpty()) 
	                {
	                    attendanceRepository.deleteAll(attendanceRecords);
	                }

	              
	                List<Exam> examRecords = examRepository.findByStudentAndCourse(student, course);
	                if (!examRecords.isEmpty()) 
	                {
	                    examRepository.deleteAll(examRecords);
	                }

	              
	                courseRepository.save(course);
	                studentRepository.save(student);
	            } 
	            else 
	            {
	                throw new RuntimeException("Course not found with ID: " + courseId);
	            }
	        } 
	        else
	        {
	            throw new RuntimeException("Student not found with ID: " + studentId);
	        }
	    }


	  
	    @Override
	    public Course findCourseById(int  courseId) 
	    {
	    
	        Optional<Course> courseOptional = courseRepository.findById(courseId);
	        return courseOptional.orElse(null);
	    }
		@Override
		public void saveFeedback(Feedback feedback) 
		{
		feedbackRepository.save(feedback);
			
		}
		@Override
		public List<StudentFeedbackResponse> getAllFeedbackResponses()
		{
		    List<StudentFeedbackResponse> responses = studentFeedbackResponseRepository.findAll();
		    System.out.println("All Feedback Responses: " + responses);  // Debugging line
		    return responses;
		}

	



	

}
