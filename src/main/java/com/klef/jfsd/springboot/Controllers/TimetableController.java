package com.klef.jfsd.springboot.Controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.Timetable;
import com.klef.jfsd.springboot.services.CourseService;
import com.klef.jfsd.springboot.services.FacultyService;
import com.klef.jfsd.springboot.services.StudentService;
import com.klef.jfsd.springboot.services.TimetableService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TimetableController 
{

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private TimetableService timetableService;
    
    @Autowired
    private StudentService studentService;
    
    @GetMapping("showAddTimetableForm")
    public String showAddTimetableForm(Model model)
    {
    
        List<Faculty> faculties = facultyService.getAllFaculties();
        
       
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);

     
        
        
        model.addAttribute("faculties", faculties);
        
        
        
        return "addTimetable"; 
    }


    @PostMapping("/addTimetable")
    public String addTimetable(
        @RequestParam("faculty") Long facultyId,
        @RequestParam("course") int courseId,
        @RequestParam("daysOfWeek") List<String> daysOfWeek,
        @RequestParam("periods") List<Integer> periods,
        @RequestParam("year") String year,
        @RequestParam("semester") String semester,
        @RequestParam("section") String section,
        Model model
    ) {
        for (String day : daysOfWeek) {
            for (Integer period : periods) {
                // Check if timetable entry already exists
                boolean exists = timetableService.existsByAttributes(facultyId, courseId, day, period, year, semester, section);

                if (!exists) {
                    Timetable timetable = new Timetable();
                    Faculty faculty = facultyService.getFacultyById(facultyId);
                    Course course = courseService.getCourseById(courseId);

                    timetable.setFaculty(faculty);
                    timetable.setCourse(course);
                    timetable.setDayOfWeek(day);
                    timetable.setPeriod(period);
                    timetable.setYear(year);
                    timetable.setSemester(semester);
                    timetable.setSection(section);

                    timetableService.saveTimetable(timetable);
                }
            }
        }

        model.addAttribute("successMessage", "Timetable added successfully!");
        return "addTimetable";
    }


    @GetMapping("selectYearAndSemestertimetable")
    public String selectYearAndSemesterForAdmin(Model model) 
    {
    
        return "selectYearAndSemesterAdmin";
    }
    @GetMapping("timetableList")
    public String viewTimetableListByYearAndSemester(
        @RequestParam(value = "year") String year,
        @RequestParam(value = "semester") String semester,
        Model model
    ) {
        List<Timetable> timetableList;

        
        if (year != null && semester != null) 
        {
            timetableList = timetableService.getTimetablesByYearAndSemester(year, semester);
        } 
        else
        {
            timetableList = timetableService.getAllTimetables();
        }

        model.addAttribute("timetableList", timetableList);
        model.addAttribute("selectedYear", year);
        model.addAttribute("selectedSemester", semester);

        return "timetableList"; 
    }
    
    
    @GetMapping("/studentTimetable")
    public String selectYearAndSemesterForStudentTimetable(Model model, HttpSession session, HttpServletRequest request) {
        Long studentId = (Long) request.getSession().getAttribute("studentId");

        if (studentId == null) 
        {
            return "redirect:/login";
        }

       
        Student student = studentService.findStudentById(studentId);
        model.addAttribute("student", student);

        
        return "selectYearAndSemestertimetableStudent";
    }

    @PostMapping("/viewStudentTimetable")
    public String viewStudentTimetable(Model model, HttpSession session, HttpServletRequest request,
                                       @RequestParam("year") String year,
                                       @RequestParam("semester") String semester) 
    {
        Long studentId = (Long) session.getAttribute("studentId");

        if (studentId == null) 
        {
            return "redirect:/studentlogin";
        }

        Student student = studentService.findStudentById(studentId);

        if (student == null)
        {
            return "redirect:/login";
        }

        Set<Course> studentCourses = student.getCourses();
        List<Timetable> studentTimetable = timetableService.findByStudentCoursesAndSemester(studentCourses, year, semester);

        if (studentTimetable.isEmpty()) 
        {
            model.addAttribute("message", "No timetable found for the selected year and semester.");
        }
        else
        {
            model.addAttribute("studentTimetable", studentTimetable);
        }

        model.addAttribute("student", student);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        return "studentTimetable";
    }

   
}
