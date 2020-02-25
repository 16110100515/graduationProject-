package cn.sm1234.service;

import java.util.List;

import javax.annotation.Resource;

import cn.sm1234.impl.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.sm1234.dao.CustomerMapper;
import cn.sm1234.domain.Customer;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

	//注入Mapper接口对象
	@Resource
	private CustomerMapper customerMapper;
	
	public List<Customer> findAll() {
		return customerMapper.findAl();
	}

	public void save(Customer customer) {
		//判断是添加还是修改
		if(customer.getId()!=null){
			//修改
			customerMapper.update(customer);
		}else{
			//增加
			customerMapper.save(customer);
		}
	}

	public Customer findById(Integer id) {
		return customerMapper.findById(id);
	}

	public void delete(Integer[] id) {
		customerMapper.delete(id);
	}

}
