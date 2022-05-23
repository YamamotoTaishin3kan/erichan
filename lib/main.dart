import 'package:erichan/application/event_bus.dart';
import 'package:erichan/application/notifications_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'application/dependency_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DependencyContainer container = DependencyContainer();

  NotificationsManager.initialize();

  Object application = container.getApplication();
  application = application as Widget;
  runApp(application);
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
        theme: ThemeData(primarySwatch: Colors.orange));
  }
}
