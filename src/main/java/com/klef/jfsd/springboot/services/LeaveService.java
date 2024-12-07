package com.klef.jfsd.springboot.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Leave;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.LeaveRepository;

@Service
public class LeaveService {

    @Autowired
    private LeaveRepository leaveRepository;

    @Autowired
    private FacultyRepository facultyRepository;

    
    public Leave applyLeave(Long facultyId, Leave leave) {
        Faculty faculty = facultyRepository.findById(facultyId).orElseThrow();
        leave.setFaculty(faculty);
        leave.setStatus("Pending");
        return leaveRepository.save(leave);
    }

    
    public List<Leave> getAllLeaves() {
        return leaveRepository.findAll();
    }

    
    public List<Leave> getLeavesByFacultyId(Long facultyId) {
        return leaveRepository.findByFacultyId(facultyId);
    }
}
