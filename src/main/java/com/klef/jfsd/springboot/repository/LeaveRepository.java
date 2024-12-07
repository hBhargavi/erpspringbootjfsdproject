package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Leave;
import java.util.List;

public interface LeaveRepository extends JpaRepository<Leave, Long> 
{
public    List<Leave> findByFacultyId(Long facultyId); 

public	List<Leave> findByFaculty(Faculty faculty);
}