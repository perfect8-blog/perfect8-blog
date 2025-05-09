import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:perfect8_front_end/api/post.dart';
import 'package:perfect8_front_end/post_create.dart';
import 'package:perfect8_front_end/post_view.dart';
import 'package:go_router/go_router.dart';

void main() {
  usePathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Post> futurePost;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/create',
          builder: (context, state) => PostCreate(),
        ),
        GoRoute(
          path: '/posts/:slug',
          builder:(context, state) => PostView(slug: state.pathParameters["slug"]!),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Perfect8-blog!',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF181818),
          elevation: 0,
        ),
      ),
      routerConfig: router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here are images showed from Perfect8-tour around the World!'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                child: Image.asset(
                  'assets/images/logga.png', // Replace with your image path
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Perfect8-Blog!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostCreate()),
          );
          print('Add button pressed');
          print("The button has been pressed right now!");
        },
        tooltip: 'Create blog post',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
