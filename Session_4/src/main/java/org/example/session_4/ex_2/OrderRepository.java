package org.example.session_4.ex_2;

import org.springframework.stereotype.Repository;

@Repository("orderRepositoryEx2")
public class OrderRepository {

    public String getAllOrders() {
        return "Danh sach toan bo don hang (Của Bài 2)";
    }

    public String getOrderById(Long id) {
        return "Thong tin don hang voi ID: " + id + " (Của Bài 2)";
    }
}
