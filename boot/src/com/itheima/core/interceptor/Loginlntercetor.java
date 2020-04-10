package com.itheima.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.core.po.User;

public class Loginlntercetor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {
		//��ȡ�����URL
		String url = request.getRequestURI();
		//URL������¼�����⣬������URL���������ؿ���
		if (url.indexOf("/login.action") >= 0) {
			return true;
		}
		
		//��ȡsession
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION");
		
		//�ж�session���Ƿ����û����ݣ�����У�����true����������ִ��
		if (user != null) {
			return true;
		}
		
		//�����������ĸ�����Ϣ����ת������¼����
		request.setAttribute("msg", "�㻹û�е�¼�������ȵ�¼");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
	}
	

}
