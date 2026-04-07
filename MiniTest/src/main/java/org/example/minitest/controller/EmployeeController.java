package org.example.minitest.controller;

import org.example.minitest.model.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EmployeeController {

    @RequestMapping("/")
    public String home() {
        return "redirect:/employees";
    }

    @RequestMapping("/employees")
    public String listEmployees(Model model) {
        List<Employee> employees = new ArrayList<>();

        employees.add(new Employee(1, "Nguyen Van A", "Phòng Đào tạo", 100000.0));
        employees.add(new Employee(2, "Nguyen Van B", "Phòng Đào tạo", 8500.0));
        employees.add(new Employee(3, "Nguyen Van C", "Phòng Đào tạo", 15000.0));
        employees.add(new Employee(4, "Nguyen Van D", "Phòng Đào tạo", 9500.0));
        employees.add(new Employee(5, "Nguyen Van E", "Phòng Đào tạo", 11000.0));
        
        model.addAttribute("employees", employees);
        
        return "employee-list";
    }
}
