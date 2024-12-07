package com.klef.jfsd.springboot.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
@Service
public class CourseServiceImpl implements CourseService
{
@Autowired
	private CourseRepository courseRepository;
@Autowired
private FacultyRepository facultyRepository;
@Autowired

private StudentRepository studentRepository;
	@Override
	 public List<Course> getCoursesByFacultyId(int Id) 
	{
        return courseRepository.findByFacultyId((long) Id);
    }
	
	public boolean isCourseAlreadyMappedToFaculty(Long facultyId, String coursecode, String section) {
	    return courseRepository.existsByCoursecodeAndFacultyIdAndSection(coursecode, facultyId, section);
	}


	public List<Course> getCoursesByFacultyIdAndYearAndSemester(Long facultyId, String academicYear, String semester)
	{
	    System.out.println("Faculty ID: " + facultyId);
	    System.out.println("Academic Year: " + academicYear);
	    System.out.println("Semester: " + semester);
	    return courseRepository.findByFacultyIdAndYearAndSemester(facultyId, academicYear, semester);
	}

	 public List<Course> getAllCourses() 
	 {
	        return courseRepository.findAll();
	    }
	@Override
	  public Course getCourseById(int courseId)
	{
       
        return courseRepository.findById(courseId).orElse(null);  // Returns null if course not found
    }

	 public List<Course> findCoursesBySemester(String year, String semester)
	 {
	        return courseRepository.findByYearAndSemester(year, semester);
	    }

	@Override
	public void updateCourse(Course course) 
	{
	courseRepository.save(course);
		
	}

	
	

		/*
		 * public List<Course> getCoursesByStudentIdAndYearAndSemester(Long studentId,
		 * String academicYear, String semester) { // Replace with your actual query
		 * logic return
		 * courseRepository.findCoursesByStudentIdAndYearAndSemester(studentId,
		 * academicYear, semester); }
		 */
	 
	 
	 
	 
}
