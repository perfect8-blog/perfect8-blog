package com.perfect8.blog.dto.mapper;
import com.perfect8.blog.dto.PostDto;
import com.perfect8.blog.dto.SlugDTO;
import com.perfect8.blog.entity.PostEntity;
import org.jetbrains.annotations.NotNull;

public class SlugToDTO {

    public static @NotNull SlugDTO toDto(@NotNull PostEntity entity) {
        return new SlugDTO(entity.getSlug(),entity.getTitle(),entity.getPublishedAt());
    }
}
