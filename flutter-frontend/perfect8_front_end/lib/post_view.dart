import 'package:flutter/material.dart';
import 'package:perfect8_front_end/api/post.dart';
import 'package:go_router/go_router.dart';

// Class names in Dart should be PascalCase (ImageInput, not image_input)
class PostView extends StatefulWidget {
  final String slug;

  const PostView({super.key, required this.slug});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Future<Post> futurePost;

  void _submit() {
    context.go("/");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePost = Post.fetchPost(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post view'), //TODO
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<Post>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('An error has occured: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.title, textScaler: TextScaler.linear(2)),
                        Text(snapshot.data!.body),
                        Text('Published at: ${snapshot.data!.publishedAt.toIso8601String()}')
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
