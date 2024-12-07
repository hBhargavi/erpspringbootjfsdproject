package com.klef.jfsd.springboot.Controllers;


import java.util.Collections;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;
import com.klef.jfsd.springboot.Models.Timetable;
import com.klef.jfsd.springboot.services.AttendanceService;
import com.klef.jfsd.springboot.services.CourseService;
import com.klef.jfsd.springboot.services.EmailService;
import com.klef.jfsd.springboot.services.FacultyService;
import com.klef.jfsd.springboot.services.TimetableService;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private CourseService courseService;   

    @Autowired
    private EmailService emailService;
    
   
    @Autowired
    private TimetableService timetableService;
  
    
    @PostMapping("facultylogin")
    public ModelAndView checkFacultyLogin(HttpServletRequest request) 
    {
        ModelAndView mv = new ModelAndView();
        String femail = request.getParameter("email");
        String fpwd = request.getParameter("pwd");

       
        Faculty faculty = facultyService.checkfacultylogin(femail, fpwd);

        if (faculty != null)
        {
            
            HttpSession session = request.getSession();
            session.setAttribute("faculty", faculty);
            session.setAttribute("facultyId", faculty.getId());
            mv.setViewName("Facultyhome"); 
        }
        else
        {
            
            Faculty facultyByEmail = facultyService.findByEmail(femail); 
            if (facultyByEmail != null)
            {
                mv.setViewName("FacultyLogin");
                mv.addObject("message", "Invalid Credentials.");
            } 
            else
            {
                mv.setViewName("FacultyLogin");
                mv.addObject("message", "Email Not Found");
            }
        }
        return mv;
    }

    @GetMapping("facultyhome")
    public ModelAndView facultyHome()
    {
        return new ModelAndView("Facultyhome");
    }

    
    @PostMapping("/forgot-password")
    public ModelAndView handleForgotPassword(@RequestParam("email") String email) 
    {
        ModelAndView mv = new ModelAndView();

        
        String subject = "Password Reset Request";
        String message = "Click the link to reset your password: <reset_link_here>";

        emailService.sendEmail(email, subject, message); 

        mv.setViewName("forgotpasswordsuccess"); 
        mv.addObject("message", "Password reset link has been sent to your email.");
        return mv;
    }
    @GetMapping("submitYearAndSemester")
    public ModelAndView submitYearAndSemester(HttpServletRequest request)
    {
      ModelAndView mv=new ModelAndView();
      mv.setViewName("submitYearAndSemester");
      return mv;
    }

    @GetMapping("viewfacultycourses")
    public ModelAndView viewFacultyCourses(
            HttpServletRequest request,
            @RequestParam("cyear") String academicYear,
            @RequestParam("csem") String semester) {
        
        ModelAndView mv = new ModelAndView();

        
        Long facultyId = (Long) request.getSession().getAttribute("facultyId");

        if (facultyId != null) 
        {
            
            List<Course> courses = courseService.getCoursesByFacultyIdAndYearAndSemester(facultyId, academicYear, semester);
            mv.addObject("courses", courses);
            mv.addObject("academicYear", academicYear); 
            mv.addObject("semester", semester); 
            mv.setViewName("viewfacultycourses");
        }
        else
        {
            mv.setViewName("error"); 
            mv.addObject("message", "You need to log in to view your courses.");
        }

        return mv;
    }
    @GetMapping("facultyprofile")
    public ModelAndView faultyprofile()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("facultyprofile");
    	return mv;
    }
    @GetMapping("updatefacultyprofile")
    public ModelAndView updatefacultyprofile()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("updatefacultyprofile");
    	return mv;
    }
    
    @PostMapping("updatefacprofile")
    public ModelAndView updateFacultyProfile(HttpServletRequest request) 
    {
        ModelAndView mv = new ModelAndView();

        try
        {
           
            long id = Long.parseLong(request.getParameter("fid"));
            String password = request.getParameter("fpwd");

           
            Faculty faculty = facultyService.getFacultyById(id);

           
            if (faculty != null)
            {
                faculty.setPassword(password);
                String msg = facultyService.UpdateFacultyProfile(faculty);
                
                mv.setViewName("facultyprofileupdatesuccess"); 
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
	/*
	 * @GetMapping("viewFacultyStudents") public ModelAndView
	 * viewFacultyStudents(HttpServletRequest request) { ModelAndView mv = new
	 * ModelAndView("viewFacultyStudents");
	 * 
	 * // Retrieve facultyId from the session
	 * 
	 * 
	 * Long facultyId = (Long) request.getSession().getAttribute("facultyId");
	 * 
	 * 
	 * // Log the facultyId System.out.println("Faculty ID: " + facultyId);
	 * 
	 * // Redirect to login if facultyId is not in session if (facultyId == null) {
	 * mv.setViewName("redirect:/facultylogin"); return mv; }
	 * 
	 * // Fetch students registered under the selected faculty Set<Student>
	 * registeredStudents =
	 * facultyService.findRegisteredStudentsByFacultyId(facultyId);
	 * 
	 * // Log the size of registeredStudents
	 * System.out.println("Number of registered students: " +
	 * registeredStudents.size());
	 * 
	 * if (registeredStudents.isEmpty()) { mv.addObject("message",
	 * "No students found for the selected faculty."); } else {
	 * mv.addObject("registeredStudents", registeredStudents); }
	 * 
	 * return mv; }
	 */

    @GetMapping("facultyviewstudentbyyearandsem")
    public ModelAndView facultyviewstudentbyyearandsem()
    {
        ModelAndView mv = new ModelAndView("facultyviewstudentbyyearandsem");
        return mv;
    }
    
    
    @PostMapping("selectCoursetoviewstudents")
    public String selectCoursetoviewstudents(@RequestParam String year,
                               @RequestParam String semester,
                               HttpSession session,
                               Model model) {
        Long facultyId = (Long) session.getAttribute("facultyId");
        if (facultyId == null) 
        {
            return "redirect:/facultylogin"; 
        }

        List<Course> courses = facultyService.findCoursesByFacultyYearAndSemester(facultyId, year, semester);
        if (courses.isEmpty()) 
        {
            model.addAttribute("message", "No courses found for the selected year and semester.");
        } 
        else
        {
            model.addAttribute("courses", courses);
        }
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        return "selectCoursetoviewstudents"; 
    }

 

    @PostMapping("viewFacultyStudents")
    public ModelAndView viewFacultyStudents(HttpServletRequest request, 
                                            @RequestParam("year") String year,
                                            @RequestParam("semester") String semester) 
    {
        ModelAndView mv = new ModelAndView("viewFacultyStudents");

        Long facultyId = (Long) request.getSession().getAttribute("facultyId");

       
        System.out.println("Faculty ID: " + facultyId);

       
        if (facultyId == null) 
        {
            mv.setViewName("redirect:/facultylogin");
            return mv;
        }

        
        Set<Student> registeredStudents = facultyService.findRegisteredStudentsByFacultyYearAndSemester(facultyId, year, semester);

        if (registeredStudents.isEmpty()) {
            mv.addObject("message", "No students found for the selected faculty, year, and semester.");
        } else {
            mv.addObject("registeredStudents", registeredStudents);
        }

        return mv;
    }
    
    
    
    
    
 
    
    @GetMapping("facultyviewstuattendance")
    public ModelAndView facultyviewstuattendance()
    {
        ModelAndView mv = new ModelAndView("facultyviewstuattendance");
        return mv;
    }


    @PostMapping("/selectCourseforattendance")
    public String selectCourseforattendance(@RequestParam String year,
                               @RequestParam String semester,
                               HttpSession session,
                               Model model)
    	{
        Long facultyId = (Long) session.getAttribute("facultyId");
        if (facultyId == null) {
            return "redirect:/facultylogin"; 
        }

        
        List<Course> courses = facultyService.findCoursesByFacultyYearAndSemester(facultyId, year, semester);
        if (courses.isEmpty()) 
        {
            model.addAttribute("message", "No courses found for the selected year and semester.");
        } 
        else
        {
            model.addAttribute("courses", courses);
        }
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        return "selectCourseforattendance"; 
    }
    @GetMapping("/viewFacultyAttendance")
    public String viewFacultyAttendance(
        @RequestParam String year,
        @RequestParam String semester,
        @RequestParam Integer courseId,  
        Model model,
        HttpSession session,
        HttpServletRequest request) 
    { 
        
        Long facultyId = (Long) request.getSession().getAttribute("facultyId");
        
        
        Set<Course> courses = facultyService.getCoursesByFacultyId(facultyId);
        if (courses.isEmpty())
        {
            model.addAttribute("message", "No courses found for this faculty.");
            return "facultyDashboard"; 
        }

        
        if (courseId != null) 
        {
            List<Attendance> attendanceRecords = facultyService.getAttendanceByCourseIdAndYearAndSemester(courseId, year, semester);
            
            if (attendanceRecords.isEmpty()) {
                model.addAttribute("message", "No attendance records found for the selected course.");
            } else {
                model.addAttribute("attendanceList", attendanceRecords); // Add the attendance records to the model
            }
        }

        
        Faculty faculty = facultyService.getFacultyById(facultyId);
        model.addAttribute("faculty", faculty);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);
        model.addAttribute("courses", courses); 

        return "facultyAttendance";
    }

    
    
    
	/*
	 * 
	 * 
	 * @GetMapping("/facultytimetable") public String viewFacultyTimetable(Model
	 * model, HttpSession session,HttpServletRequest request) { // Get the logged-in
	 * faculty's ID from the session (assuming it's stored there after login) Long
	 * facultyId = (Long) request.getSession().getAttribute("facultyId");
	 * 
	 * if (facultyId == null) { // Handle case where faculty is not logged in return
	 * "redirect:/facultylogin"; // Or show an error page }
	 * 
	 * // Fetch faculty details using faculty ID Faculty faculty =
	 * facultyService.findById(facultyId);
	 * 
	 * if (faculty == null) { // Handle case where the faculty does not exist return
	 * "redirect:/login"; // Or show an error page }
	 * 
	 * // Fetch timetable for the logged-in faculty List<Timetable> timetableList =
	 * timetableService.findByFaculty(faculty);
	 * 
	 * // Add the faculty and timetable data to the model
	 * model.addAttribute("faculty", faculty); model.addAttribute("timetableList",
	 * timetableList);
	 * 
	  Return the view to display the timetable return "facultytimetable"; //
	 Return the view that displays the timetable }
	 */
    @GetMapping("/facultytimetable")
    public String selectYearAndSemesterForTimetable(Model model, HttpSession session, HttpServletRequest request) 
    {
        Long facultyId = (Long) request.getSession().getAttribute("facultyId");

        if (facultyId == null) {
            return "redirect:/facultylogin";
        }

        
        Faculty faculty = facultyService.findById(facultyId);
        model.addAttribute("faculty", faculty);

       
        return "selectYearAndSemestertimetablefaculty";
    }

    @PostMapping("/viewFacultyTimetable")
    public String viewFacultyTimetable(Model model, HttpSession session, HttpServletRequest request,
                                       @RequestParam("year") String year,
                                       @RequestParam("semester") String semester) {
        Long facultyId = (Long) request.getSession().getAttribute("facultyId");

        if (facultyId == null) {
            return "redirect:/facultylogin";
        }

        Faculty faculty = facultyService.findById(facultyId);

        if (faculty == null) {
            return "redirect:/login";
        }

        
        List<Timetable> timetableList = timetableService.findByFacultyYearAndSemester(faculty, year, semester);

        
        if (timetableList == null)
        {
            timetableList = Collections.emptyList(); 
            model.addAttribute("message", "No timetable found for the selected year and semester.");
        }
        else if (timetableList.isEmpty())
        {
            model.addAttribute("message", "No timetable found for the selected year and semester.");
        } 
        else 
        {
            model.addAttribute("timetableList", timetableList);
        }

        model.addAttribute("faculty", faculty);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        return "facultytimetable";
    }
  
    @GetMapping("/exams")
    public String viewExams(HttpSession session, Model model) 
    {
        Long facultyId = (Long) session.getAttribute("facultyId");
        if (facultyId == null) {
            return "redirect:/login"; 
        }
        List<Exam> exams = facultyService.findExamsByFacultyId(facultyId);
        model.addAttribute("exams", exams);
        return "examList"; 
    }


    @GetMapping("/{examId}")
    public String viewExamDetails(@PathVariable("examId") Long examId, Model model)
    {
        Exam exam = facultyService.findExamById(examId);
        model.addAttribute("exam", exam);
        return "examDetails";
    }

    
    @PostMapping("/grade")
    public String gradeExam(@RequestParam("examId") Long examId, @RequestParam("grade") String grade, Model model) 
    {
        String result = facultyService.gradeExam(examId, grade);
        model.addAttribute("message", result);
        return "redirect:/exams"; 
    }
    @GetMapping("viewPDF/{examId}")
    public ResponseEntity<ByteArrayResource> viewPDF(@PathVariable("examId") Long examId) 
    {
       
        Exam exam = facultyService.findExamById(examId);
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
    @GetMapping("/facultyviewfeedbackresponses")
    public String facultyviewfeedbackresponses(HttpSession session, Model model, HttpServletRequest request) {
        Long facultyId = (Long) session.getAttribute("facultyId");
        if (facultyId == null) {
            return "redirect:/login";
        }

        Faculty faculty = facultyService.findById(facultyId);

        // Get the list of feedback responses for the faculty's courses
        List<StudentFeedbackResponse> feedbackResponses = facultyService.getFeedbackByFacultyId(facultyId);

        // Add feedback responses and faculty to the model
        model.addAttribute("feedbackResponses", feedbackResponses);
        model.addAttribute("faculty", faculty);

        return "facultyviewfeedbackresponses"; // Return the name of the JSP page to display the feedback responses
    }






}
