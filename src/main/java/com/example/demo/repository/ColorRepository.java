package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Color;

public interface ColorRepository extends JpaRepository<Color, Integer> {
}
