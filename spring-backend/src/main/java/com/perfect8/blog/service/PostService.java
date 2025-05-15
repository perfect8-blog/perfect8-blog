package com.perfect8.blog.service;

import com.perfect8.blog.entity.PostEntity;
import com.perfect8.blog.repository.PostRepository;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.text.Normalizer;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class PostService {
    private final Logger logger = LoggerFactory.getLogger(PostService.class);
    private final PostRepository postRepository;

    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    /// Get all posts.
    /// @return         A list of all posts
    public List<PostEntity> getAllPosts() {
        return (List<PostEntity>) postRepository.findAll();
    }

    /// Get a post by its unique URL slug.
    /// @param slug     The post's unique URL slug
    /// @return         An Optional<PostEntity> that is present if the post exists
    public @NotNull Optional<PostEntity> getPostBySlug(@NotNull String slug) {
        return postRepository.findBySlug(slug);
    }

    /// Create a new post.
    /// @param title    The title of the post
    /// @param body     The post body
    public @NotNull PostEntity createNewPost(@NotNull String title, @NotNull String body) {
        var post = new PostEntity(
                generateSlug(title),
                title,
                body,
                LocalDateTime.now()
        );

        postRepository.save(post);

        logger.info("Created a new post with title \"{}\" and slug \"{}\"", post.getTitle(), post.getSlug());

        return post;
    }

    /// Create a slug from a title.
    /// @param title    The title
    /// @return         Slug
    public @NotNull String generateSlug(@NotNull String title) {
        // Code taken from this blog post: https://glaforge.dev/posts/2024/01/08/url-slug-or-how-to-remove-accents-in-java/
        //TODO maybe use a library instead (Slugify?)
        return Normalizer.normalize(title, Normalizer.Form.NFD)
                .toLowerCase()
                .replaceAll("\\p{IsM}+", "")
                .replaceAll("\\p{IsP}+", " ")
                .trim()
                .replaceAll("\\s+", "-");
    }
}
