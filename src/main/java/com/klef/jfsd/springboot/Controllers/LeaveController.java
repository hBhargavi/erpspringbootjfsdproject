package com.klef.jfsd.springboot.Controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Leave;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.LeaveRepository;

@Controller
public class LeaveController
{

	
	@Autowired
    private LeaveRepository leaveRepository;

    @Autowired
    private FacultyRepository facultyRepository;
    
    @GetMapping("applyforleave")
    public ModelAndView addleave()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("applyforleave");
    	return mv;
    }
    
   
	  
    
    
    @PostMapping("/applyleave")
    public String applyForLeave(@RequestParam Long facultyId,@RequestParam String reason,@RequestParam String startDate,@RequestParam String endDate,@RequestParam String leaveType, Model model) 
    {
        Optional<Faculty> facultyOpt = facultyRepository.findById(facultyId);
        if (facultyOpt.isPresent()) {
            Faculty faculty = facultyOpt.get();
            Leave leave = new Leave();
            leave.setFaculty(faculty);
            leave.setReason(reason);
            leave.setStartDate(java.sql.Date.valueOf(startDate));
            leave.setEndDate(java.sql.Date.valueOf(endDate));
            leave.setLeaveType(leaveType);
            leave.setStatus("Pending");

            leaveRepository.save(leave);
            
            model.addAttribute("message", "Leave application submitted successfully with status: Pending");
            return "redirect:/leaveConfirmation";  
        } 
        else
        {
            model.addAttribute("error", "Faculty not found");
            return "redirect:/applyleave"; 
        }
    }
    
    @GetMapping("leaveConfirmation")
    public ModelAndView leaveConfirmation()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("leaveConfirmation");
    	return mv;
    }
    @GetMapping("/viewleaves")
    public String viewLeaves(Model model, @SessionAttribute("faculty") Faculty faculty) 
    {
        List<Leave> leaveList = leaveRepository.findByFaculty(faculty);
        model.addAttribute("leaveList", leaveList);
        return "viewleaves"; 
    }


}
