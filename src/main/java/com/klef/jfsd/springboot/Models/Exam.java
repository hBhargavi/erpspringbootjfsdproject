package com.klef.jfsd.springboot.Models;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "exam_table")
public class Exam 
{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

@ManyToOne(optional = true)
@JoinColumn(name = "student_id", nullable = true)
@OnDelete(action = OnDeleteAction.CASCADE) 
private Student student;

@ManyToOne(optional = true)
@JoinColumn(name = "course_id", nullable = true)
@OnDelete(action = OnDeleteAction.CASCADE)  
private Course course;

	    
@ManyToOne(optional = true)
@JoinColumn(name = "faculty_id", nullable = true)
@OnDelete(action = OnDeleteAction.SET_NULL)
private Faculty faculty;

@Lob
@Column(name = "pdf_file", columnDefinition = "LONGBLOB", nullable = false)
private byte[] pdfFile;


@Column(name = "pdf_file_name", nullable = false)
private String pdfFileName;

@Column(name = "status", nullable = false)
private String status = "Not Graded";

@Column(name = "grade")
private String grade;

@Column(name = "year", nullable = false)
private String year;

@Column(name = "semester", nullable = false)
private String semester;

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

	public byte[] getPdfFile() {
		return pdfFile;
	}

	public void setPdfFile(byte[] pdfFile) {
		this.pdfFile = pdfFile;
	}

	public String getPdfFileName() {
		return pdfFileName;
	}

	public void setPdfFileName(String pdfFileName) {
		this.pdfFileName = pdfFileName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

   
}
