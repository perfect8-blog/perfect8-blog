package com.perfect8.blog.repository;

import com.perfect8.blog.entity.PostEntity;
import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

public interface PostRepository extends CrudRepository<PostEntity, Long> {
    public Optional<PostEntity> findBySlug(String slug);
}


