package com.klef.jfsd.springboot.Models;

import java.util.List;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "course_table")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int courseId;

    @Column(unique = true, nullable = false)
    private String coursecode;
    
    @Column(nullable = false)
    private String ltps;
    
    @Column(name = "cname", nullable = false)
    private String courseName;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "faculty_id") 
    private Faculty faculty;

    @ManyToMany(mappedBy = "courses")
    private Set<Student> students;
    
    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @Column(name = "credits", nullable = false)
    private int credits;

    @Column(name = "cyear", nullable = false)
    private String year;

    @Column(name = "csem", nullable = false)
    private String semester;

    @Column(name = "section", nullable = false)
    private String section;

    @Column(name = "regulation", nullable = false)
    private String regulation;

    @OneToMany(mappedBy = "course")
    private List<Attendance> attendanceList;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Exam> exams;

    // Getters and Setters
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCoursecode() {
        return coursecode;
    }

    public void setCoursecode(String coursecode) {
        this.coursecode = coursecode;
    }

    public String getLtps() {
        return ltps;
    }

    public void setLtps(String ltps) {
        this.ltps = ltps;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getYear() {
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

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getRegulation() {
        return regulation;
    }

    public void setRegulation(String regulation) {
        this.regulation = regulation;
    }

    @Override
    public String toString() {
        return "Course [courseId=" + courseId + ", courseName=" + courseName + ", faculty=" + faculty + ", credits="
                + credits + ", year=" + year + ", semester=" + semester + ", regulation=" + regulation + "]";
    }
}
