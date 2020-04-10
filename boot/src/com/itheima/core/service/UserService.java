package com.itheima.core.service;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.User;

/**
 * ”√ªß
 * @author wxc
 *
 */
public interface UserService {
	public User findUser(String usercode,String password);

}
