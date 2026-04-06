package org.example.ex_3.model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
    private String orderId;
    private String productName;
    private BigDecimal totalAmount;
    private Date orderDate;

    public Order() {}

    public Order(String orderId, String productName, BigDecimal totalAmount, Date orderDate) {
        this.orderId = orderId;
        this.productName = productName;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
