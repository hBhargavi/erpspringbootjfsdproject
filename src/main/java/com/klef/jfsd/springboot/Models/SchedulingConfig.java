package com.klef.jfsd.springboot.Models;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.springboot.repository.otpVerificationRepository;

@Configuration
@EnableScheduling
public class SchedulingConfig {

    @Autowired
    private otpVerificationRepository otpverificationRepository;

    @Scheduled(fixedRate = 20000) // Runs every 60 seconds
    @Transactional // Ensures the method runs in a transactional context
    public void cleanupExpiredOtps() {
        LocalDateTime expirationTime = LocalDateTime.now().minusMinutes(2); 
        otpverificationRepository.deleteAllByCreatedAtBefore(expirationTime);
    }
}
