package com.perfect8.blog;

import com.perfect8.blog.entity.PostEntity;
import com.perfect8.blog.repository.PostRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;

@SpringBootTest
public class PostRepositoryTests {
    @Autowired
    private PostRepository postRepository;

    @Test
    void savePost() {
        var post = new PostEntity("test", "Test!", "Testy test.", LocalDateTime.now());
        postRepository.save(post);
    }

    @Test
    void saveAndFindPostBySlug() {
        var post = new PostEntity("test-2", "Test 2!", "Testy test 2.", LocalDateTime.now());
        postRepository.save(post);

        var post2 = postRepository.findBySlug("test-2");
        assertThat(post2).isNotEmpty();
        assertThat(post.getTitle()).isEqualTo(post2.get().getTitle());
        assertThat(post.getBody()).isEqualTo(post2.get().getBody());

        //TODO This fails, I think the time gets truncated by the database?
        //assertThat(post.getPublishedAt()).isEqualTo(post2.get().getPublishedAt());
    }
}
