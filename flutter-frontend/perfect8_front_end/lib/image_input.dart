import 'package:flutter/material.dart';

// Class names in Dart should be PascalCase (ImageInput, not image_input)
class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descrpC = TextEditingController();
  final TextEditingController urlC = TextEditingController();

  void _submit() {
    String title = titleC.text;
    String desc = descrpC.text;
    String url = urlC.text;

    print('Title: $title');
    print('Description: $desc');
    print('Image URL: $url');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Image Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleC,
                decoration: InputDecoration(labelText: 'Enter Title'),
              ),
              TextField(
                controller: descrpC,
                decoration: InputDecoration(labelText: 'Enter Description'),
              ),
              TextField(
                controller: urlC,
                decoration: InputDecoration(labelText: 'Enter Image URL'),
                keyboardType: TextInputType.url,
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
    descrpC.dispose();
    urlC.dispose();
    super.dispose();
  }
}
