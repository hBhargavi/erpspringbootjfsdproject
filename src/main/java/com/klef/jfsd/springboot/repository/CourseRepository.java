package com.klef.jfsd.springboot.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;


@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>
{
public	List<Course> findByFacultyId(Long facultyId);


public boolean existsByFacultyAndCourseNameAndSection(Faculty faculty, String courseName, String section);

public boolean existsByCoursecodeAndFacultyIdAndSection(String coursecode, Long facultyId, String section);

@Query("SELECT c FROM Course c WHERE c.faculty.id = ?1 AND c.year = ?2 AND c.semester = ?3")

public List<Course> findByFacultyIdAndYearAndSemester(Long facultyId, String academicYear, String semester);



public List<Course> findByFacultyIdAndSemester(Long facultyId, String semester);


@Modifying
@Transactional
@Query(value = "DELETE FROM student_course WHERE course_id = :courseId", nativeQuery = true)
void deleteStudentsFromCourse(@Param("courseId") int courseId);

/*
 * @Query("SELECT c FROM Course c WHERE c.studentId = :studentId AND c.academicYear = :academicYear AND c.semester = :semester"
 * ) public List<Course>
 * findCoursesByStudentIdAndYearAndSemester(@Param("studentId") Long studentId,
 * 
 * @Param("academicYear") String academicYear,
 * 
 * @Param("semester") String semester);
 * 
 * 
 * public List<Course> findByStudentAndYearAndSemester(Student student, String
 * year, String semester);
 */




public List<Course> findByYearAndSemester(String year, String semester);

public Set<Course> findCoursesByStudentId(Long studentId);
public Course findByStudentIdAndCourseId(Long studentId, int courseId);


//updatecourse
@Query("SELECT c FROM Course c WHERE c.student.id = :studentId AND c.coursecode = :courseCode")
public Course findCourseByStudentIdAndCourseCode(@Param("studentId") Long studentId, @Param("courseCode") String courseCode);

}


