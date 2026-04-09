package org.example.session_5.ex_5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bai5")
public class SmartOrderController {

    private final OrderService orderService;

    @Autowired
    public SmartOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/order/{id}")
    public String showOrderDetail(@PathVariable("id") String orderId, Model model) {
        try {
            OrderDTO order = orderService.getOrderDetails(orderId);
            model.addAttribute("order", order);
            return "ex_5/smart-order";

        } catch (Exception e) {
            model.addAttribute("errorMessage", "LỖI HỆ THỐNG: " + e.getMessage());
            return "ex_5/smart-order";
        }
    }
}