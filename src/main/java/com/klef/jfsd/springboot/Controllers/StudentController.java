package com.klef.jfsd.springboot.Controllers;

import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;
import com.klef.jfsd.springboot.services.AdminService;
import com.klef.jfsd.springboot.services.AttendanceService;
import com.klef.jfsd.springboot.services.CourseService;
import com.klef.jfsd.springboot.services.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController
{
    
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private AdminService adminService;
    
    
    
    @PostMapping("studentlogin")
    public ModelAndView checkStudentLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String id = request.getParameter("id");
        String spwd = request.getParameter("password");

        if (id == null || spwd == null) {
            mv.setViewName("Login");
            mv.addObject("error", "ID and Password cannot be empty.");
            return mv;
        }

        try {
            Long sid = Long.parseLong(id); 
            Student student = studentService.checkstudentlogin(sid, spwd);
            if (student != null) {
                HttpSession session = request.getSession();
                session.setAttribute("student", student); // Store the entire student object
                session.setAttribute("studentId", student.getId()); // Store the studentId in session
                mv.setViewName("Studenthome");
            } else { 
                mv.setViewName("Login");
                mv.addObject("error", "Invalid login credentials.");
            }
        } catch (NumberFormatException e) {
            mv.setViewName("Login");
            mv.addObject("error", "Invalid ID format.");
        }
        return mv;
    }

   

    @GetMapping("register")
    public ModelAndView viewRegistrationForm(@RequestParam Long studentId) 
    {
        ModelAndView mv = new ModelAndView("studentcourseregistration");
        mv.addObject("studentId", studentId);
        List<Faculty> faculties = studentService.getAllFaculties();
        mv.addObject("faculties", faculties);
        List<Course> allCourses = courseService.getAllCourses();
        mv.addObject("allCourses", allCourses);

        return mv;
    }

    @PostMapping("register/{studentId}")
    public ModelAndView registerStudent(
            @PathVariable Long studentId,
            @RequestParam List<Integer> courseIdList,
            @RequestParam Faculty faculty,
            @RequestParam String section,
            @RequestParam String year,
            @RequestParam String semester) 
    {
        ModelAndView mv = new ModelAndView();
        try {
            for (int courseId : courseIdList) 
            {
                if (studentService.isAlreadyRegistered(studentId, courseId, faculty, section, year, semester)) 
                {
                    mv.setViewName("studentregistrationfail");
                    mv.addObject("error", "Already registered for this course with the same faculty, section, year, and semester.");
                    return mv;
                }
                studentService.registerStudentForCourse(studentId, courseId);
            }
            mv.setViewName("registrationSuccess");
            mv.addObject("message", "Student registered for all selected courses successfully!");
        } catch (Exception e) 
        {
            mv.setViewName("studentregistrationfail");
            mv.addObject("error", "Registration failed: " + e.getMessage());
        }
        return mv;
    }


    @GetMapping("courses")
    @ResponseBody
    public List<Course> fetchCourses() 
    {
        
        return courseService.getAllCourses(); 
    }
    
    
	/*
	 * @GetMapping("viewRegisteredCourses/{studentId}") public ModelAndView
	 * viewStudentRegisteredCourses(@PathVariable Long studentId) { ModelAndView mv
	 * = new ModelAndView("viewRegisteredCourses"); // JSP file name
	 * 
	 * // Fetch the student and their registered courses Student student =
	 * studentService.findById(studentId) // Assume this method exists
	 * .orElseThrow(() -> new RuntimeException("Student not found"));
	 * 
	 * Set<Course> registeredCourses = student.getRegisteredCourses(); // Assuming
	 * this is a collection in the Student class
	 * 
	 * mv.addObject("student", student); mv.addObject("registeredCourses",
	 * registeredCourses);
	 * 
	 * return mv; }
	 * 
	 */

    @GetMapping("studentsubmitYearAndSemester")
    public ModelAndView studentsubmitYearAndSemesterForStudent(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentsubmitYearAndSemester"); 
        return mv;
    }

	/*
	 * @GetMapping("viewRegisteredCourses/{studentId}") public ModelAndView
	 * viewStudentRegisteredCourses(@PathVariable Long studentId) { ModelAndView mv
	 * = new ModelAndView("viewRegisteredCourses"); // JSP file name
	 * 
	 * // Fetch the student and their registered courses Student student =
	 * studentService.findById(studentId) // Assume this method exists
	 * .orElseThrow(() -> new RuntimeException("Student not found"));
	 * 
	 * Set<Course> registeredCourses = student.getRegisteredCourses(); // Assuming
	 * this is a collection in the Student class
	 * 
	 * mv.addObject("student", student); mv.addObject("registeredCourses",
	 * registeredCourses);
	 * 
	 * return mv; }
	 */
    @PostMapping("viewstudentcourses")
    public ModelAndView viewStudentRegisteredCourses(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView("viewRegisteredCourses");
        HttpSession session = request.getSession();
        Long studentId = (Long) session.getAttribute("studentId");
        
        if (studentId == null) 
        {
            mv.addObject("message", "Student ID not found in session. Please log in again.");
            mv.setViewName("studentloginfail"); 
            return mv;
        }

       
        String year = request.getParameter("year");
        String semester = request.getParameter("semester");

        if (year == null || semester == null || year.isEmpty() || semester.isEmpty()) {
            mv.addObject("message", "All fields are required. Please select a year and semester.");
            return mv;
        }

        
        Set<Course> registeredCourses = studentService.findRegisteredCoursesByStudentIdAndYearAndSemester(studentId, year, semester);

        if (registeredCourses.isEmpty()) {
            mv.addObject("message", "No courses found for the selected year and semester.");
        } else {
            mv.addObject("registeredCourses", registeredCourses);
        }

        return mv;
    }
    

    
    
    
    
    
    
    
    
    @GetMapping("selectYearAndSemesterstudentattattendance")
    public String selectYearAndSemesterstudentattattendance(Model model, HttpSession session) 
    {
        Long studentId = (Long) session.getAttribute("studentId");
        
        if (studentId == null) 
        {
            model.addAttribute("message", "No student selected. Please log in again.");
            return "studentLogin"; 
        }

      
        Student student = studentService.findStudentById(studentId);
        model.addAttribute("student", student);
        
        return "selectYearAndSemesterstudentattattendance"; 
    }
    
    
    @PostMapping("/viewStudentAttendance")
    public String viewStudentAttendance(@RequestParam String year, @RequestParam String semester, Model model, HttpSession session) {
        Long studentId = (Long) session.getAttribute("studentId");
        
        if (studentId == null)
        {
            model.addAttribute("message", "No student selected.");
            return "studentLogin"; 
        }

        List<Attendance> attendanceList = attendanceService.getAttendanceByStudentIdAndYearAndSemester(studentId, year, semester);
        
        if (attendanceList.isEmpty()) 
        {
            model.addAttribute("message", "No attendance records found for the selected year and semester.");
        } 
        else
        {
            model.addAttribute("attendanceList", attendanceList);
        }
        
        Student student = studentService.findStudentById(studentId);
        model.addAttribute("student", student);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        return "studentAttendance"; 
    }
    
    @GetMapping("studentprofile")
    public ModelAndView faultyprofile()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("studentprofile");
    	return mv;
    }
    @GetMapping("studentprofileupdate")
    public ModelAndView studentprofileupdate()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("studentprofileupdate");
    	return mv;
    }
    @PostMapping("updatestuprofile")
    public ModelAndView updateFacultyProfile(HttpServletRequest request) 
    {
        ModelAndView mv = new ModelAndView();

        try
        {
            
            long id = Long.parseLong(request.getParameter("sid"));
            String password = request.getParameter("spwd");

            
            Student student = studentService.findStudentById(id);

            
            if (student != null)
            {
                student.setPassword(password);
                String msg = studentService.UpdateStudentProfile(student);
                
                mv.setViewName("studentprofileupdatesuccess"); 
                mv.addObject("message", msg);
            } 
            else 
            {
                mv.setViewName("updateerror");
                mv.addObject("message", "Faculty not found.");
            }
        } 
        catch (Exception e) 
        {
            mv.setViewName("updateerror");
            mv.addObject("message", "Error occurred: " + e);
        }

        return mv;
    }
    
    
    @GetMapping("studentexamsemandyear")
    public String studentexamsemandyear()
    {
    	return "studentexamsemandyear";
    }
    
    @GetMapping("/studentexams")
    public String viewStudentExams(
            @RequestParam(value = "year", required = false) String year,
            @RequestParam(value = "semester", required = false) String semester,
            HttpSession session, Model model) {
        
        Long studentId = (Long) session.getAttribute("studentId");        
        if (studentId == null) {
            return "redirect:/login";  
        }

        List<Exam> exams;
        if (year != null && semester != null)
        {
            exams = studentService.findExamsForStudentByYearAndSemester(studentId, year, semester);
        } else {
            exams = studentService.findExamsForStudent(studentId);
        }

        if (exams.isEmpty()) {
            model.addAttribute("message", "No exams found for this student.");
        } else {
            model.addAttribute("exams", exams); 
        }

        return "studentExamsList";  
    }

    @GetMapping("/viewExamDetails/{examId}")
    public String viewExamDetails
    (
            @PathVariable("examId") Long examId,
            @RequestParam(value = "year", required = false) String year,
            @RequestParam(value = "semester", required = false) String semester,
            Model model) {
        
        Exam exam = studentService.findExamByIdAndYearAndSemester(examId, year, semester);

        if (exam == null) {
            model.addAttribute("message", "Exam details not found.");
            return "redirect:/studentexams";
        }

        model.addAttribute("exam", exam);  
        return "studentExamDetails"; 
    }


    
    @GetMapping("/viewstuexamPDF/{examId}")
    public ResponseEntity<ByteArrayResource> viewExamPDF(@PathVariable("examId") Long examId) 
    {

        Exam exam = studentService.findExamById(examId);

        if (exam == null || exam.getPdfFile() == null) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        try
        {
            ByteArrayResource resource = new ByteArrayResource(exam.getPdfFile());
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .contentLength(resource.contentLength())
                    .body(resource);
        } 
        catch (Exception e) 
        {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    
    @GetMapping("/studentsemandyearfeedback")
    public String studentsemandyearfeedback() 
    {
       
        return "studentsemandyearfeedback";
    }
    
   
    @GetMapping("/studentshowfeedbackform")
    public String showFeedbackForm(@RequestParam("year") String year,
                                         @RequestParam("semester") String semester, 
                                         HttpServletRequest request, 
                                         Model model) {
        // Retrieve student ID from the session
        HttpSession session = request.getSession();
        Long studentId = (Long) session.getAttribute("studentId");

        if (studentId == null) {
            model.addAttribute("error", "You must be logged in to submit feedback.");
            return "Login"; // Redirect to login if no student ID is found
        }

        // Get the feedback form for the selected year and semester
        Feedback feedback = studentService.findFeedbackByYearAndSemester(year, semester);

        if (feedback != null) 
        {
            // Get registered courses for the student
            Set<Course> registeredCourses = studentService.findRegisteredCoursesByStudentIdforfeedback(studentId);

            if (registeredCourses.isEmpty()) {
                model.addAttribute("error", "No registered courses found for the student.");
                return "studentsemandyearfeedback"; // Redirect back with error
            }

            // Add feedback and courses to the model
            model.addAttribute("registeredCourses", registeredCourses);
            model.addAttribute("feedback", feedback);

            return "studentfeedbacksubmit"; // JSP page for feedback submission
        } else {
            // No feedback form found for the given year and semester
            model.addAttribute("error", "No feedback form found for the selected year and semester.");
            return "studentsemandyearfeedback"; // Redirect back to the page with an error message
        }
    }

    @PostMapping("/submitfeedback")
    public String submitFeedback(
            @RequestParam Long feedbackId,
            @RequestParam Long studentId,
            @RequestParam("courseId") String[] courseIds,  // Accept multiple course IDs
            @RequestParam String response1,
            @RequestParam String response2,
            @RequestParam String response3,
            @RequestParam String response4,
            @RequestParam String response5,
            Model model) {

        // Check if the feedback response already exists
        boolean feedbackAlreadySubmitted = studentService.isFeedbackAlreadySubmitted(feedbackId, studentId);

        if (feedbackAlreadySubmitted) 
        {
            model.addAttribute("error", "You have already submitted feedback .");
            return "studentsemandyearfeedback"; // Redirect to feedback selection page
        }

        // Fetch student and feedback details
        Student student = studentService.findStudentById(studentId);
        Feedback feedback = studentService.getFeedbackById(feedbackId);

        if (student == null || feedback == null)
        {
            model.addAttribute("error", "Invalid student or feedback details.");
            return "error"; // Redirect to error page
        }

        // Handle multiple course IDs
        for (String courseIdStr : courseIds) {
            try {
                int courseId = Integer.parseInt(courseIdStr.trim()); // Convert to int
                Course course = courseService.getCourseById(courseId);

                if (course != null) {
                    // Create and save feedback response for each course
                    StudentFeedbackResponse feedbackResponse = new StudentFeedbackResponse();
                    feedbackResponse.setFaculty(course.getFaculty()); // Ensure faculty is set
                    feedbackResponse.setStudent(student);  // Set other fields
                    feedbackResponse.setFeedback(feedback);
                    feedbackResponse.setCourse(course); // Set the course
                    feedbackResponse.setResponse1(response1);
                    feedbackResponse.setResponse2(response2);
                    feedbackResponse.setResponse3(response3);
                    feedbackResponse.setResponse4(response4);
                    feedbackResponse.setResponse5(response5);

                    studentService.saveFeedbackResponse(feedbackResponse);
                } else {
                    model.addAttribute("error", "Invalid course ID: " + courseIdStr);
                    return "errorpage"; // Redirect to error page if course not found
                }
            } catch (NumberFormatException e) {
                model.addAttribute("error", "Invalid course ID format: " + courseIdStr);
                return "errorpage"; // Redirect to error page if course ID is not valid
            }
        }

        model.addAttribute("message", "Feedback submitted successfully!");
        return "studentsemandyearfeedbacksucess"; // Return to feedback success page
    }


    
}




