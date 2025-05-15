import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perfect8_front_end/api/post.dart';

// Class names in Dart should be PascalCase (ImageInput, not image_input)
class PostCreate extends StatefulWidget {
  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController bodyC = TextEditingController();

  void _submit() {
    String title = titleC.text;
    String body = bodyC.text;

    print('Title: $title');
    print('Body: $body');

    NewPost newPost = NewPost(title: title, body: body);
    newPost.createPost();

    //TODO Check response code and show error.
    context.go("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new blog post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleC,
                decoration: InputDecoration(labelText: 'Enter title'),
              ),
              TextField(
                controller: bodyC,
                decoration: InputDecoration(labelText: 'Enter text'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleC.dispose();
    bodyC.dispose();
    super.dispose();
  }
}
