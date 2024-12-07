package com.klef.jfsd.springboot.repository;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.Models.OtpVerification;


@Repository
public interface otpVerificationRepository extends JpaRepository<OtpVerification, Integer>
{
    OtpVerification findByEmailAndOtp(String email, String otp); // Optional: For validation purposes

	public String  deleteAllByCreatedAtBefore(LocalDateTime expirationTime) ;
}
