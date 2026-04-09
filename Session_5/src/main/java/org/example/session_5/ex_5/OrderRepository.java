package org.example.session_5.ex_5;

import org.example.session_5.common.Dish;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Repository
public class OrderRepository {
    private final Map<String, OrderDTO> mockDatabase = new HashMap<>();

    public OrderRepository() {
        OrderDTO order1 = new OrderDTO();
        order1.setOrderId("ORD-001");
        order1.setCustomerName("Vu Dinh Kien");
        order1.setItems(Arrays.asList(
                new Dish(1L, "Beefsteak sốt tiêu đen", 350000.0, true),
                new Dish(2L, "Rượu vang đỏ", 120000.0, true)
        ));
        mockDatabase.put(order1.getOrderId(), order1);
    }

    public OrderDTO findById(String orderId) {
        return mockDatabase.get(orderId);
    }
}