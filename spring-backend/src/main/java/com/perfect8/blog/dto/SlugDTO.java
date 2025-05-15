package com.perfect8.blog.dto;

import java.time.LocalDateTime;

public record SlugDTO(String slug, String title, LocalDateTime dateTime) {
}
