package com.project.WYW.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignUpController {

	@GetMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	@GetMapping("/signUp_complete")
	public String signUp_complete() {
		return "signUp_complete";
	}
	//	임시매핑

}
