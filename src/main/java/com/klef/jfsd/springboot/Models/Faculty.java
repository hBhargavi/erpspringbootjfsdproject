package com.klef.jfsd.springboot.Models;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "faculty_table")
public class Faculty
{

    @Id
    @Column(name = "faculty_id", nullable = false)
    private Long id;

    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;

    @Column(name = "middle_name", length = 50)
    private String middleName;

    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;

    @Column(name = "gender", nullable = false, length = 10)
    private String gender;

    @Column(name = "father_name", nullable = false, length = 100)
    private String fatherName;

    @Column(name = "mother_name", nullable = false, length = 100)
    private String motherName;

    @Temporal(TemporalType.DATE)
    @Column(name = "dob", nullable = false)
    private Date dob;

    @Column(name = "blood_group", length = 5)
    private String bloodGroup;

    @Column(name = "marital_status", nullable = false, length = 10)
    private String maritalStatus;

    @Column(name = "mother_tongue", length = 50)
    private String motherTongue;

    @Column(name = "cast_category", length = 50)
    private String castCategory;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "phone_number", nullable = false, unique = true, length = 15)
    private String phoneNumber;

    @Column(name = "identification", length = 12)
    private String identification;

    @Column(name = "religion", length = 50)
    private String religion;

    @Column(name = "nationality", length = 50)
    private String nationality;

    @Temporal(TemporalType.DATE)
    @Column(name = "joining_date", nullable = false)
    private Date joiningDate;

    @Column(name = "designation", nullable = false, length = 100)
    private String designation;

    @Column(name = "department", nullable = false, length = 100)
    private String department;
    
    @Column(name="coursestaught",nullable = false,length = 100)
    private String coursestaught;

    @Column(name = "recruit_agency", length = 100)
    private String recruitAgency;

    @Column(name = "pf_number", length = 50)
    private String pfNumber;

    @Column(name = "recruitment_type", length = 50)
    private String recruitmentType;

    @Column(name = "resume_link", length = 255)
    private String resumeLink;

    @Column(name = "approval_status", length = 50)
    private String approvalStatus;

    @Column(name = "disability", length = 50)
    private String disability;

    @Column(name = "place_of_birth", length = 100)
    private String placeOfBirth;

    @Column(name = "height")
    private Double height;

    @Column(name = "weight")
    private Double weight;

    @Column(name = "experience", length = 100)
    private String experience;

    @Column(name = "address", nullable = false, length = 250)
    private String address;

    @Column(name = "city", nullable = false, length = 50)
    private String city;

    @Column(name = "state", nullable = false, length = 50)
    private String state;

    @Column(name = "country", nullable = false, length = 50)
    private String country;

    @Column(name = "postal_code", nullable = false, length = 6)
    private String postalCode;

    @Column(name = "password", nullable = false, length = 8)
    private String password;

    
    @Column(name="faculty_profile",nullable = false)
    private Blob facultyprofile;
    
    
    public Blob getfacultyprofile()
    {
		return facultyprofile;
	}

	public void setfacultyprofile(Blob facultyprofile) {
		this.facultyprofile = facultyprofile;
	}

	@OneToMany(mappedBy = "faculty", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<Course> courses;
    

    @OneToMany(mappedBy = "faculty", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Leave> leaves;
    
    
    
    
    
    
    
    @OneToMany(mappedBy = "faculty")
    private List<Timetable> timetables; 
    

    public List<Timetable> getTimetables() {
		return timetables;
	}

	public void setTimetables(List<Timetable> timetables) {
		this.timetables = timetables;
	}

	// Getter and Setter for leaves
    public List<Leave> getLeaves() {
        return leaves;
    }

    public void setLeaves(List<Leave> leaves) {
        this.leaves = leaves;
    }

    
    
    
   

    public Faculty(Long facultyId) {
		// TODO Auto-generated constructor stub
	}

	public Faculty() {
		// TODO Auto-generated constructor stub
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

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
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

    public String getCastCategory() {
        return castCategory;
    }

    public void setCastCategory(String castCategory) {
        this.castCategory = castCategory;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
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

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRecruitAgency() {
        return recruitAgency;
    }

    public void setRecruitAgency(String recruitAgency) {
        this.recruitAgency = recruitAgency;
    }

    public String getPfNumber() {
        return pfNumber;
    }

    public void setPfNumber(String pfNumber) {
        this.pfNumber = pfNumber;
    }

    public String getRecruitmentType() {
        return recruitmentType;
    }

    public void setRecruitmentType(String recruitmentType) {
        this.recruitmentType = recruitmentType;
    }

    public String getResumeLink() {
        return resumeLink;
    }

    public void setResumeLink(String resumeLink) {
        this.resumeLink = resumeLink;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
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

    public Double getHeight() {
        return height;
    }

    public void setHeight(double i) {
        this.height = i;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(double i) {
        this.weight = i;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getCoursestaught() {
		return coursestaught;
	}

	public void setCoursestaught(String coursestaught) {
		this.coursestaught = coursestaught;
	}

	  public List<Course> getCourses() {
	        return courses;
	    }

	    public void setCourses(List<Course> courses) {
	        this.courses = courses;
	    }

		@Override
		public String toString() {
			return "Faculty [id=" + id + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName="
					+ lastName + ", gender=" + gender + ", fatherName=" + fatherName + ", motherName=" + motherName
					+ ", dob=" + dob + ", bloodGroup=" + bloodGroup + ", maritalStatus=" + maritalStatus
					+ ", motherTongue=" + motherTongue + ", castCategory=" + castCategory + ", email=" + email
					+ ", phoneNumber=" + phoneNumber + ", identification=" + identification + ", religion=" + religion
					+ ", nationality=" + nationality + ", joiningDate=" + joiningDate + ", designation=" + designation
					+ ", department=" + department + ", coursestaught=" + coursestaught + ", recruitAgency="
					+ recruitAgency + ", pfNumber=" + pfNumber + ", recruitmentType=" + recruitmentType
					+ ", resumeLink=" + resumeLink + ", approvalStatus=" + approvalStatus + ", disability=" + disability
					+ ", placeOfBirth=" + placeOfBirth + ", height=" + height + ", weight=" + weight + ", experience="
					+ experience + ", address=" + address + ", city=" + city + ", state=" + state + ", country="
					+ country + ", postalCode=" + postalCode + ", password=" + password + ", courses=" + courses + "]";
		}

	
	
}
