package com.klef.jfsd.springboot.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;

import jakarta.transaction.Transactional;

public interface AttendanceRepository extends JpaRepository<Attendance, Long> {

    public List<Attendance> findByFacultyIdAndDate(Long facultyId, LocalDate date);

    public List<Attendance> findByFacultyIdAndAcademicYearAndSemester(Long facultyId, String year, String semester);

    public List<Attendance> findByStudentIdAndAcademicYearAndSemester(Long studentId, String year, String semester);

    @Query("SELECT a FROM Attendance a WHERE a.course IN :courses AND a.academicYear = :year AND a.semester = :semester")
    public List<Attendance> findAttendanceByCoursesAndYearAndSemester(@Param("courses") Set<Course> courses,
                                                                       @Param("year") String year,
                                                                       @Param("semester") String semester);
    @Query("SELECT a FROM Attendance a JOIN a.course c WHERE c.id = :courseId AND a.academicYear = :year AND a.semester = :semester")
    public List<Attendance> findAttendanceByCoursesIdAndYearAndSemester(@Param("courseId") int courseId,
                                                                          @Param("year") String year,
                                                                          @Param("semester") String semester);

    
    @Modifying
    @Transactional
    @Query("DELETE FROM Attendance a WHERE a.course.id = :courseId")
   public  void deleteByCourseId(@Param("courseId") int courseId);
 
   public Attendance findByFacultyAndCourseAndStudentAndAcademicYearAndSemesterAndDate(Faculty faculty, Course course, Student student, String academicYear, String semester, LocalDate date);
   
   
   public List<Attendance> findByStudentAndCourse(Student student, Course course);

}
