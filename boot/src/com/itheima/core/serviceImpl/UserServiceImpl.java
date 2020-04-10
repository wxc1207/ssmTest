package com.itheima.core.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 用户Service接口实现
 * @author wxc
 *
 */

import com.itheima.core.dao.UserDao;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	//注入UserDao
	@Autowired
	private UserDao userDao;

	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}
}
