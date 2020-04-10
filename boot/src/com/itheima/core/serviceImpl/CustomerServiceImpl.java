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
		
		//创建客户对象
		Customer customer = new Customer();
		
		//判断客户名称
		if (StringUtils.isNotBlank(custName)) {
			customer.setCust_name(custName);
		}
		
		//判断客户信息来源
		if (StringUtils.isNotBlank(custSource)) {
			customer.setCust_source(custSource);
		}

		//判断客户所属行业
		if (StringUtils.isNotBlank(custIndustry)) {
			customer.setCust_industry(custIndustry);
		}
		
		//判断客户级别
		if (StringUtils.isNotBlank(custLevel)) {
			customer.setCust_level(custLevel);
		}
		
		
		
		//查询客户列表
		List<Customer> customers = customerDao.selectCustomerList(customer);
		
		
			
		
		return customers;
	}

	//按条件查询
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
		System.out.println("更新--逻辑业务层。。。customer是否为空");
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
