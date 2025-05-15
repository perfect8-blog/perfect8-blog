package com.perfect8.blog.dto;

import java.time.LocalDateTime;

/// A preview of a post without the body, for displaying a list of recent posts in the frontend.
public record PostPreviewDto(String slug, String title, LocalDateTime publishedAt) {
}
