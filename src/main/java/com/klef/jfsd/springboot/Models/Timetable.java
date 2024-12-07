package com.klef.jfsd.springboot.Models;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Timetable 
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;  
    
    @ManyToOne
    @JoinColumn(name = "faculty_id", nullable = false)
    private Faculty faculty; 
    
    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course; 
    
    
    @Column(name = "day_of_week", nullable = false)
    private String dayOfWeek;  
    
    @Column(name = "period", nullable = false)
    private int period;  
    
    
    @Column(name = "year", nullable = false)
    private String year;  

    @Column(name = "semester", nullable = false)
    private String semester;  
    
    @Column(name="section",nullable=false)
    private String section;

    

    public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getYear() 
    {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    @Override
    public String toString() {
        return "Timetable [id=" + id + ", faculty=" + faculty + ", course=" + course + ", dayOfWeek=" + dayOfWeek
                + ", period=" + period + "]";
    }
}

