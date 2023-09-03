package com.example.demo.exception;

import org.springframework.http.HttpStatus;

import com.example.demo.common.enums.RequestParameterEnum;
import com.example.demo.model.ErrorResponse;

import lombok.Getter;
import lombok.Setter;

public class InvalidRequestParameterException extends Exception {
	@Getter
	@Setter
	protected ErrorResponse response;

	public InvalidRequestParameterException(String param, RequestParameterEnum type) {
		setResponse(new ErrorResponse(HttpStatus.BAD_REQUEST.value(), param + " is " + type.name()));
	}

}
