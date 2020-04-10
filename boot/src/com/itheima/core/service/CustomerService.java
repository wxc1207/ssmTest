package com.itheima.core.service;

import java.util.List;

import com.itheima.core.po.Customer;

public interface CustomerService {
	//查询客户列表
	public List<Customer> findCustomerList(String custName,String custSource,
											String custIndustry,String custLevel);

	//按照客户来源

	public List<String> selectCustomerBySource();
	public List<String> selectCustomerByLevel();
	public List<String> selectCustomerByIndustry();

	//创建客户
	public int createCustomer(Customer customer);

	public Customer getCustomerById(int id);
	
	public int updateCustomer(Customer customer);
	
	public int deleteCustomer(int id);
	
	
	//测试
	public List<Customer> selectAll();

}
