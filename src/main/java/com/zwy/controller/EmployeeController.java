package com.zwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.bean.Employee;
import com.zwy.bean.Message;
import com.zwy.servive.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @RequestMapping("/emps")
    @ResponseBody
    public Message getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,10);
        List<Employee> employees = employeeService.getAll();
        PageInfo page = new PageInfo(employees,5);
        return Message.sucess().add("pageInfo",page);
    }
    //@RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
//        PageHelper.startPage(pn,10);
//        List<Employee> employees = employeeService.getAll();
//        PageInfo page = new PageInfo(employees,5);
//        model.addAttribute("pageInfo",page);
//        return "list";
//    }
}
