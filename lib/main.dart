import 'package:erichan/screen_root_controller.dart';
import 'package:erichan/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => UserProfile(),
        child: const ScreenRootController(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}
