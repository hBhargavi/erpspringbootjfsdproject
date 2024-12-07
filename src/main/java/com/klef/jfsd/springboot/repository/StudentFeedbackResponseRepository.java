package com.klef.jfsd.springboot.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;

public interface StudentFeedbackResponseRepository extends JpaRepository<StudentFeedbackResponse, Long> 
{

public	boolean existsByFeedbackIdAndStudentId(Long feedbackId, Long studentId);

@Query("SELECT sfr FROM StudentFeedbackResponse sfr WHERE sfr.faculty.id = :facultyId")
public List<StudentFeedbackResponse> findFeedbackResponsesByFacultyId(@Param("facultyId") Long facultyId);

public  List<StudentFeedbackResponse> findByFacultyId(long facultyId);

	
   
}
