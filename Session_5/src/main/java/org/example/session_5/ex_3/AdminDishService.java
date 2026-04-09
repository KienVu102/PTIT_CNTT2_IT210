package org.example.session_5.ex_3;

import org.example.session_5.common.Dish;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class AdminDishService {

    private final List<Dish> dishes;

    public AdminDishService() {
        dishes = new ArrayList<>();
        dishes.add(new Dish(1L, "Phở bò Kobe", 250000.0, true));
        dishes.add(new Dish(2L, "Gà hầm sâm", 150000.0, false));
        dishes.add(new Dish(3L, "Salad cá ngừ", 85000.0, true));
    }

    public List<Dish> getAllDishes() {
        return dishes;
    }

    public Dish getDishById(Long id) {
        return dishes.stream()
                .filter(dish -> dish.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}