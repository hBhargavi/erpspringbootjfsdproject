package com.klef.jfsd.springboot.Controllers;

import java.io.IOException;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.Models.Admin;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.Leave;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;
import com.klef.jfsd.springboot.services.AdminService;
import com.klef.jfsd.springboot.services.CourseService;
import com.klef.jfsd.springboot.services.FacultyService;
import com.klef.jfsd.springboot.services.StudentService;

import jakarta.mail.internet.ParseException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{

    @Autowired
    private AdminService adminService;

    @Autowired
    private FacultyService facultyService;
    
    @Autowired
    private CourseService courseService;
    
    @Autowired
    private StudentService studentService;
    

    @GetMapping("adminnavbar")
    public ModelAndView adminnavbar() 
    {
        return new ModelAndView("adminnavbar");
    }

    @PostMapping("checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request)
    {
        String auname = request.getParameter("auname");
        String apwd = request.getParameter("apwd");
        Admin admin = adminService.checkadminlogin(auname, apwd);
        ModelAndView mv = new ModelAndView();

        if (admin != null) 
        {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            //session.setMaxInactiveInterval(10);
            mv.setViewName("Adminhome");
            long count=adminService.faccount();
            mv.addObject("count",count);
            
            long stucount=adminService.stucount();
            mv.addObject("stucount",stucount);
        } 
        else
        {
            mv.setViewName("AdminLogin");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }
    @GetMapping("updateadminprofile")
    public ModelAndView updateadminprofile()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("updateadminprofile");
    	return mv;
    }
    
    @PostMapping("updateadprofile")
    public ModelAndView updateadprofile(HttpServletRequest request)
    {
      ModelAndView mv = new ModelAndView();
      
     try
     {
        
        String name = request.getParameter("aname");
       String pwd = request.getParameter("apwd");
      
       
        Admin a=new Admin();
        a.setUsername(name);
        a.setPassword(pwd);
         
         String msg = adminService.UpdateAdminProfile(a);
         
         Admin aa = adminService.displayadminbyusername(name);
         
          HttpSession session = request.getSession();
          session.setAttribute("admin",aa); //employee is session variable
        
        
         mv.setViewName("updatesuccess");
         mv.addObject("message", msg);
       
     }
     catch(Exception e)
     {
       mv.setViewName("updateerror");
       mv.addObject("message", e);
     }
       return mv;
    }
  
    
  
    @GetMapping("facreg")
    public ModelAndView facreg() 
    {
        return new ModelAndView("facultyreg");
    }

    @PostMapping("insertfaculty")
    public ModelAndView insertFaculty(HttpServletRequest request,@RequestParam("facultyprofileimage")  MultipartFile file) throws Exception 
    {
        Faculty faculty = new Faculty();

        
        Long id = Long.parseLong(request.getParameter("facultyid"));
        faculty.setId(id);
        faculty.setFirstName(request.getParameter("firstName"));
        faculty.setMiddleName(request.getParameter("middleName"));
        faculty.setLastName(request.getParameter("lastName"));
        faculty.setGender(request.getParameter("gender"));
        faculty.setFatherName(request.getParameter("fatherName"));
        faculty.setMotherName(request.getParameter("motherName"));
        faculty.setBloodGroup(request.getParameter("bloodGroup"));
        faculty.setMaritalStatus(request.getParameter("maritalStatus"));
        faculty.setMotherTongue(request.getParameter("motherTongue"));
        faculty.setCastCategory(request.getParameter("castCategory"));
        faculty.setEmail(request.getParameter("email"));
        faculty.setPhoneNumber(request.getParameter("phoneNumber"));
        faculty.setIdentification(request.getParameter("identification"));
        faculty.setReligion(request.getParameter("religion"));
        faculty.setNationality(request.getParameter("nationality"));
        faculty.setDesignation(request.getParameter("designation"));
       faculty.setCoursestaught(request.getParameter("coursesTaught"));
        faculty.setDepartment(request.getParameter("department"));
        faculty.setRecruitAgency(request.getParameter("recruitAgency"));
        faculty.setPfNumber(request.getParameter("pfNumber"));
        faculty.setRecruitmentType(request.getParameter("recruitmentType"));
        faculty.setResumeLink(request.getParameter("resumeLink"));
        faculty.setApprovalStatus("Registered");
        faculty.setDisability(request.getParameter("disability"));
        faculty.setPlaceOfBirth(request.getParameter("placeOfBirth"));
        faculty.setExperience(request.getParameter("experience"));
        faculty.setPassword("klu");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        faculty.setDob(sdf.parse(request.getParameter("dob")));
        faculty.setJoiningDate(sdf.parse(request.getParameter("joiningDate")));
       
        	try {
            String height = request.getParameter("height");
            String weight = request.getParameter("weight");

            faculty.setHeight(height != null && !height.isEmpty() ? Double.parseDouble(height) : 0.0);
            faculty.setWeight(weight != null && !weight.isEmpty() ? Double.parseDouble(weight) : 0.0);
        } catch (NumberFormatException e) {
            System.err.println("Invalid number format: " + e.getMessage());
            faculty.setHeight(0.0);
            faculty.setWeight(0.0);
        }

       
        faculty.setAddress(request.getParameter("address"));
        faculty.setCity(request.getParameter("city"));
        faculty.setState(request.getParameter("state"));
        faculty.setCountry(request.getParameter("country"));
        faculty.setPostalCode(request.getParameter("postalCode"));
        byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		  
		 faculty.setfacultyprofile(blob);
       
        String message = facultyService.FacultyRegistration(faculty);

        
        ModelAndView mv = new ModelAndView("facregsuccess");
        mv.addObject("message", message);
        return mv;
    }


    @GetMapping("viewallfaculty")
    public ModelAndView viewallfaculty() 
    {
        List<Faculty> faclist = adminService.viewallfaculty();
        ModelAndView mv = new ModelAndView("viewallfaculty");
        mv.addObject("facultyList", faclist);
        return mv;
    }
    
    
    @GetMapping("displayfacultyprofile")
    public ResponseEntity<byte[]> displayfacultyprofile(@RequestParam("id") int id) throws Exception
    {
      Faculty faculty=facultyService.getFacultyById(id);
      byte [] imageBytes = null;
      imageBytes = faculty.getfacultyprofile().getBytes(1,(int) faculty.getfacultyprofile().length());

      return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
      
    
    }
    
    
    
    
    @GetMapping("deletefaculty")
    public ModelAndView deletefaculty() 
    {
        
        List<Faculty> faclist = adminService.viewallfaculty();
        
        
        ModelAndView mv = new ModelAndView("deletefaculty");
        
        
        mv.addObject("faclist", faclist);
        
        return mv;
    }

    @GetMapping("delete")
    public String deleteoperation(@RequestParam("id") long fid) 
    {
    
        adminService.deleteFaculty(fid);
        
    
        return "redirect:/deletefaculty";
    }

    
    
    @GetMapping("updatefacultystatus")
    public ModelAndView updatefacultystatus()
    {
        List<Faculty> faclist = adminService.viewallfaculty();
        ModelAndView mv = new ModelAndView("updatefacultystatus");
        mv.addObject("faclist", faclist);
        return mv;
    }
    
    @GetMapping("updatestatus")
    public String updatestatus(@RequestParam("email") String email, @RequestParam("approvalStatus") String status) 
    {
        adminService.updatefacultystatus(status, email);
        return "redirect:/updatefacultystatus";
    }
    
    
    @GetMapping("updatefacdetails")
    public ModelAndView updatefacdetails()
    {
    	
    	 List<Faculty> facultyList= adminService.viewallfaculty();
         ModelAndView mv = new ModelAndView("updatefacdetails");
         mv.addObject("facultyList", facultyList);
    	return mv;
    }
    
    @GetMapping("updatefacultydetails")
    public String updatefacultydetails(@RequestParam("fid") long id, Model model) 
    {
        Faculty faculty = facultyService.getFacultyById(id);
        model.addAttribute("faculty", faculty);
        return "updatefacultydetails";
    }



    @PostMapping("/updatefaculty")
    public ModelAndView updatefaculty(HttpServletRequest request) throws ParseException, java.text.ParseException {
        ModelAndView mv = new ModelAndView();
        
        long id = Long.parseLong(request.getParameter("fid"));
        
        Faculty faculty = facultyService.getFacultyById(id);
        
        if (faculty != null) 
        {
            faculty.setFirstName(request.getParameter("fname"));
            faculty.setMiddleName(request.getParameter("mname"));
            faculty.setLastName(request.getParameter("lname"));
            faculty.setGender(request.getParameter("gender"));
            faculty.setFatherName(request.getParameter("fatherName"));
            faculty.setMotherName(request.getParameter("motherName"));
            faculty.setBloodGroup(request.getParameter("bloodGroup"));
            faculty.setMaritalStatus(request.getParameter("maritalStatus"));
            faculty.setMotherTongue(request.getParameter("motherTongue"));
            faculty.setCastCategory(request.getParameter("castCategory"));
            faculty.setEmail(request.getParameter("email"));
            faculty.setPhoneNumber(request.getParameter("phone"));
            faculty.setIdentification(request.getParameter("identification"));
            faculty.setReligion(request.getParameter("religion"));
            faculty.setNationality(request.getParameter("nationality"));
            faculty.setCoursestaught(request.getParameter("coursestaught"));
            faculty.setRecruitAgency(request.getParameter("recruitAgency"));
            faculty.setPfNumber(request.getParameter("pfNumber"));
            faculty.setRecruitmentType(request.getParameter("recruitmentType"));
            faculty.setResumeLink(request.getParameter("resumeLink"));
            faculty.setApprovalStatus("Accepted");
            faculty.setDisability(request.getParameter("disability"));
            faculty.setPlaceOfBirth(request.getParameter("placeOfBirth"));
            faculty.setExperience(request.getParameter("experience"));
            faculty.setAddress(request.getParameter("address"));
            faculty.setCity(request.getParameter("city"));
            faculty.setState(request.getParameter("state"));
            faculty.setCountry(request.getParameter("country"));
            faculty.setPostalCode(request.getParameter("postalCode"));
         
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date dob = dateFormat.parse(request.getParameter("dob"));
			faculty.setDob(dob);
			
			java.util.Date joiningDate = dateFormat.parse(request.getParameter("joiningDate"));
			faculty.setJoiningDate(joiningDate);

            
            adminService.updatefacultydetails(faculty);
            
            mv.setViewName("updatefacultySuccess");
            mv.addObject("message", "Faculty updated successfully.");
        } else {
            mv.setViewName("errorPage");
            mv.addObject("message", "Faculty not found.");
        }
        
        return mv;
    }
 
    
    
    
    @GetMapping("updatestudetails")
    public ModelAndView updatestudetails()
    {
    	
    	 List<Student> stulist= adminService.viewallstudents();
         ModelAndView mv = new ModelAndView("updatestudetails");
         mv.addObject("stulist", stulist);
    	return mv;
    }
    @GetMapping("updatestudentdetails")
    public String updatestudentdetails(@RequestParam(value = "sid", required = false) String idParam, Model model) 
    {
        if (idParam == null || idParam.isEmpty())
        {
           
            return "errorPage";
        }

        try
        {
            long id = Long.parseLong(idParam);
            Student student = studentService.findStudentById(id);
            model.addAttribute("student", student);
            return "updatestudentdetails";
        } 
        catch (NumberFormatException e) 
        {
        
            return "errorPage";
        }
    }


    @PostMapping("/updatestudent")
    public ModelAndView updatestudent(HttpServletRequest request) throws ParseException, java.text.ParseException
    {
        ModelAndView mv = new ModelAndView();

        long id = Long.parseLong(request.getParameter("id"));
        Student student = studentService.findStudentById(id);

        if (student != null) {
            student.setFirstName(getParameterValue(request, "firstName"));
            student.setLastName(getParameterValue(request, "lastName"));
            student.setGender(getParameterValue(request, "gender"));
            student.setFatherName(getParameterValue(request, "fatherName"));
            student.setMotherName(getParameterValue(request, "motherName"));
            student.setContactNo(getParameterValue(request, "contactNo"));
            student.setPermanentAddress(getParameterValue(request, "permanentAddress"));
            student.setBloodGroup(getParameterValue(request, "bloodGroup"));
            student.setMaritalStatus(getParameterValue(request, "maritalStatus"));
            student.setMotherTongue(getParameterValue(request, "motherTongue"));
            student.setCasteCategory(getParameterValue(request, "casteCategory"));
            student.setPersonalEmail(getParameterValue(request, "personalEmail"));
            student.setIdentification(getParameterValue(request, "identification"));
            student.setDisability(getParameterValue(request, "disability"));
            student.setPlaceOfBirth(getParameterValue(request, "placeOfBirth"));
            student.setReligion(getParameterValue(request, "religion"));
            student.setNationality(getParameterValue(request, "nationality"));

            
            String heightParam = request.getParameter("height");
            if (heightParam != null && !heightParam.isEmpty()) 
            {
                student.setHeight(Double.parseDouble(heightParam));
            }

            String weightParam = request.getParameter("weight");
            if (weightParam != null && !weightParam.isEmpty()) {
                student.setWeight(Double.parseDouble(weightParam));
            }

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            
            String dobParam = request.getParameter("dob");
            if (dobParam != null && !dobParam.isEmpty()) 
            {
                java.util.Date dob = dateFormat.parse(dobParam);
                student.setDateOfBirth(dob);
            }

            
            String admissionDateParam = request.getParameter("admissionDate");
            if (admissionDateParam != null && !admissionDateParam.isEmpty()) 
            {
                java.util.Date admissionDate = dateFormat.parse(admissionDateParam);
                student.setAdmissionDate(admissionDate);
            }

            student.setMajorDegree(getParameterValue(request, "majorDegree"));
            student.setReferredBy(getParameterValue(request, "referredBy"));
            student.setProgram(getParameterValue(request, "program"));
            student.setRegulation(getParameterValue(request, "regulation"));
            student.setHostelStatus(getParameterValue(request, "hostelStatus"));
            student.setHighSchool(getParameterValue(request, "highSchool"));
            student.setIntermediate(getParameterValue(request, "intermediate"));

            adminService.updatestudentdetails(student);

            mv.setViewName("updateStudentSuccess");
            mv.addObject("message", "Student updated successfully.");
        } 
        else
        {
            mv.setViewName("errorPage");
            mv.addObject("message", "Student not found.");
        }

        return mv;
    }

   
    private String getParameterValue(HttpServletRequest request, String parameterName) 
    {
        String value = request.getParameter(parameterName);
        return value != null ? value : "";
    }

    
    

    
    @GetMapping("addstu")
    public ModelAndView addstu() 
    {
        return new ModelAndView("Studentreg");
    }

    @PostMapping("insertstudent")
    public ModelAndView insertStudent(HttpServletRequest request, @RequestParam("studentprofileimage")  MultipartFile file) throws Exception 
    {
        Student student = new Student();
        Long id = Long.parseLong(request.getParameter("id"));
        student.setId(id);
        student.setFirstName(request.getParameter("firstName"));
        student.setLastName(request.getParameter("lastName"));
        student.setGender(request.getParameter("gender"));
        student.setFatherName(request.getParameter("fatherName"));
        student.setMotherName(request.getParameter("motherName"));
        student.setContactNo(request.getParameter("contactno"));
        student.setPermanentAddress(request.getParameter("permanentAddress"));
        student.setDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth")));
        student.setAdmissionDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("admissionDate")));
        student.setBloodGroup(request.getParameter("bloodGroup"));
        student.setMaritalStatus(request.getParameter("maritalStatus"));
        student.setMotherTongue(request.getParameter("motherTongue"));
        student.setCasteCategory(request.getParameter("casteCategory"));
        student.setPersonalEmail(request.getParameter("personalEmail"));
        student.setIdentification(request.getParameter("identification"));
        student.setDisability(request.getParameter("disability"));
        student.setPlaceOfBirth(request.getParameter("placeOfBirth"));
        student.setHeight(Double.parseDouble(request.getParameter("height")));
        student.setWeight(Double.parseDouble(request.getParameter("weight")));
        student.setReligion(request.getParameter("religion"));
        student.setNationality(request.getParameter("nationality"));
        student.setMajorDegree(request.getParameter("majorDegree"));
        student.setReferredBy(request.getParameter("referredBy"));
        student.setProgram(request.getParameter("program"));
        student.setRegulation(request.getParameter("regulation"));
        student.setHostelStatus(request.getParameter("hostelStatus"));
        student.setHighSchool(request.getParameter("highschool"));
        student.setIntermediate(request.getParameter("intermediate"));
        student.setPassword("klu");
        

        byte[] bytes = file.getBytes();
        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
        student.setStudentprofile(blob);

        String message = adminService.studentregistration(student);

        ModelAndView mv = new ModelAndView("Studentreg");
        mv.addObject("message", message);
        return mv;
    }

    @GetMapping("viewallstudents")
    public ModelAndView viewallstudents() 
    {
        List<Student> stulist = adminService.viewallstudents();
        ModelAndView mv = new ModelAndView("viewallstudents");
        mv.addObject("stulist", stulist);
        return mv;
    }
    
    
    @GetMapping("displaystudentprofile")
    public ResponseEntity<byte[]> displaystudentprofile(@RequestParam("id") long id) throws Exception
    {
     Student student=studentService.findStudentById(id);
      byte [] imageBytes = null;
      imageBytes = student.getStudentprofile().getBytes(1,(int)student.getStudentprofile().length());

      return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
      
   
    }
    

    @GetMapping("home")
    public ModelAndView adminHome(HttpServletRequest request) 
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("Adminhome");
            long count=adminService.faccount();
            mv.addObject("count",count);
            
            long stucount=adminService.stucount();
            mv.addObject("stucount",stucount);
            return mv;
        
    }

    @GetMapping("adminprofile")
    public String myprofile() 
    {
        return "adminprofile";
    }

    @GetMapping("deletestudent")
    public ModelAndView deletestudent() 
    {
        List<Student> stulist = adminService.viewallstudents();
        ModelAndView mv = new ModelAndView("deletestudent");
        mv.addObject("stulist", stulist);
        return mv;
    }

    @GetMapping("deletestu")
    public String deleteoperationstu(@RequestParam("id") Long eid) 
    {
        adminService.deletestudent(eid);
        return "redirect:/deletestudent";
    }

    @GetMapping("insertcourse")
    public ModelAndView insertcourse() 
    {
        ModelAndView mv = new ModelAndView("addcourse");
        List<Faculty> facultyList = adminService.viewallfaculty(); 
        mv.addObject("facultyList", facultyList); 
        return mv;
    }
    @PostMapping("addcourse")
    public ModelAndView addcourse(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView();

        // Extract course data from the request
        String courseName = request.getParameter("courseName");
        long facultyId = Long.parseLong(request.getParameter("facultyId"));
        int credits = Integer.parseInt(request.getParameter("credits"));
        String cyear = request.getParameter("cyear");
        String csem = request.getParameter("csem");
        String section = request.getParameter("section");
        String ltps = request.getParameter("ltps");
        String coursecode = request.getParameter("coursecode");
        String reg=request.getParameter("regulation");

        // Retrieve the selected Faculty using facultyId
        Faculty selectedFaculty = facultyService.getFacultyById(facultyId);

        if (selectedFaculty == null) 
        {
            // Invalid faculty scenario
            mv.setViewName("addcourse");
            mv.addObject("message", "Invalid faculty selected.");
            return mv;
        }

        // Check if the course already exists for this faculty and section
     // Check if the course already exists for this faculty, course code, and section
        boolean courseExists = courseService.isCourseAlreadyMappedToFaculty(facultyId, coursecode, section);
        if (courseExists) {
            mv.setViewName("addcourse");
            mv.addObject("message", "This course is already added for the selected faculty and section.");
            return mv;
        }

        
        Course course = new Course();
        course.setCourseName(courseName);
        course.setFaculty(selectedFaculty);  
        course.setCredits(credits);
        course.setYear(cyear);
        course.setSemester(csem);
        course.setSection(section);
        course.setCoursecode(coursecode);
        course.setLtps(ltps);
        course.setRegulation(reg);

       
        adminService.addcourse(course);

        
        mv.setViewName("courseaddsuccess");
        mv.addObject("message", "Course added successfully!");
        return mv;
    }


    
    @GetMapping("selectsemandyearforcourseview")
    public ModelAndView selectsemandyearforcourseview()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("selectsemandyearforcourse");
        return mv;
    }

    @GetMapping("viewallcourses")
    public ModelAndView viewAllCourses(@RequestParam("year") String year, @RequestParam("semester") String semester) {
        ModelAndView mv = new ModelAndView("viewallcourses");
        List<Course> filteredCourses = adminService.getCoursesByYearAndSemester(year, semester);
        mv.addObject("courses", filteredCourses);
        return mv;
    }
