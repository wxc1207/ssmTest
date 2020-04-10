package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.Customer;

public interface CustomerDao {

	//�ͻ��б�
	public List<Customer> selectCustomerList(Customer customer);
	//�ͻ���
	public Integer selectCustomerListCount(Customer customer);
	
	//��������ѯ
	public List<String> selectCustomerBySource();
	public List<String> selectCustomerByLevel();
	public List<String> selectCustomerByIndustry();
	
	
   //�����ͻ�
	public int createCustomer(Customer customer);
	//����ID��ö���
	public Customer getCustomerById(int id);
	//���¿ͻ�
	public int updateCustomer(Customer customer);
	//ɾ���ͻ�
	public int deleteCustomer(int id);
	
	//����
	public List<Customer> selectAll();
	
	
}
