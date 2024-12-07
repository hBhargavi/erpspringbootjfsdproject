package com.klef.jfsd.springboot.services;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.Models.Orders;
import com.klef.jfsd.springboot.repository.OrdersRepository;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.annotation.PostConstruct;

@Service
public class OrderService
{
	
	@Autowired
	private OrdersRepository ordersRepository;
	
	@Value("${razorpay.key.id}")
	private String razorpayId;
	@Value("${razorpay.key.secret}")
	private String razorpaySecret;
	
	private RazorpayClient razorpayCLient;
	
	@PostConstruct
	public void init() throws RazorpayException
	{
		this.razorpayCLient = new RazorpayClient(razorpayId, razorpaySecret);
	}
	
	public Orders createOrder(Orders order) throws RazorpayException 
	{
        JSONObject options = new JSONObject();
        options.put("amount", order.getAmount() * 100);
        options.put("currency", "INR");
        options.put("receipt", order.getEmail());
        Order razorpayOrder = razorpayCLient.orders.create(options);
        if(razorpayOrder != null) 
        {
        order.setRazorpayOrderId(razorpayOrder.get("id"));
        order.setOrderStatus(razorpayOrder.get("status"));
        }
        return ordersRepository.save(order);
    }

	public Orders updateStatus(Map<String, String> map)
	{
    	String razorpayId = map.get("razorpay_order_id");
    	Orders order = ordersRepository.findByRazorpayOrderId(razorpayId);
    	order.setOrderStatus("PAYMENT DONE");
    	Orders orders = ordersRepository.save(order);
    	return orders;
    }
	 public List<Orders> getAllOrders()
	 {
	    return ordersRepository.findAll(); 
	 }
	 public List<Orders> getPaymentsByStudentId(Long studentId)
	 {
	        return ordersRepository.findByStudentId(studentId);
	    }
}
