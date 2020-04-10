package com.itheima.core.web.controller;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itheima.core.po.User;
import com.itheima.core.service.UserService;


/**
 * �û���������
 * @author wxc
 *
 */
@Controller
public class UserController {
	//����ע��
	@Autowired
	private UserService userService;
	/**
	 * �û���¼
	 */
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public String login(String usercode,String password,Model model,HttpSession session) {
		System.out.println("start to login.action POST");
		User user = userService.findUser(usercode, password);
		System.out.println(user.toString());
		if (user != null) {
			session.setAttribute("USER_SESSION", user);
			return "redirect:customer/list.action"; 
			//return "customer";
		}
		model.addAttribute("msg", "�˺������������������<br/>");
		return "login";
		
	}
	@RequestMapping(value="/toCustomer.action")
	
	public String toCustomer() {
		System.out.println("hello");
		return "customer";
	}
	
	/**
	 * �˳���¼
	 * @param session
	 * @return login.action
	 */
	@RequestMapping(value="/logout.action")
	public String logout (HttpSession session) {
		//���session
		session.invalidate();
		//�ض��򵽵�¼�������ת����
		return "redirect:login.action";
	}
	
	/**
	 * ���û���¼������ת
	 * @return login.jsp
	 */
	@RequestMapping(value="/login.action",method=RequestMethod.GET)
	public String toLogin() {
		System.out.println("start to login.action GET");
		return "login";
	}
	
}
