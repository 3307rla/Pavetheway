package com.pavetheway.myapp.users.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.users.dto.UsersDto;

public interface UsersService {
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UsersDto dto);
	public void loginProcess(UsersDto dto, HttpSession session);
	public void getInfo(HttpSession session, ModelAndView mView);
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView);
	public void updateUser(UsersDto dto, HttpSession session);
	public void deleteUser(HttpSession session, ModelAndView mView);
}
