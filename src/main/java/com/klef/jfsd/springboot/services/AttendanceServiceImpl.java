package com.klef.jfsd.springboot.services;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Attendance;
import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Student;
import com.klef.jfsd.springboot.repository.AttendanceRepository;

@Service
public class AttendanceServiceImpl implements AttendanceService
{

	@Autowired
    private AttendanceRepository attendanceRepository; // Assuming you're using a Spring Data repository

    public void saveAttendance(Attendance attendance) {
        attendanceRepository.save(attendance); // Make sure this is correctly saving the record
    }

    @Override
    public List<Attendance> getAttendanceByFaculty(Long facultyId, String year, String semester) {
        return attendanceRepository.findByFacultyIdAndAcademicYearAndSemester(facultyId, year, semester);
 }
  
   
    
    public List<Attendance> getAttendanceByStudentIdAndYearAndSemester(Long studentId, String year, String semester) {
        return attendanceRepository.findByStudentIdAndAcademicYearAndSemester(studentId, year, semester);
    }
    
    public List<Attendance> getAllAttendanceRecords() 
    {
        return attendanceRepository.findAll();
    }
    
    
    public Attendance findAttendanceForStudent(Faculty faculty, Course course, Student student, String year, String semester, LocalDate date) {
        return attendanceRepository.findByFacultyAndCourseAndStudentAndAcademicYearAndSemesterAndDate(
                faculty, course, student, year, semester, date);
    }

}
