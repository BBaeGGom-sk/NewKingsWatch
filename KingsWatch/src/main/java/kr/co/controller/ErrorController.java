package kr.co.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.UserDTO;
import kr.co.service.ErrorService;
import kr.co.service.UserService;

@Controller
@RequestMapping("/error")
public class ErrorController {

	@Inject
	private ErrorService service;

	@RequestMapping("/error")
	public String error() {
		return "redirect:error";	

	}

	
}
