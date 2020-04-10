package com.itheima.core.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.lang3.StringUtils;
import com.itheima.core.dao.CustomerDao;
import com.itheima.core.po.Customer;
import com.itheima.core.service.CustomerService;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public List<Customer> findCustomerList( String custName, String custSource,
			String custIndustry, String custLevel) {
		
		//�����ͻ�����
		Customer customer = new Customer();
		
		//�жϿͻ�����
		if (StringUtils.isNotBlank(custName)) {
			customer.setCust_name(custName);
		}
		
		//�жϿͻ���Ϣ��Դ
		if (StringUtils.isNotBlank(custSource)) {
			customer.setCust_source(custSource);
		}

		//�жϿͻ�������ҵ
		if (StringUtils.isNotBlank(custIndustry)) {
			customer.setCust_industry(custIndustry);
		}
		
		//�жϿͻ�����
		if (StringUtils.isNotBlank(custLevel)) {
			customer.setCust_level(custLevel);
		}
		
		
		
		//��ѯ�ͻ��б�
		List<Customer> customers = customerDao.selectCustomerList(customer);
		
		
			
		
		return customers;
	}

	//��������ѯ
	@Override
	public List<String> selectCustomerBySource() {
		return customerDao.selectCustomerBySource();
		
	}

	@Override
	public List<String> selectCustomerByLevel() {
		// TODO Auto-generated method stub
		return  customerDao.selectCustomerByLevel();
	}

	@Override
	public List<String> selectCustomerByIndustry() {
		// TODO Auto-generated method stub
		return  customerDao.selectCustomerByIndustry();
	}

	@Override
	public int createCustomer(Customer customer) {
		
		return customerDao.createCustomer(customer);
	}

	@Override
	public Customer getCustomerById(int id) {
		// TODO Auto-generated method stub
		return customerDao.getCustomerById(id);
	}

	@Override
	public int updateCustomer(Customer customer) {
		System.out.println("����--�߼�ҵ��㡣����customer�Ƿ�Ϊ��");
		System.out.println(customer.toString());
		return customerDao.updateCustomer(customer);
	}

	@Override
	public int deleteCustomer(int id) {
		
		return customerDao.deleteCustomer(id);
	}

	@Override
	public List<Customer> selectAll() {
		return customerDao.selectAll();
	}


	
}
