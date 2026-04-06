package org.example.session_1;

import org.example.session_1.config.AppConfig;
import org.example.session_1.model.SystemConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        // Khởi tạo Container bằng Annotation
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

        // Lấy Bean
        SystemConfig config = context.getBean(SystemConfig.class);

        // In thông tin
        config.showInfo();
    }
}
