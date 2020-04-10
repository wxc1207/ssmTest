package com.itheima.core.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * �û�Service�ӿ�ʵ��
 * @author wxc
 *
 */

import com.itheima.core.dao.UserDao;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	//ע��UserDao
	@Autowired
	private UserDao userDao;

	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}
}
