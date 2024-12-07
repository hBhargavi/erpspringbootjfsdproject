package com.klef.jfsd.springboot.Controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.OtpVerification;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.otpVerificationRepository;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;

@org.springframework.stereotype.Controller
public class Controller 
{
@Autowired
private otpVerificationRepository otpverificationRepository;
@Autowired
private StudentRepository studentRepository;
@Autowired
private FacultyRepository facultyRepository;



@RequestMapping("/")
public String Home()
{
	
	return "index";
}
@RequestMapping("aboutus")
public String About()
{
	return "About";
}
@RequestMapping("contact")
public String Contactus()
{
	return "contactus";
}
@RequestMapping("login")
public String Login()
{
	return "Login";
}
@RequestMapping("adminlogin")
public String AdminLogin()
{
	return "AdminLogin";
}
@RequestMapping("facultylogin")
public String FacultyLogin()
{
	return "FacultyLogin";
}
@RequestMapping("adminhome")
public String adminhome()
{
	return "Adminhome";
}

@RequestMapping("forgotpass")
public String forgot()
{
	return "ForgotPassword";
}
@RequestMapping("welcomeadmin")
public String welcome()
{
	return "AdminWelcome";
}

@RequestMapping("facultylogout")
public String facultylogout()
{
	return "FacultyLogin";
}
@RequestMapping("studenthomes")
public String studenthome()
{
	return "Studenthome";
}
@RequestMapping("studentwelcome")
public String studentwelcome()
{
	return "StudentWelcome";
}
@Autowired
private JavaMailSender mailSender;

@PostMapping("sendemail")
public ModelAndView sendEmail(HttpServletRequest request) throws Exception {
    String name = request.getParameter("name");
    String toemail = request.getParameter("email");
    String subject = request.getParameter("subject");
    String msg = request.getParameter("message");

    MimeMessage mimeMessage = mailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

   
    helper.setTo(toemail);
    helper.setSubject(subject);
    helper.setFrom("tejasri1865@gmail.com");

    String htmlContent =
        "<h3>Contact Form Details</h3>" +
        "<p><strong>Name:</strong> " + name + "</p>" +
        "<p><strong>Email:</strong> " + toemail + "</p>" +
        "<p><strong>Subject:</strong> " + subject + "</p>" +
        "<p><strong>Message:</strong> " + msg + "</p>" ;
        

    helper.setText(htmlContent, true);
    mailSender.send(mimeMessage);

    ModelAndView mv = new ModelAndView("contactus");
    mv.addObject("message", "Email Sent Successfully");
    return mv;
}




@PostMapping("sendotp")
public ModelAndView sendotp(HttpServletRequest request) throws Exception {
    String id = request.getParameter("Id");
    String toemail = request.getParameter("email");
    
    // Generate OTP
    int otp = (int) (Math.random() * 99999);
    
    // Prepare email content
    MimeMessage mimeMessage = mailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
    helper.setTo(toemail);
    helper.setFrom("tejasri1865@gmail.com");
    String htmlContent = "<h3>Password Reset Form Details</h3>" +
            "<p><strong>Id:</strong> " + id + "</p>" +
            "<p><strong>Email:</strong> " + toemail + "</p>" +
            "<p><strong>OTP:</strong> " + otp + "</p>";
    helper.setText(htmlContent, true);
    mailSender.send(mimeMessage);

    // Save OTP and details to the database
    OtpVerification otpVerification = new OtpVerification();
    otpVerification.setIds(Long.parseLong(id));
    otpVerification.setEmail(toemail);
    otpVerification.setOtp(String.valueOf(otp));
    otpverificationRepository.save(otpVerification);

    // Return ModelAndView
    
    ModelAndView mv = new ModelAndView("verifyotp");
    mv.addObject("message", "Email Sent Successfully to " + toemail);
    return mv;
}
@PostMapping("verifyotp")
public ModelAndView verifyOtp(HttpServletRequest request)
{
    String email = request.getParameter("email");
    String otp = request.getParameter("otp");

    
    OtpVerification otpVerification = otpverificationRepository.findByEmailAndOtp(email, otp);

    if (otpVerification != null) 
    {
       
        ModelAndView mv = new ModelAndView("updatepasswordotp");
        mv.addObject("id", otpVerification.getIds());
        mv.addObject("email", otpVerification.getEmail());
        mv.addObject("message", "OTP Verified Successfully! Update your password.");
        return mv;
    } 
    else
    {
    
        ModelAndView mv = new ModelAndView("verifyotp");
        mv.addObject("error", "Invalid OTP or Email");
        return mv;
    }
}

@Scheduled(fixedRate = 600000)
public void cleanupExpiredOtps() 
{
    LocalDateTime expirationTime = LocalDateTime.now().minusMinutes(10); 
    otpverificationRepository.deleteAllByCreatedAtBefore(expirationTime);
}

@PostMapping("updatepasswordotp")
public ModelAndView updatepasswordotp(HttpServletRequest request) {
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String newPassword = request.getParameter("newpassword");
    String confirmPassword = request.getParameter("confirmpassword");

    if (!newPassword.equals(confirmPassword)) {
        ModelAndView mv = new ModelAndView("updatepassword");
        mv.addObject("id", id);
        mv.addObject("email", email);
        mv.addObject("error", "Passwords do not match!");
        return mv;
    }

    boolean isUpdated = false;

    try {
        Long parsedId = Long.parseLong(id);

        
        if (facultyRepository.existsById(parsedId)) 
        {
            Faculty faculty = facultyRepository.findById(parsedId).get();

            
            if (faculty.getEmail().equals(email)) 
            {
                faculty.setPassword(newPassword);
                facultyRepository.save(faculty);
                isUpdated = true;
            }
        }
        
        else if (studentRepository.existsById(parsedId)) 
        {
            Student student = studentRepository.findById(parsedId).get();

            
            if (student.getPersonalEmail().equals(email)) 
            {
                student.setPassword(newPassword);
                studentRepository.save(student);
                isUpdated = true;
            }
        }
    } 
    catch (NumberFormatException e)
    {
      
        ModelAndView mv = new ModelAndView("updatepasswordotp");
        mv.addObject("id", id);
        mv.addObject("email", email);
        mv.addObject("error", "Invalid ID format!");
        return mv;
    }

    if (isUpdated)
    {
        ModelAndView mv = new ModelAndView("Login");
        mv.addObject("message", "Password updated successfully!");
        return mv;
    }
    else
    {
        ModelAndView mv = new ModelAndView("ForgotPassword");
        mv.addObject("id", id);
        mv.addObject("email", email);
        mv.addObject("error", "Failed to update password. Either the ID and email do not match, or the user does not exist.");
        return mv;
    }
}


}
