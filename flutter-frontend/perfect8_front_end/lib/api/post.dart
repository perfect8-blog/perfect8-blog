import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final String title;
  final String body;
  final DateTime publishedAt;

  static const String URL_PATH = "/posts";

  const Post({required this.title, required this.body, required this.publishedAt});

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "title": String title,
        "body": String body,
        "publishedAt": String publishedAt,
      } => Post(title: title, body: body, publishedAt: DateTime.parse(publishedAt)),
      _ => throw const FormatException("Failed to load Post from JSON."),
    };
  }

  static Future<Post> fetchPost(String slug) async {
    //TODO don't hardcode localhost
    Uri uri = Uri(scheme: "http", host: "localhost", port: 8080, path: URL_PATH + "/" + slug);
    final resp = await http.get(uri);

    return switch (resp.statusCode) {
      200 => new Post.fromJson(jsonDecode(resp.body)),
      404 => throw Exception("Post not found."),
      _ => throw Exception("Unknown error occured when fetching Post.")
    };
  }
}
