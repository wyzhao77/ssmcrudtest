package com.zwy.servive;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.bean.Employee;
import com.zwy.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDepth(null);

    }
}
