package com.perfect8.blog.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@Profile("dev")
public class SecurityConfig {
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .cors(Customizer.withDefaults())
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/posts/**").permitAll() //TODO require auth to create posts
                        //.requestMatchers(HttpMethod.POST, "/posts").permitAll() // Create posts
                        //.requestMatchers(HttpMethod.GET, "/posts/*").permitAll() // View posts
                )
                .build();
    }

    /*@Bean
    WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.debug(true);
    }*/
}
