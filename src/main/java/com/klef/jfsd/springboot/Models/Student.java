package com.klef.jfsd.springboot.Models;

import java.sql.Blob;
import java.util.Date;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student {

    @Id
    private Long id;

    @Column(name = "first_name", nullable = false)
    private String firstName;


    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "gender", nullable = false)
    private String gender;

    @Column(name = "father_name", nullable = false)
    private String fatherName;

    @Column(name = "mother_name", nullable = false)
    private String motherName;

    @Column(name = "contactno", nullable = false,unique = true)
    private String contactNo; // Corrected name

    @Column(name = "permanent_address", nullable = false)
    private String permanentAddress;

    @Column(name = "date_of_birth", nullable = false)
    private Date dateOfBirth;

    @Column(name = "blood_group", nullable = false)
    private String bloodGroup;

    @Column(name = "marital_status", nullable = false)
    private String maritalStatus;

    @Column(name = "mother_tongue", nullable = false)
    private String motherTongue;

    @Column(name = "caste_category", nullable = false)
    private String casteCategory;

    @Column(name = "personal_email", nullable = false,unique = true)
    private String personalEmail;

    @Column(name = "identification",unique = true,nullable = false)
    private String identification;

    @Column(name = "disability",nullable = false)
    private String disability;

    @Column(name = "place_of_birth", nullable = false)
    private String placeOfBirth;

    @Column(name = "height", nullable = false)
    private double height;

    @Column(name = "weight", nullable = false)
    private double weight;

    @Column(name = "religion", nullable = false)
    private String religion;

    @Column(name = "nationality", nullable = false)
    private String nationality;

    @Column(name = "admission_date", nullable = false)
    private Date admissionDate;

    @Column(name = "major_degree", nullable = false)
    private String majorDegree;

    @Column(name = "referred_by", nullable = false)
    private String referredBy;

    @Column(name = "program", nullable = false)
    private String program;

    @Column(name = "regulation", nullable = false)
    private String regulation;

    @Column(name = "hostel_status", nullable = false)
    private String hostelStatus;

    @Column(name = "highschool", nullable = false)
    private String highSchool;

    @Column(name = "intermediate", nullable = false)
    private String intermediate;

    @Column(name = "password", nullable = false)
    private String password;
    
    
    @Column(name="student_profile",nullable = false)
    private Blob studentprofile;
    
    
    
    
    public Blob getStudentprofile() {
		return studentprofile;
	}

	public void setStudentprofile(Blob studentprofile) {
		this.studentprofile = studentprofile;
	}

	
	
	
	
	
	@Column(name = "faculty_id") 
    private Long facultyId;


	
	
	
	
	
	
	
	
	
    @ManyToMany
    @JoinTable(
        name = "student_course",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private Set<Course> courses;
   
    public Student(Long studentId) {
		
	}

	public Student() {
		
	}

	
    public Long getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(Long facultyId) {
        this.facultyId = facultyId;
    }

    @ManyToMany
    @JoinTable(
        name = "student_course",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private Set<Course> registeredCourses;
    
   
    public Set<Course> getRegisteredCourses() {
		return registeredCourses;
	}

	public void setRegisteredCourses(Set<Course> registeredCourses) {
		this.registeredCourses = registeredCourses;
	}

	public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getMotherTongue() {
		return motherTongue;
	}

	public void setMotherTongue(String motherTongue) {
		this.motherTongue = motherTongue;
	}

	public String getCasteCategory() {
		return casteCategory;
	}

	public void setCasteCategory(String casteCategory) {
		this.casteCategory = casteCategory;
	}

	public String getPersonalEmail() {
		return personalEmail;
	}

	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public String getDisability() {
		return disability;
	}

	public void setDisability(String disability) {
		this.disability = disability;
	}

	public String getPlaceOfBirth() {
		return placeOfBirth;
	}

	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getMajorDegree() {
		return majorDegree;
	}

	public void setMajorDegree(String majorDegree) {
		this.majorDegree = majorDegree;
	}

	public String getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public String getRegulation() {
		return regulation;
	}

	public void setRegulation(String regulation) {
		this.regulation = regulation;
	}

	public String getHostelStatus() {
		return hostelStatus;
	}

	public void setHostelStatus(String hostelStatus) {
		this.hostelStatus = hostelStatus;
	}

	public String getHighSchool() {
		return highSchool;
	}

	public void setHighSchool(String highSchool) {
		this.highSchool = highSchool;
	}

	public String getIntermediate() {
		return intermediate;
	}

	public void setIntermediate(String intermediate) {
		this.intermediate = intermediate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getAdmissionDate() {
		return admissionDate;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender
				+ ", fatherName=" + fatherName + ", motherName=" + motherName + ", contactNo=" + contactNo
				+ ", permanentAddress=" + permanentAddress + ", dateOfBirth=" + dateOfBirth + ", bloodGroup="
				+ bloodGroup + ", maritalStatus=" + maritalStatus + ", motherTongue=" + motherTongue
				+ ", casteCategory=" + casteCategory + ", personalEmail=" + personalEmail + ", identification="
				+ identification + ", disability=" + disability + ", placeOfBirth=" + placeOfBirth + ", height="
				+ height + ", weight=" + weight + ", religion=" + religion + ", nationality=" + nationality
				+ ", admissionDate=" + admissionDate + ", majorDegree=" + majorDegree + ", referredBy=" + referredBy
				+ ", program=" + program + ", regulation=" + regulation + ", hostelStatus=" + hostelStatus
				+ ", highSchool=" + highSchool + ", intermediate=" + intermediate + ", password=" + password
				+ ", registeredCourses=" + registeredCourses + "]";
	}

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

  
}
