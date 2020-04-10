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
 * 用户控制器类
 * @author wxc
 *
 */
@Controller
public class UserController {
	//依赖注入
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
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
		model.addAttribute("msg", "账号密码错误，请重新输入<br/>");
		return "login";
		
	}
	@RequestMapping(value="/toCustomer.action")
	
	public String toCustomer() {
		System.out.println("hello");
		return "customer";
	}
	
	/**
	 * 退出登录
	 * @param session
	 * @return login.action
	 */
	@RequestMapping(value="/logout.action")
	public String logout (HttpSession session) {
		//清除session
		session.invalidate();
		//重定向到登录界面的跳转方法
		return "redirect:login.action";
	}
	
	/**
	 * 向用户登录界面跳转
	 * @return login.jsp
	 */
	@RequestMapping(value="/login.action",method=RequestMethod.GET)
	public String toLogin() {
		System.out.println("start to login.action GET");
		return "login";
	}
	
}
