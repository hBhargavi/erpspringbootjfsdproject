package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Exam;
import com.klef.jfsd.springboot.Models.Student;
@Repository
public interface ExamRepository extends JpaRepository<Exam, Long>
{
	 public List<Exam> findByFacultyId(Long facultyId);
	 public List<Exam> findExamsByStudentId(Long studentId); 
	 
	 
	 @Query("SELECT e FROM Exam e WHERE e.student.id = :studentId AND e.year = :year AND e.semester = :semester")
	  public  List<Exam> findExamsByStudentIdAndYearAndSemester(
	        @Param("studentId") Long studentId, 
	        @Param("year") String year, 
	        @Param("semester") String semester
	    );

	    
	    @Query("SELECT e FROM Exam e WHERE e.id = :examId AND e.year = :year AND e.semester = :semester")
	   public Exam findExamByIdAndYearAndSemester(
	        @Param("examId") Long examId, 
	        @Param("year") String year, 
	        @Param("semester") String semester
	    );
	    
	    public boolean existsByStudentIdAndCourseCourseIdAndFacultyIdAndYearAndSemester(Long studentId, int courseId, Long facultyId, String year, String semester);
	    
		public List<Exam> findExamByYearAndSemester(String year, String semester);
		
		public List<Exam> findByStudentAndCourse(Student student, Course course);


}
