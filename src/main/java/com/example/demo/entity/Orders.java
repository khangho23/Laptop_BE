package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Entity
@Table
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private Date buyDate = new Date();
	@Column
	private String place;

	@Column
	private int status;

	@Column(name = "customerid")
	private int customerId;

	@OneToMany(mappedBy = "order")
	private List<Order_Detail> order_details;
}