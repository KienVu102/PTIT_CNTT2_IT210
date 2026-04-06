package org.example.ex_4.model;

public class Event {
    private int id;
    private String name;
    private String date;
    private int price;
    private int remainingTickets;

    public Event() {}

    public Event(int id, String name, String date, int price, int remainingTickets) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.price = price;
        this.remainingTickets = remainingTickets;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRemainingTickets() {
        return remainingTickets;
    }

    public void setRemainingTickets(int remainingTickets) {
        this.remainingTickets = remainingTickets;
    }
}
