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
 * 客户管理控制器类
 * @author admin
 *
 */
@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	/**
	 * 创建客户
	 */
	@RequestMapping(value="/customer/create.action")
	@ResponseBody
	public String createCustomer(Customer customer,HttpSession session) {
		// 获取Session中的当前用户信息
	    User user = (User) session.getAttribute("USER_SESSION");
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = customerService.createCustomer(customer);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * 通过id获取客户信息
	 */
	@RequestMapping("/customer/getCustomerById.action")
	@ResponseBody
	public Customer getCustomerById(int id) {
		
		System.out.println("时间就是");
		System.out.println(id);
	    Customer customer = customerService.getCustomerById(id);
	    System.out.println(customer.toString());
	    return customer;
	}
	
	/**
	 * 修改客户
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
	 * 删除客户
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
		//条件查询所有客户
		List<Customer> customers = customerService.
						findCustomerList( custName, custSource, custIndustry, custLevel);
		
		
		//条件查询所有客户
		//System.out.println(customers.toString());
		//客户来源
		List<String> customerSource = customerService.selectCustomerBySource();
		//客户所属行业
		List<String> customerIndustry = customerService.selectCustomerByIndustry();
		//客户级别
		List<String> customerLevel = customerService.selectCustomerByLevel();
		
		PageInfo pageInfo = new PageInfo(customers);
		//添加参数
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
