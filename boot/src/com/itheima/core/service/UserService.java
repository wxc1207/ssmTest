package com.itheima.core.service;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.User;

/**
 * �û�
 * @author wxc
 *
 */
public interface UserService {
	public User findUser(String usercode,String password);

}
