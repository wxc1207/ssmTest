package com.itheima.core.web.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.core.po.Customer;
import com.itheima.core.po.User;
import com.itheima.core.service.CustomerService;

/**
 * �ͻ������������
 * @author admin
 *
 */
@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	/**
	 * �����ͻ�
	 */
	@RequestMapping(value="/customer/create.action")
	@ResponseBody
	public String createCustomer(Customer customer,HttpSession session) {
		// ��ȡSession�еĵ�ǰ�û���Ϣ
	    User user = (User) session.getAttribute("USER_SESSION");
	    // ִ��Service���еĴ������������ص�����Ӱ�������
	    int rows = customerService.createCustomer(customer);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * ͨ��id��ȡ�ͻ���Ϣ
	 */
	@RequestMapping("/customer/getCustomerById.action")
	@ResponseBody
	public Customer getCustomerById(int id) {
		
		System.out.println("ʱ�����");
		System.out.println(id);
	    Customer customer = customerService.getCustomerById(id);
	    System.out.println(customer.toString());
	    return customer;
	}
	
	/**
	 * �޸Ŀͻ�
	 * @param customer
	 * @return
	 */
	@RequestMapping("/customer/update.action")
	@ResponseBody
	public String customerUpdate(Customer customer) {
	    int rows = customerService.updateCustomer(customer);
	    System.out.println(rows);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	

	/**
	 * ɾ���ͻ�
	 */
	@RequestMapping("/customer/delete.action")
	@ResponseBody
	public String customerDelete(Integer id) {
	    int rows = customerService.deleteCustomer(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
	
	@RequestMapping(value="/customer/list.action")
	public String fun(@RequestParam( name="pn" ,defaultValue="1") Integer pn,
											String custName,String custSource,
											String custIndustry,String custLevel,
						
											Model model) {
		PageHelper.startPage(pn,8);
		//������ѯ���пͻ�
		List<Customer> customers = customerService.
						findCustomerList( custName, custSource, custIndustry, custLevel);
		
		
		//������ѯ���пͻ�
		//System.out.println(customers.toString());
		//�ͻ���Դ
		List<String> customerSource = customerService.selectCustomerBySource();
		//�ͻ�������ҵ
		List<String> customerIndustry = customerService.selectCustomerByIndustry();
		//�ͻ�����
		List<String> customerLevel = customerService.selectCustomerByLevel();
		
		PageInfo pageInfo = new PageInfo(customers);
		//��Ӳ���
		model.addAttribute("pageInfo", pageInfo);
		
		model.addAttribute("custSource",custSource);
		model.addAttribute("custIndustry",custIndustry);
		model.addAttribute("custLevel",custLevel);
		
		System.out.println("customerindu..."+custIndustry);
		for (String string : customerIndustry) {
			System.out.println(string);
		}
		return "customer";
		
		
	}

	
	
}
