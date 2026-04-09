package org.example.session_5.ex_5;

import org.example.session_5.common.Dish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderDTO getOrderDetails(String orderId) throws Exception {
        OrderDTO order = orderRepository.findById(orderId);

        if (order == null) {
            throw new Exception("Không tìm thấy đơn hàng mã: " + orderId);
        }

        double subTotal = order.getItems().stream().mapToDouble(Dish::getPrice).sum();
        double tax = subTotal * 0.10;
        double grandTotal = subTotal + tax;

        order.setSubTotal(subTotal);
        order.setTaxAmount(tax);
        order.setGrandTotal(grandTotal);

        return order;
    }
}