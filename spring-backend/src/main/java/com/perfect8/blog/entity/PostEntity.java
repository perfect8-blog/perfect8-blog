package com.perfect8.blog.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("post")
public class PostEntity {
    /// The database ID of the post
    private @Id long id;
    /// The URL slug
    private String slug;
    /// The title of the post
    private String title;
    /// The body text
    private String body;
    /// When the post was published
    private LocalDateTime publishedAt;

    public PostEntity() {
    }

    public PostEntity(long id, String slug, String title, String body, LocalDateTime publishedAt) {
        this.id = id;
        this.slug = slug;
        this.title = title;
        this.body = body;
        this.publishedAt = publishedAt;
    }

    public PostEntity(String slug, String title, String body, LocalDateTime publishedAt) {
        this.slug = slug;
        this.title = title;
        this.body = body;
        this.publishedAt = publishedAt;
    }

    public long getId() {
        return id;
    }

    public String getSlug() {
        return slug;
    }

    public String getTitle() {
        return title;
    }

    public String getBody() {
        return body;
    }

    public LocalDateTime getPublishedAt() {
        return publishedAt;
    }
}
