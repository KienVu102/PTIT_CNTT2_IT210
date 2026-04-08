package org.example.session_4.ex_5;

import org.springframework.stereotype.Repository;

@Repository("orderRepositoryEx5")
public class OrderRepository {

    public String createOrder() {
        return "Tạo đơn hàng mới thành công (POST)";
    }

    public String getOrder(Long id) {
        return "Thông tin chi tiết của đơn hàng số: " + id + " (GET)";
    }

    public String deleteOrder(Long id) {
        return "Đã hủy đơn hàng số: " + id + " (DELETE)";
    }
}