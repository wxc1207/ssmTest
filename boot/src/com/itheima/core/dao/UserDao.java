package com.itheima.core.dao;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.User;

/**
 * �û�DAO��ӿ�
 * @author wxc
 *
 */
public interface UserDao {
	//ͨ���˺ź������ѯ�û�
	public User findUser(@Param("usercode") String usercode,@Param("password") String password);
	
}