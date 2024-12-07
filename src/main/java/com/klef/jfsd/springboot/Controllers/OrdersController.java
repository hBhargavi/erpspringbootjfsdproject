package com.klef.jfsd.springboot.Controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.klef.jfsd.springboot.Models.Orders;
import com.klef.jfsd.springboot.services.OrderService;
import com.razorpay.RazorpayException;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrdersController
{
	
	@Autowired
	private OrderService orderService;

	@GetMapping("orders")
	public String ordersPage()
	{
		return "orders";
	}
	
	@PostMapping(value = "createOrder", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Orders> createOrder(@RequestBody Orders orders) throws RazorpayException
	{
		Orders razorpayOrder = orderService.createOrder(orders);
		return new ResponseEntity<>(razorpayOrder,HttpStatus.CREATED);
	}
	
	@PostMapping("paymentCallback")
	public String paymentCallback(@RequestParam Map<String, String> response)
	{
		 	orderService.updateStatus(response);
		 	return "success";
		
	}
	@GetMapping("viewallorders")
	public String viewAllOrders(Map<String, Object> model) 
	{
	    List<Orders> ordersList = orderService.getAllOrders();
	    model.put("ordersList", ordersList);
	    return "viewallorders";
	}
	  @GetMapping("viewstudentorders")
	    public String viewStudentOrders(HttpSession session, Model model) 
	  {
	      
	        Long studentId = (Long) session.getAttribute("studentId");

	      
	        if (studentId == null) 
	        {
	            return "redirect:/studentlogin"; 
	        }

	       
	        List<Orders> studentOrders = orderService.getPaymentsByStudentId(studentId);

	        model.addAttribute("studentOrders", studentOrders);
	        return "viewstudentorders"; 
	    }

}