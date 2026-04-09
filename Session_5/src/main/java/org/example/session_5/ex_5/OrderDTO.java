package org.example.session_5.ex_5;

import org.example.session_5.common.Dish;
import java.util.List;

public class OrderDTO {
    private String orderId;
    private String customerName;
    private List<Dish> items;

    private double subTotal;
    private double taxAmount;
    private double grandTotal;

    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public List<Dish> getItems() { return items; }
    public void setItems(List<Dish> items) { this.items = items; }
    public double getSubTotal() { return subTotal; }
    public void setSubTotal(double subTotal) { this.subTotal = subTotal; }
    public double getTaxAmount() { return taxAmount; }
    public void setTaxAmount(double taxAmount) { this.taxAmount = taxAmount; }
    public double getGrandTotal() { return grandTotal; }
    public void setGrandTotal(double grandTotal) { this.grandTotal = grandTotal; }
}