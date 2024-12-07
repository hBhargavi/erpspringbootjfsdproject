package com.klef.jfsd.springboot.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.springboot.Models.Feedback;
import com.klef.jfsd.springboot.Models.StudentFeedbackResponse;

public interface FeedbackRepository extends JpaRepository<Feedback, Long>
{
	@Query("SELECT f FROM Feedback f WHERE f.year = :year AND f.semester = :semester")
	Feedback findFeedbackByYearAndSemester(@Param("year") String year, @Param("semester") String semester);

	
}
