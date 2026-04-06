package org.example.ex_3.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.example.ex_3.model.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String showOrders(HttpServletRequest request, Model model) {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        String loggedUser = (String) session.getAttribute("loggedUser");
        String userRole = (String) session.getAttribute("userRole");

        List<Order> orders = createMockOrders();

        model.addAttribute("orders", orders);
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("userRole", userRole);

        ServletContext application = request.getServletContext();
        AtomicInteger totalViewCount = (AtomicInteger) application.getAttribute("totalViewCount");
        
        if (totalViewCount == null) {
            totalViewCount = new AtomicInteger(0);
            application.setAttribute("totalViewCount", totalViewCount);
        }
        
        int currentCount = totalViewCount.incrementAndGet();
        model.addAttribute("totalViewCount", currentCount);

        return "orders";
    }

    private List<Order> createMockOrders() {
        List<Order> orders = new ArrayList<>();
        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.DAY_OF_MONTH, -5);
        orders.add(new Order("ORD001", "Laptop Dell XPS 15", new BigDecimal("45990000"), cal.getTime()));

        cal.add(Calendar.DAY_OF_MONTH, 2);
        orders.add(new Order("ORD002", "iPhone 15 Pro Max", new BigDecimal("32990000"), cal.getTime()));

        cal.add(Calendar.DAY_OF_MONTH, 1);
        orders.add(new Order("ORD003", "Samsung Galaxy Watch 6", new BigDecimal("8990000"), cal.getTime()));

        cal.add(Calendar.DAY_OF_MONTH, 3);
        orders.add(new Order("ORD004", "iPad Air M2", new BigDecimal("18990000"), cal.getTime()));

        cal.add(Calendar.DAY_OF_MONTH, -2);
        orders.add(new Order("ORD005", "AirPods Pro 2", new BigDecimal("6990000"), cal.getTime()));

        return orders;
    }
}
