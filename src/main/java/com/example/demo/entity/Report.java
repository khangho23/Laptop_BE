package com.example.demo.entity;

import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Report {
    private int productId;
    private String productName;
    private String productLogo;
    private Long totalQuantity;
    private Double totalPrice;
}
