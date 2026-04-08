package org.example.session_4.ex_4;

import org.springframework.stereotype.Repository;

@Repository("orderRepositoryEx4") // Đổi tên để không trùng với các bài trước
public class OrderRepository {

    public String getAllOrders() {
        return "Danh sach toan bo don hang (Bài 4)";
    }

    public String getOrderById(Long id) {
        return "Chi tiết đơn hàng số " + id;
    }
}