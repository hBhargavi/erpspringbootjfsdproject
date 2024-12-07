package com.klef.jfsd.springboot.services;

import java.util.List;
import java.util.Set;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.Models.Timetable;

public interface TimetableService 
{
	 	public String saveTimetable(Timetable timetable);
	 	public List<Timetable> getTimetablesByFaculty(Long facultyId);
	 	public List<Timetable> getTimetablesByCourse(int courseId);
	 	public List<Timetable> getTimetablesByFacultyAndDay(Long facultyId, String dayOfWeek);
		public List<Timetable> getAllTimetables();
		public List<Timetable> findByFaculty(Faculty faculty);
		public List<Timetable> getTimetablesByYearAndSemester(String year, String semester);
		
		public List<Timetable> findByFacultyYearAndSemester(Faculty faculty, String year, String semester);
		
		
		public List<Timetable> findByStudentCoursesAndSemester(Set<Course> courses, String year, String semester);
		
		public boolean existsByAttributes(Long facultyId, int courseId, String daysOfWeek, Integer period, String year,
				String semester, String section);
}
