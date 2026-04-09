package org.example.session_5.ex_2;

import org.example.session_5.common.Dish;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class DishService {

    // Phương thức trả về danh sách có dữ liệu
    public List<Dish> getAllDishes() {
        List<Dish> dishes = new ArrayList<>();
        dishes.add(new Dish(1L, "Phở bò Kobe", 250000.0, true));
        dishes.add(new Dish(2L, "Gà hầm sâm", 150000.0, false)); // Món này hết hàng
        dishes.add(new Dish(3L, "Salad cá ngừ", 85000.0, true));
        dishes.add(new Dish(4L, "Bò Wellington", 450000.0, false)); // Món này hết hàng
        return dishes;
    }

    // Phương thức trả về danh sách rỗng (Để test bẫy dữ liệu)
    public List<Dish> getEmptyDishes() {
        return new ArrayList<>();
    }
}