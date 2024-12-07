package com.klef.jfsd.springboot.services;

import java.time.LocalDate;
import java.util.List;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;

public interface AttendanceService 
{
	
	public void saveAttendance(Attendance attendance);
	public    List<Attendance> getAttendanceByFaculty(Long facultyId, String year, String semester);
	
	
	 
	 public List<Attendance> getAttendanceByStudentIdAndYearAndSemester(Long studentId, String year, String semester);
	 
	    public List<Attendance> getAllAttendanceRecords();

	    
	    
	    public Attendance findAttendanceForStudent(Faculty faculty, Course course, Student student, String year, String semester, LocalDate date) ;

}
