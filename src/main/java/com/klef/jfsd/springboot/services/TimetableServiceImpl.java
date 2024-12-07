package com.klef.jfsd.springboot.services;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Course;
import com.klef.jfsd.springboot.Models.Faculty;
import com.klef.jfsd.springboot.Models.Timetable;
import com.klef.jfsd.springboot.repository.TimetableRepository;

@Service
public class TimetableServiceImpl implements TimetableService {

    @Autowired
    private TimetableRepository timetableRepository;

    @Override
    public String saveTimetable(Timetable timetable) 
    {
         timetableRepository.save(timetable);
         return "TimeTable Added Successfully";
    }

    @Override
    public List<Timetable> getTimetablesByFaculty(Long facultyId) 
    {
        return timetableRepository.findByFaculty_Id(facultyId);
    }

    @Override
    public List<Timetable> getTimetablesByCourse(int courseId) {
        return timetableRepository.findByCourse_CourseId(courseId);
    }

    @Override
    public List<Timetable> getTimetablesByFacultyAndDay(Long facultyId, String dayOfWeek) {
        return timetableRepository.findByFaculty_IdAndDayOfWeek(facultyId, dayOfWeek);
    }

	@Override
	public List<Timetable> getAllTimetables() 
	{
	
		return timetableRepository.findAll();
	}

	  public List<Timetable> findByFaculty(Faculty faculty) 
	  {
	        return timetableRepository.findByFaculty(faculty);  // Fetch timetable for the specific faculty
	    }

	@Override
	public List<Timetable> getTimetablesByYearAndSemester(String year, String semester) 
	{
	
		return timetableRepository.findByYearAndSemester(year, semester);
	}

	// Example of how findByFacultyYearAndSemester might be implemented
	public List<Timetable> findByFacultyYearAndSemester(Faculty faculty, String year, String semester) {
	    return timetableRepository.findByFacultyAndYearAndSemester(faculty, year, semester);
	}

	
	
	public List<Timetable> findByStudentCoursesAndSemester(Set<Course> courses, String year, String semester) {
        return timetableRepository.findTimetableForStudentCourses(courses, year, semester);
    }
	
	@Override
	public boolean existsByAttributes(Long facultyId, int courseId, String daysOfWeek, Integer period, String year,
			String semester, String section)
	{
		 return timetableRepository.existsByFacultyIdAndCourse_CourseIdAndDayOfWeekAndPeriodAndYearAndSemesterAndSection(
			        facultyId, courseId, daysOfWeek, period, year, semester, section
			    );
		
	}


}