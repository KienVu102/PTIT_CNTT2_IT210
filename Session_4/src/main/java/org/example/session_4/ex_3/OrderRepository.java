package org.example.session_4.ex_3;

import org.springframework.stereotype.Repository;

@Repository("orderRepositoryEx3")
public class OrderRepository {

    public String getAllOrders() {
        return "Danh sach toan bo don hang (Bài 3)";
    }

    public String getOrderById(Long id) {
        return "Chi tiết đơn hàng số: " + id;
    }
}