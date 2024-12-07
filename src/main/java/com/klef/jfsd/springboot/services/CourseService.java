package com.klef.jfsd.springboot.services;

import java.util.List;

import com.klef.jfsd.springboot.Models.Course;

public interface CourseService 
{
	public List<Course> getCoursesByFacultyId(int courseId);
	public boolean isCourseAlreadyMappedToFaculty(Long facultyId, String courseName, String section);
	
	public List<Course> getCoursesByFacultyIdAndYearAndSemester(Long facultyId, String academicYear, String semester);
	public  List<Course> getAllCourses();
	
	
	
   public  Course getCourseById(int courseId);
   
public List<Course> findCoursesBySemester(String year, String semester);
public void updateCourse(Course course);


}
