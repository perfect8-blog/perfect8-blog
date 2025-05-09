import 'package:perfect8_front_end/api/post.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  test('Post should load from JSON', () {
    final testJson = '{"title":"My blog post","body":"Lorem ipsum dolor sit amet","publishedAt":"2025-05-09T08:24:32.067130593"}';
    final post = Post.fromJson(jsonDecode(testJson));

    expect(post.title, 'My blog post');
    expect(post.body, 'Lorem ipsum dolor sit amet');
    expect(post.publishedAt, DateTime.fromMicrosecondsSinceEpoch(1746771872067130));
  });

  test('Loading Post from invalid JSON should throw', () {
    final testJson = '{"title2":"My blog post","body2":"Lorem ipsum dolor sit amet","publishedAt2":"2025-05-09T08:24:32.067130593"}';
    expect(() => Post.fromJson(jsonDecode(testJson)), throwsA(isA<FormatException>()));
  });
}