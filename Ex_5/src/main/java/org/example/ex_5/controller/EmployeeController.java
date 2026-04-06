package org.example.ex_5.controller;

import jakarta.servlet.http.HttpSession;
import org.example.ex_5.model.Employee;
import org.example.ex_5.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String listEmployees(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        model.addAttribute("employees", employeeService.getAllEmployees());
        model.addAttribute("totalTechSalary", employeeService.getTotalSalaryByDepartment("Kỹ thuật"));
        return "employees";
    }

    @GetMapping("/{code}")
    public String employeeDetail(@PathVariable String code, HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        Employee employee = employeeService.findByCode(code);
        if (employee == null) {
            throw new RuntimeException("Nhân viên [" + code + "] không tồn tại trong hệ thống");
        }

        model.addAttribute("employee", employee);
        model.addAttribute("role", session.getAttribute("role"));
        return "employee-detail";
    }
}
