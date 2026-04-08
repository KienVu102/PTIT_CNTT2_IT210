package org.example.session_4.ex_2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// Thêm tên Bean "orderServiceEx2" để không đụng hàng với Bài 1
@Service("orderServiceEx2")
public class OrderService {

    private final OrderRepository orderRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public String getAllOrders() {
        return orderRepository.getAllOrders();
    }

    public String getOrderById(Long id) {
        return orderRepository.getOrderById(id);
    }
}