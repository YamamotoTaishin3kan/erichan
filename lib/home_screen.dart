import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Column(
        children: [
          if (_file != null)
            Image.file(
              _file!,
              fit: BoxFit.cover,
            ),
          OutlinedButton(
              onPressed: () async {
                final XFile? _image =
                    await _picker.pickImage(source: ImageSource.gallery);
                _file = File(_image!.path);
                setState(() {});
              },
              child: const Text('画像を選択'))
        ],
      ),
    );
  }
}
