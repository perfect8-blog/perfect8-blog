import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://cmagnusb.org/api/v1/posts/'; // Change if needed

class PostPreview {
  final String slug;
  final String title;
  final DateTime publishedAt;

  PostPreview({
    required this.slug,
    required this.title,
    required this.publishedAt,
  });

  factory PostPreview.fromJson(Map<String, dynamic> json) {
    return PostPreview(
      slug: json['slug'],
      title: json['title'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}

class PostPreviewService {
  Future<List<PostPreview>> fetchAllPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => PostPreview.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
