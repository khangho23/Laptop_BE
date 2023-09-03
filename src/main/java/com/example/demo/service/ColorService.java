package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Color;
import com.example.demo.exception.InvalidRequestParameterException;
import com.example.demo.repository.ColorRepository;

@Service
public class ColorService implements BaseService<Color, Integer> {
	@Autowired
	ColorRepository colorRepository;

	@Override
	public List<Color> findAll() {
		return colorRepository.findAll();
	}

	@Override
	public Color findById(Integer id) throws InvalidRequestParameterException {
		return null;
	}
}
