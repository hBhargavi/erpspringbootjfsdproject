package com.klef.jfsd.springboot.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Timetable;

import jakarta.transaction.Transactional;

@Repository
public interface TimetableRepository extends JpaRepository<Timetable, Integer>
{

 
    public List<Timetable> findByFaculty_Id(Long facultyId); 

    
    public List<Timetable> findByCourse_CourseId(int courseId);  

    
    public List<Timetable> findByFaculty_IdAndDayOfWeek(Long facultyId, String dayOfWeek);
    
   public  List<Timetable> findByFaculty(Faculty faculty);

   public List<Timetable> findByYearAndSemester(String year, String semester);
   
 
   
   @Query("SELECT t FROM Timetable t WHERE t.faculty = :faculty AND t.year = :year AND t.semester = :semester")
   List<Timetable> findByFacultyAndYearAndSemester(@Param("faculty") Faculty faculty, @Param("year") String year, @Param("semester") String semester);


   
   @Modifying
   @Transactional
  public  void deleteByCourse(Course course);

   
   @Query("SELECT t FROM Timetable t WHERE t.course IN :courses AND t.year = :year AND t.semester = :semester")
   List<Timetable> findTimetableForStudentCourses(@Param("courses") Set<Course> courses, 
                                                  @Param("year") String year, 
                                                  @Param("semester") String semester);
   
   
   
   public boolean existsByFacultyIdAndCourse_CourseIdAndDayOfWeekAndPeriodAndYearAndSemesterAndSection(
		    Long facultyId, int courseId, String daysOfWeek, int period, String year, String semester, String section
		);

}
