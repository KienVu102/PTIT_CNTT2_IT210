package org.example.session_5.ex_3;

import org.example.session_5.common.Dish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/bai3")
public class AdminDishController {

    private final AdminDishService adminDishService;

    @Autowired
    public AdminDishController(AdminDishService adminDishService) {
        this.adminDishService = adminDishService;
    }

    @GetMapping("/dishes")
    public String showAdminDishList(Model model) {
        List<Dish> dishes = adminDishService.getAllDishes();
        model.addAttribute("dishes", dishes);
        return "ex_3/admin-dish-list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes) {
        Dish existingDish = adminDishService.getDishById(id);

        if (existingDish == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy món ăn yêu cầu!");
            return "redirect:/bai3/dishes";
        }

        model.addAttribute("dish", existingDish);
        return "ex_3/edit-dish";
    }
}