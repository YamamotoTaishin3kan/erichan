import 'package:erichan/application/event_bus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'application/dependency_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  flutterLocalNotifications();

  DependencyContainer container = DependencyContainer();
  Object application = container.getApplication();
  application = application as Widget;
  runApp(application);
}

//FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//    FlutterLocalNotificationsPlugin();

void flutterLocalNotifications() async {
  // const IOSInitializationSettings initializationSettingsIOS =
  //     IOSInitializationSettings(
  //   requestSoundPermission: true,
  //   requestBadgePermission: true,
  //   requestAlertPermission: true,
  // );

  // //initializationSettingsのオブジェクト作成
  // const InitializationSettings initializationSettings = InitializationSettings(
  //   iOS: initializationSettingsIOS,
  //   android: null,
  // );

  // await flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  // );
}

class MyApp extends StatelessWidget {
  const MyApp(this.child, {Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ja')
        ],
        home: Provider<EventBus>(
            create: (context) => EventBus(),
            dispose: (context, bus) => bus.dispose(),
            child: child),
        theme: ThemeData(primarySwatch: Colors.cyan));
  }
}
