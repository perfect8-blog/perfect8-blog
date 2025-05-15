import 'package:perfect8_front_end/api/post_preview.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  test('PostPreview should load from JSON', () {
    final testJson = '{"slug":"awohishoiegr","title":"Awohishoiegr","publishedAt":"2025-05-15T10:25:27"}';
    final postPreview = PostPreview.fromJson(jsonDecode(testJson));

    expect(postPreview.slug, 'awohishoiegr');
    expect(postPreview.title, 'Awohishoiegr');
  });
}
