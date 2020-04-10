package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.Customer;

public interface CustomerDao {

	//客户列表
	public List<Customer> selectCustomerList(Customer customer);
	//客户数
	public Integer selectCustomerListCount(Customer customer);
	
	//按条件查询
	public List<String> selectCustomerBySource();
	public List<String> selectCustomerByLevel();
	public List<String> selectCustomerByIndustry();
	
	
   //创建客户
	public int createCustomer(Customer customer);
	//根据ID获得对象
	public Customer getCustomerById(int id);
	//更新客户
	public int updateCustomer(Customer customer);
	//删除客户
	public int deleteCustomer(int id);
	
	//测试
	public List<Customer> selectAll();
	
	
}
