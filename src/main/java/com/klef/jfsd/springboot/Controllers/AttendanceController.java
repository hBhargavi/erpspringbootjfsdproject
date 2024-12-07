package com.klef.jfsd.springboot.Controllers;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.services.AttendanceService;
import com.klef.jfsd.springboot.services.CourseService;
import com.klef.jfsd.springboot.services.FacultyService;
import com.klef.jfsd.springboot.services.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private FacultyService facultyService;
    @Autowired
    private CourseService courseService;
    
    
    public LocalDate CurrentDateFunctionContext()
    {
        return LocalDate.now(); 
    }

    

    @GetMapping("/selectYearAndSemesterattendance")
    public String selectYearAndSemesterattendance() 
    {
        return "selectYearAndSemesterattendance"; 
    }
    
    @PostMapping("/selectCourse")
    public String selectCourse(@RequestParam String year,@RequestParam String semester,HttpSession session,Model model)
    {
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

        return "selectCourse"; // JSP page to display courses for selection
    }

    
    
    
    
    
    
    
    
    

    @PostMapping("/viewStudents")
    public String viewStudents(@RequestParam String year,
                               @RequestParam String semester,
                               @RequestParam int courseId, // Add courseId as a parameter
                               HttpSession session,
                               Model model) {
        Long facultyId = (Long) session.getAttribute("facultyId");
        if (facultyId == null) {
            return "redirect:/facultylogin";
        }

        Set<Student> students = facultyService.findRegisteredStudentsByFacultyYearAndSemester(facultyId, year, semester);
        model.addAttribute("students", students);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        Course selectedCourse = courseService.getCourseById(courseId);
        model.addAttribute("course", selectedCourse); 

        return "viewAttendanceForm"; 
    }


	/*
	 * @PostMapping("/submitAttendance") public String
	 * submitAttendance(@RequestParam String year,
	 * 
	 * @RequestParam String semester,
	 * 
	 * @RequestParam Map<String, String> statuses, HttpSession session, Model model)
	 * { Long facultyId = (Long) session.getAttribute("facultyId"); if (facultyId ==
	 * null) { return "redirect:/facultylogin"; // Redirect if faculty is not logged
	 * in }
	 * 
	 * Faculty faculty = facultyService.getFacultyById(facultyId); if (faculty ==
	 * null) { return "redirect:/facultylogin"; // Ensure faculty exists }
	 * 
	 * System.out.println("Year: " + year + ", Semester: " + semester);
	 * System.out.println("Statuses: " + statuses); // Debugging line
	 * 
	 * for (Map.Entry<String, String> entry : statuses.entrySet()) { String key =
	 * entry.getKey(); try { Long studentId =
	 * Long.parseLong(key.substring(key.lastIndexOf('-') + 1)); // Correctly parse
	 * the student ID String status = entry.getValue();
	 * 
	 * Student student = studentService.findStudentById(studentId); if (student !=
	 * null) { // Loop through the student's courses for (Course course :
	 * student.getCourses()) { Attendance attendance = new Attendance();
	 * attendance.setFaculty(faculty); attendance.setStudent(student);
	 * attendance.setAcademicYear(year); attendance.setSemester(semester);
	 * attendance.setStatus(status); attendance.setCourse(course); // Associate
	 * attendance with the course
	 * 
	 * // Set the current date attendance.setDate(LocalDate.now());
	 * 
	 * System.out.println("Saving Attendance: " + attendance);
	 * attendanceService.saveAttendance(attendance); // Save attendance record } } }
	 * catch (NumberFormatException e) { System.out.println("Invalid student ID: " +
	 * key); } }
	 * 
	 * return "redirect:/attendanceSuccess"; // Ensure this is outside the loop }
	 */
    @PostMapping("/submitAttendance")
    public String submitAttendance(@RequestParam String year,
                                   @RequestParam String semester,
                                   @RequestParam Integer courseId, 
                                   @RequestParam Map<String, String> statuses,
                                   HttpSession session,
                                   Model model) {
        Long facultyId = (Long) session.getAttribute("facultyId");
        if (facultyId == null) {
            return "redirect:/facultylogin"; 
        }

        Faculty faculty = facultyService.getFacultyById(facultyId);
        if (faculty == null) {
            return "redirect:/facultylogin"; 
        }

        Course selectedCourse = courseService.getCourseById(courseId); 
        if (selectedCourse == null) {
            model.addAttribute("message", "Selected course not found.");
            return "viewAttendanceForm"; 
        }

        for (Map.Entry<String, String> entry : statuses.entrySet()) {
            String key = entry.getKey();
            try {
                Long studentId = Long.parseLong(key.substring(key.lastIndexOf('-') + 1));
                String status = entry.getValue();

                Student student = studentService.findStudentById(studentId);
                if (student != null) 
                {
                    
                    Attendance existingAttendance = attendanceService.findAttendanceForStudent(faculty, selectedCourse, student, year, semester, LocalDate.now());
                    
                    if (existingAttendance != null) 
                    {
                        model.addAttribute("message", "Attendance already recorded for this section");
                        return "viewAttendanceForm";
                    }
                    Attendance attendance = new Attendance();
                    attendance.setFaculty(faculty);
                    attendance.setStudent(student);
                    attendance.setAcademicYear(year);
                    attendance.setSemester(semester);
                    attendance.setStatus(status);
                    attendance.setCourse(selectedCourse); 
                    attendance.setDate(LocalDate.now());

                    attendanceService.saveAttendance(attendance); 
                }
            } catch (NumberFormatException e) {
                System.out.println("Invalid student ID: " + key);
            }
        }

        return "redirect:/attendanceSuccess"; 
    }


    @GetMapping("/attendanceSuccess")
    public ModelAndView attendanceSuccess() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("attendanceSuccess"); 
        return mv;
    }
    
    @GetMapping("adminviewallattendance")
    public String adminviewallattendance(Model model) 
    {
        List<Attendance> attendanceList = attendanceService.getAllAttendanceRecords();
        model.addAttribute("attendanceList", attendanceList);
        return "adminviewallattendance";  
    }

}
