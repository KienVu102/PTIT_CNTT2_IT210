package org.example.ex_4.controller;

import org.example.ex_4.model.Event;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EventController {

    private List<Event> mockEvents;

    public EventController() {
        // Initialize mock data for demonstration
        mockEvents = new ArrayList<>();
        mockEvents.add(new Event(1, "Spring Framework Workshop", "2024-03-15", 250000, 15));
        mockEvents.add(new Event(2, "Java Conference 2024", "2024-04-20", 0, 50));
        mockEvents.add(new Event(3, "Web Development Summit", "2024-05-10", 150000, 0));
        mockEvents.add(new Event(4, "Cloud Computing Expo", "2024-06-05", 500000, 8));
        mockEvents.add(new Event(5, "AI & Machine Learning Forum", "<script>alert('hack')</script>", 300000, 25));
        mockEvents.add(new Event(6, "DevOps Best Practices", "2024-07-12", 200000, 3));
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/events/search")
    public String searchEvents(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (keyword == null) {
            keyword = "";
        }
        
        List<Event> filteredEvents = filterEvents(keyword);
        
        model.addAttribute("keyword", keyword);
        model.addAttribute("events", filteredEvents);
        
        return "events/search";
    }

    private List<Event> filterEvents(String keyword) {
        List<Event> result = new ArrayList<>();
        
        if (keyword == null || keyword.trim().isEmpty()) {
            result.addAll(mockEvents);
            return result;
        }
        
        String searchKeyword = keyword.toLowerCase().trim();
        
        for (Event event : mockEvents) {
            if (event.getName().toLowerCase().contains(searchKeyword)) {
                result.add(event);
            }
        }
        
        return result;
    }
}
