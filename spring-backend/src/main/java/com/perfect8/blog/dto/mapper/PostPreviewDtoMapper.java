package com.perfect8.blog.dto.mapper;
import com.perfect8.blog.dto.PostPreviewDto;
import com.perfect8.blog.entity.PostEntity;
import org.jetbrains.annotations.NotNull;

public class PostPreviewDtoMapper {

    public static @NotNull PostPreviewDto toDto(@NotNull PostEntity entity) {
        return new PostPreviewDto(entity.getSlug(),entity.getTitle(),entity.getPublishedAt());
    }
}
