package com.klef.jfsd.springboot.Models;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "student_feedback_response_table")
public class StudentFeedbackResponse 
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "response_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    @ManyToOne
    @JoinColumn(name = "feedback_id", nullable = false)
    private Feedback feedback;
    
    public String getYear() {
        return feedback != null ? feedback.getYear() : null;
    }

    public String getSemester() {
        return feedback != null ? feedback.getSemester() : null;
    }

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @ManyToOne
    @JoinColumn(name = "faculty_id", nullable = false)  // Make sure this column is not null
    private Faculty faculty;


    @Column(name = "response_1", nullable = true)
    private String response1;

    @Column(name = "response_2", nullable = true)
    private String response2;

    @Column(name = "response_3", nullable = true)
    private String response3;

    @Column(name = "response_4", nullable = true)
    private String response4;

    @Column(name = "response_5", nullable = true)
    private String response5;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "submitted_date", nullable = false)
    private Date submittedDate = new Date();

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public String getResponse1() {
        return response1;
    }

    public void setResponse1(String response1) {
        this.response1 = response1;
    }

    public String getResponse2() {
        return response2;
    }

    public void setResponse2(String response2) {
        this.response2 = response2;
    }

    public String getResponse3() {
        return response3;
    }

    public void setResponse3(String response3) {
        this.response3 = response3;
    }

    public String getResponse4() {
        return response4;
    }

    public void setResponse4(String response4) {
        this.response4 = response4;
    }

    public String getResponse5() {
        return response5;
    }

    public void setResponse5(String response5) {
        this.response5 = response5;
    }

    public Date getSubmittedDate() {
        return submittedDate;
    }

    public void setSubmittedDate(Date submittedDate) {
        this.submittedDate = submittedDate;
    }
    @Override
    public String toString() {
        return "StudentFeedbackResponse{" +
                "student=" + student.getId() + 
                ", course=" + course.getCourseName() +
                ", response1=" + response1 +
                ", response2=" + response2 +
                ", response3=" + response3 +
                ", response4=" + response4 +
                ", response5=" + response5 +
                ", faculty=" + faculty.getFirstName() + " " + faculty.getLastName() +
                '}';
    }

	
}
