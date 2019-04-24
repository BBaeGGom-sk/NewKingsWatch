package kr.co.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.service.UserService;

/*
 * @RestController
 * 
 * @RequestMapping(value="/user") public class UserRestController {
 * 
 * @Inject private UserService service;
 * 
 * @RequestMapping(value = "/idCheck", method = RequestMethod.POST) public int
 * idCheck(@RequestBody String userid) throws Exception{
 * System.out.println("아 왜~~~~~~~~~~~~"); int count=0;
 * System.out.println(userid); count = service.idCheck(userid);
 * System.out.println("서비스 실행하고 count값 : " +count); return count; }
 * 
 * }
 */
