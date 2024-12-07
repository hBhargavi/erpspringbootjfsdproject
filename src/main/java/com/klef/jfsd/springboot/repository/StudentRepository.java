package com.klef.jfsd.springboot.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

    @Query("SELECT s FROM Student s WHERE s.id = ?1 AND s.password = ?2")
    public Student checkstudentlogin(Long id, String password);
    
    @Query("SELECT c FROM Student s JOIN s.registeredCourses c WHERE s.id = :studentId AND c.year = :year AND c.semester = :semester")
    public Set<Course> findCoursesByStudentIdYearAndSemester(
        @Param("studentId") Long studentId,
        @Param("year") String academicYear,
        @Param("semester") String semester
    );
    @Query("SELECT s FROM Student s WHERE s.facultyId = :facultyId")
    public Set<Student> findStudentsByFacultyId(@Param("facultyId") Long facultyId);
    
    

    @Query("SELECT s FROM Student s JOIN s.registeredCourses c " +
           "WHERE c.faculty.id = :facultyId AND c.year = :year AND c.semester = :semester")
    public Set<Student> findRegisteredStudentsByFacultyYearAndSemester(
            @Param("facultyId") Long facultyId, 
            @Param("year") String year, 
            @Param("semester") String semester);
    
    
   public List<Student> findByFacultyId(Long facultyId);

public boolean existsByIdAndCourses_CourseIdAndCourses_FacultyAndCourses_SectionAndCourses_YearAndCourses_Semester(
		Long studentId, int courseId, Faculty faculty, String section, String year, String semester);
   
  
@Query("SELECT s FROM Student s JOIN FETCH s.courses c JOIN FETCH c.faculty")
public List<Student> findAllWithMappedCourses();

@Query("SELECT s FROM Student s JOIN s.courses c WHERE c.id = :courseId")
List<Student> findStudentsByCourseId(@Param("courseId") int courseId);


 


   
}
