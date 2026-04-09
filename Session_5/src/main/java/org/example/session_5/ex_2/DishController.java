package org.example.session_5.ex_2;

import org.example.session_5.common.Dish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/bai2")
public class DishController {

    private final DishService dishService;

    @Autowired
    public DishController(DishService dishService) {
        this.dishService = dishService;
    }

    @GetMapping("/dishes")
    public String showDishList(Model model) {
        List<Dish> dishes = dishService.getAllDishes();

        //Nếu muốn test dsach rỗng thì cmt dòng code trên và bỏ cmt dòng dưới
        // List<Dish> dishes = dishService.getEmptyDishes();

        model.addAttribute("dishes", dishes);

        return "ex_2/dish-list";
    }
}