package org.example.session_4.ex_5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderServiceEx5")
public class OrderService {

    private final OrderRepository orderRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public String createOrder() {
        return orderRepository.createOrder();
    }

    public String getOrder(Long id) {
        return orderRepository.getOrder(id);
    }

    public String deleteOrder(Long id) {
        return orderRepository.deleteOrder(id);
    }
}