package org.example.session_4.ex_2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("legacyControllerBai2") 
@RequestMapping("/ex2")             
public class LegacyController {

    private final OrderService orderService;

    @Autowired
    public LegacyController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/bai1/orders")
    @ResponseBody
    public String getAllOrders() {
        return orderService.getAllOrders();
    }

    @GetMapping("/bai1/orders/{id}")
    @ResponseBody
    public String getOrderById(@PathVariable Long id) {
        return orderService.getOrderById(id);
    }

     @GetMapping("/bai2/menu-loi")
     @ResponseBody
     public String getMenuBug(@RequestParam("category") String category) {
         return "Danh sach thuc don cho loai: " + category;
     }

    @GetMapping("/bai2/menu")
    @ResponseBody
    public String getMenu(@RequestParam(value = "category", required = false, defaultValue = "chay") String category) {
        return "Hien thi danh sach thuc don cho loai: " + category;
    }
}
