package org.example.session_4.ex_5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@Controller("orderControllerEx5")
@RequestMapping("/ex5/orders") 
public class OrderController {

    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    // 1. Route Xem đơn hàng (GET)
    @GetMapping("/{id}")
    @ResponseBody
    public String getOrder(@PathVariable("id") Long id) {
        return orderService.getOrder(id);
    }

    // 2. Route Tạo đơn hàng (POST)
    @PostMapping
    @ResponseBody
    public String createOrder() {
        return orderService.createOrder();
    }

    // 3. Route Hủy đơn hàng (DELETE)
    @DeleteMapping("/{id}")
    @ResponseBody
    public String deleteOrder(@PathVariable("id") Long id) {
        return orderService.deleteOrder(id);
    }

    // 4. Đánh chặn lỗi bẫy dữ liệu ép kiểu
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseBody
    public String handleTypeMismatch() {
        return "LỖI HỆ THỐNG: ID đơn hàng truyền vào không hợp lệ. Vui lòng nhập số!";
    }
}