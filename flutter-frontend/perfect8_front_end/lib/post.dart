import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://localhost:8080/posts/'; // Change if needed

class Post {
  final String slug;
  final String title;

  Post({
    required this.slug,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      slug: json['slug'],
      title: json['title'],
    );
  }
}

class PostService {
  Future<List<Post>> fetchAllPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> fetchPostBySlug(String slug) async {
    final response = await http.get(Uri.parse('$baseUrl/$slug'));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Post not found');
    }
  }
}