//update all courses by admin
    @GetMapping("updatecoursedetails")
    public ModelAndView updatecoursedetails() {
        List<Course> courseList = adminService.getAllCourses();
        List<Faculty> faculties = facultyService.getAllFaculties(); 
        
        ModelAndView mv = new ModelAndView("updatecourdetails");
        mv.addObject("courseList", courseList);
        mv.addObject("faculties", faculties);  
        
        return mv;
    }

    
    @GetMapping("updateallcourses")
    public String updateallcourses(@RequestParam("cid") int id, @RequestParam("fid") long fid, Model model) 
    {
        Course course = courseService.getCourseById(id);
        Faculty faculty = facultyService.getFacultyById(fid);
        List<Faculty> faculties = facultyService.getAllFaculties(); 
        
        model.addAttribute("course", course);
        model.addAttribute("faculty", faculty);
        model.addAttribute("faculties", faculties); // Add the full list of faculties
        return "updateallcourses";
    }

    @PostMapping("/updateallcourse")
    public ModelAndView updateallcourse(HttpServletRequest request) throws ParseException, java.text.ParseException {
        ModelAndView mv = new ModelAndView();

        int courseId = Integer.parseInt(request.getParameter("courseId"));
        
       
        Course course = courseService.getCourseById(courseId);
        
        if (course != null)
        {
        
            String courseName = request.getParameter("courseName");
            String courseCode = request.getParameter("courseCode");
            int credits = Integer.parseInt(request.getParameter("credits"));
            String ltps = request.getParameter("ltps");
            String year = request.getParameter("year");
            String semester = request.getParameter("semester");
            
            
            int facultyId = Integer.parseInt(request.getParameter("facultyId"));
            String section=request.getParameter("section");
            
            Faculty faculty = facultyService.getFacultyById(facultyId);
            
            
            course.setCourseName(courseName);
            course.setCoursecode(courseCode);
            course.setCredits(credits);
            course.setLtps(ltps);
            course.setYear(year);
            course.setSemester(semester);
            course.setFaculty(faculty); 
            course.setSection(section);
            
            courseService.updateCourse(course);

            mv.addObject("message", "Course updated successfully!");
            mv.setViewName("redirect:/updatecoursedetails");
        } 
        else
        {
            mv.addObject("message", "Course not found!");
            mv.setViewName("error");
        }

        return mv;
    }

    
    
    
    
    
    
    
    @GetMapping("selectsemandyearforcoursedelete")
    public ModelAndView selectsemandyearforcoursedelete() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("selectsemandyearforcoursedelete");
        return mv;
    }

    @GetMapping("/deletecourse")
    public ModelAndView showDeleteCoursePage(@RequestParam("year") String year, @RequestParam("semester") String semester) {
        List<Course> courselist = adminService.getCoursesByYearAndSemester(year, semester);
        ModelAndView mv = new ModelAndView("deletecourse");
        mv.addObject("courselist", courselist);
        return mv;
    }
    
    @GetMapping("deletecoursebyid")
    public String deleteoperationcourse(@RequestParam("id") int courseId,
                                        @RequestParam("semester") String semester,
                                        @RequestParam String year)
                                        
    {
        
        adminService.unregisterStudentsFromCourse(courseId);
        
        
        adminService.deleteCourse(courseId);
        
        
        return "redirect:/deletecourse?semester=" + semester + "&year=" + year;
    }
    

    
    @GetMapping("/viewallstudentstounregister")
    public String viewAllStudentsForCourse(Model model) 
    {
        List<Student> studentList = adminService.viewAllMappedStudents();
        model.addAttribute("studentList", studentList);  
        return "viewallstudentstounregister";
    }

    
   
    @PostMapping("/unregisterStudent")
    public ModelAndView unregisterStudent(@RequestParam("studentId") Long studentId, @RequestParam("courseId") int courseId) 
    {
    	ModelAndView mv=new ModelAndView();
        adminService.unregisterStudentFromCourse(studentId, courseId);
        mv.setViewName("unregistersuccess");
        return mv;
        //return "redirect:/viewallstudentstounregister?courseId=" + courseId;
    }
    

    @GetMapping("/viewallmappedcourses")
    public ModelAndView viewAllMappedCourses() 
    {
        List<Student> studentList = adminService.viewAllMappedStudents();          
        ModelAndView mv = new ModelAndView("viewmappedcourses"); 
        mv.addObject("studentList", studentList);
        return mv;
    }
  
    
    @GetMapping("/updatecourseform")
    public ModelAndView updateCourseForm(@RequestParam("studentId") Long studentId, 
                                         @RequestParam("courseId") int courseId)
    {
        ModelAndView mv = new ModelAndView("updatecourseform");
        Student student = studentService.findStudentById(studentId);
        Course course = courseService.getCourseById(courseId);

        mv.addObject("student", student);
        mv.addObject("course", course);

        return mv;
    }


    @PostMapping("/updatecourse")
    public ModelAndView updateCourse(@RequestParam("studentId") Long studentId,
                               @RequestParam("courseCode") String courseCode,
                               @RequestParam("section") String section,
                               @RequestParam("year") String year,
                               @RequestParam("semester") String semester) 
    {
    	ModelAndView mv=new ModelAndView();
        Course course = adminService.findCourseByStudentIdAndCourseCode(studentId, courseCode);
        if (course != null) {
            course.setSection(section);
            course.setYear(year);
            course.setSemester(semester);
            adminService.updateCourse(course);
        }
        mv.setViewName("courseupdatedsuccessfully");
        return mv;
 
    }

    

    
    
    
    
    
    
    
    @GetMapping("viewallleaves")
    public ModelAndView viewAllLeaves() 
    {
        List<Leave> leaveList = adminService.viewAllLeaves();  
        ModelAndView mv = new ModelAndView("viewallleaves");
        mv.addObject("leaveList", leaveList); 
        return mv;
    }


    
    @GetMapping("updateleavestatus")
    public String updateLeaveStatus(@RequestParam("leaveId") Long leaveId, 
                                    @RequestParam("status") String status) 
    {
    
        adminService.updateLeaveStatus(leaveId, status);
        return "redirect:/viewallleaves"; 
    }
    
    @GetMapping("adminlogout")
    public String logout(HttpServletRequest request) 
    {
        HttpSession session = request.getSession(false);
        if (session != null) 
        {
            session.invalidate();
        }
        return "redirect:/adminlogin";
    }
    
    @GetMapping("sessionexpiry")
    public ModelAndView sessionexpiry()
    {
    	ModelAndView mv=new ModelAndView("sessionexpiry");
    	return mv;
    }
    @GetMapping("uploadExamForm")
    public String showUploadExamForm(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        
        // Filter unique courses by course code
        List<Course> allCourses = courseService.getAllCourses();
        Set<String> courseCodes = new HashSet<>();
        List<Course> uniqueCourses = allCourses.stream()
                .filter(course -> courseCodes.add(course.getCoursecode()))
                .collect(Collectors.toList());
        model.addAttribute("courses", uniqueCourses);

        model.addAttribute("faculties", facultyService.getAllFaculties());
        return "uploadExamForm";
    }


    @PostMapping("uploadExamPDF")
    public String uploadExamPDF(
            @RequestParam("studentId") Long studentId,
            @RequestParam("courseId") int courseId,
            @RequestParam("facultyId") Long facultyId,
            @RequestParam("pdfFile") MultipartFile pdfFile,
            @RequestParam("year") String year,
            @RequestParam("semester") String semester,
            Model model) throws IOException 
    {

        
        if (adminService.isExamPDFAlreadyUploaded(studentId, courseId, facultyId, year, semester))
        {
            model.addAttribute("error", "Exam PDF  already  uploaded.");
            return "uploadExamForm";  
        }

        Student student = studentService.findStudentById(studentId);
        Course course = courseService.getCourseById(courseId);
        Faculty faculty = facultyService.findById(facultyId);

        byte[] pdfData = pdfFile.getBytes();
        String pdfFileName = pdfFile.getOriginalFilename();

       
        adminService.uploadExamPDF(student, course, faculty, pdfData, pdfFileName, year, semester);
        return "redirect:/examuploadSuccess";
    }

    @GetMapping("examuploadSuccess")
    public String examuploadSuccess()
    {
    	return "examuploadsuccess";
    }
    
    @GetMapping("selectyearandsemesterexamadmin")
    public String selectyearandsemesterexamadmin(Model model) 
    {
    
        return "selectyearandsemesterexamadmin";
    }

    
    

    @GetMapping("/viewallexamspdfs")
    public String viewAllExams(@RequestParam("year") String year,
                                @RequestParam("semester") String semester,
                                Model model) 
    {
      
        List<Exam> exams = adminService.getExamsByYearAndSemester(year, semester);

        
        model.addAttribute("elist", exams);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        return "viewallexamspdf";
    }
   

  
    @GetMapping("showfeedbackform")
    public String showfeedbackform(Model model ) 
    {
        
       
       
        return "showfeedbackform";
    }
    
    
    @PostMapping("addfeedbackform")
    public String addFeedback(
           
            @RequestParam String year,
            @RequestParam String semester,
            @RequestParam String question1,
            @RequestParam String question2,
            @RequestParam String question3,
            @RequestParam String question4,
            @RequestParam String question5,
            Model model) {

     

        Feedback feedback = new Feedback();
        feedback.setYear(year);
        feedback.setSemester(semester);
        feedback.setQuestion1(question1);
        feedback.setQuestion2(question2);
        feedback.setQuestion3(question3);
        feedback.setQuestion4(question4);
        feedback.setQuestion5(question5);
         

        adminService.saveFeedback(feedback);

        model.addAttribute("message", "Feedback questions added successfully!");
        return "showfeedbackform";
    }
   
    @GetMapping("/viewallfeedbackresponses")
    public String viewallfeedbackresponses(Model model) 
    {
        // Fetch all feedback responses
        List<StudentFeedbackResponse> feedbackResponses = adminService.getAllFeedbackResponses();

        // Add feedback responses to model
        model.addAttribute("feedbackResponses", feedbackResponses);

        return "viewallfeedbackresponses"; // Return the JSP page
    }

    
}

