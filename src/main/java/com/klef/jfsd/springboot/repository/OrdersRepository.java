package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.Models.Orders;
import com.razorpay.Payment;

public interface OrdersRepository extends JpaRepository<Orders, Integer>
{

		public Orders findByRazorpayOrderId(String razorpayId);
		
	    public List<Orders> findByStudentId(Long studentId);

	}

