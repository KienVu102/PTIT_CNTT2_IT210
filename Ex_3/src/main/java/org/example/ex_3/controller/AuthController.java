package org.example.ex_3.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, 
                       @RequestParam String password,
                       HttpServletRequest request,
                       RedirectAttributes redirectAttributes) {
        
        if ((username.equals("admin") && password.equals("admin123")) || 
            (username.equals("staff") && password.equals("staff123"))) {
            
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", username);
            session.setAttribute("userRole", username.equals("admin") ? "Administrator" : "Staff");
            
            return "redirect:/orders";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng!");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }
}
