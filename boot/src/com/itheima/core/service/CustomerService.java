package com.itheima.core.service;

import java.util.List;

import com.itheima.core.po.Customer;

public interface CustomerService {
	//��ѯ�ͻ��б�
	public List<Customer> findCustomerList(String custName,String custSource,
											String custIndustry,String custLevel);

	//���տͻ���Դ

	public List<String> selectCustomerBySource();
	public List<String> selectCustomerByLevel();
	public List<String> selectCustomerByIndustry();

	//�����ͻ�
	public int createCustomer(Customer customer);

	public Customer getCustomerById(int id);
	
	public int updateCustomer(Customer customer);
	
	public int deleteCustomer(int id);
	
	
	//����
	public List<Customer> selectAll();

}
