package com.hexademo.backend.config;

import com.hexademo.backend.entities.User;
import com.hexademo.backend.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class DataLoader {

    @Bean
    CommandLineRunner initDatabase(UserRepository userRepository) {
        return args -> {
            // Only add sample data if database is empty
            if (userRepository.count() == 0) {
                userRepository.save(User.builder()
                        .name("Alice Johnson")
                        .email("alice.johnson@hexademo.com")
                        .role("Software Engineer")
                        .build());

                userRepository.save(User.builder()
                        .name("Bob Smith")
                        .email("bob.smith@hexademo.com")
                        .role("Product Manager")
                        .build());

                userRepository.save(User.builder()
                        .name("Carol Williams")
                        .email("carol.williams@hexademo.com")
                        .role("UX Designer")
                        .build());

                userRepository.save(User.builder()
                        .name("David Brown")
                        .email("david.brown@hexademo.com")
                        .role("DevOps Engineer")
                        .build());

                System.out.println("✅ Sample users loaded successfully!");
            }
        };
    }
}
