package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {

	@GetMapping("/usr/home/main")
//	@ResponseBody
	public String showMain() {
		return "usr/home/main";
	}

	@GetMapping("/")
	public String showMain2() {
		return "main";
	}
}