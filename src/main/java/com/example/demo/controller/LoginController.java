package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.common.enums.RequestParameterEnum;
import com.example.demo.entity.Users;
import com.example.demo.exception.InvalidRequestParameterException;
import com.example.demo.listener.ListenerEvent;
import com.example.demo.model.LoginInput;
import com.example.demo.model.RegistrationConfirm;
import com.example.demo.service.UsersService;

@CrossOrigin(value = "*")
@RestController
@RequestMapping("/api/auth")
public class LoginController {
	@Autowired
	private UsersService usersService;

	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody LoginInput data) throws InvalidRequestParameterException {
		return ResponseEntity.ok(usersService.login(data.getEmail(), data.getPassword()));
	}

	@Autowired
	ListenerEvent listenerEvent;

	@PostMapping("/registration")
	public ResponseEntity<?> registration(@RequestBody Users user) throws InvalidRequestParameterException {
		Optional<Users> users = usersService.findByEmail(user.getEmail());
		if (users.isPresent()) {
			if (users.get().isActive()) {
				throw new InvalidRequestParameterException("Users", RequestParameterEnum.EXISTS);
			}
			// If users exists -> Update new Token
			users.get().setToken(usersService.registration(user));
			if (usersService.update(users.get()) == 1) {
				listenerEvent.checkTokenEvent(user.getEmail()); // Start countdown 5 Minute remove token
				return ResponseEntity.ok("Successful registration, please check your email to verify !");
			}
		}
		// If users not exists -> Create New Token and users
		else {
			user.setToken(usersService.registration(user));
			if (usersService.save(user) == 1) {
				listenerEvent.checkTokenEvent(user.getEmail()); // Start countdown 5 Minute remove token
				return ResponseEntity.ok("Successful registration, please check your email to verify !");
			}
		}
		return ResponseEntity.ok("Registration failed, please check and try again!");
	}

	@PostMapping("/registrationConfirm")
	public ResponseEntity<?> registrationConfirm(@RequestBody RegistrationConfirm registerConfirm)
			throws InvalidRequestParameterException {
		return ResponseEntity
				.ok(usersService.registrationConfirm(registerConfirm.getEmail(), registerConfirm.getCode()));
	}
}
