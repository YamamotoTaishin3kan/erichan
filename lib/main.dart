import 'package:erichan/application/event_bus.dart';
import 'package:erichan/user_auth/model/sign_in_screen_controller.dart';
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
        home: Provider<EventBus>(
          create: (context) => EventBus(),
          dispose: (context, bloc) => bloc.dispose(),
          child: const SignInScreenController(),
        ),
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ));
  }
}
