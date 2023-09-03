package com.example.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Report;
import com.example.demo.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<Report> productsSold(Date startDate, Date endDate) {
        return orderDetailRepository.productsSold(startDate, endDate);
    }
}
