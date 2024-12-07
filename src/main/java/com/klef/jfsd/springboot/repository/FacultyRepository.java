package com.klef.jfsd.springboot.repository;

import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;

import jakarta.transaction.Transactional;


@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Long>
{

   
    @Query("select f from Faculty f where f.email = ?1 and f.password = ?2")
    public Faculty checkfacultylogin(String email, String password);

    
    @Modifying 
    @Transactional 
    @Query("update Faculty f set f.approvalStatus = ?1 where f.email = ?2")
    public int updateempstatus(String status, String femail);
    
    
   public  Faculty findByEmail(String email);

  public Optional<Faculty> findById(Long facultyId);


  @Query("SELECT c FROM Course c JOIN c.faculty f WHERE f.id = :facultyId")
  Set<Course> findCoursesByFacultyId(Long facultyId);
  
  
  
  
  

}
