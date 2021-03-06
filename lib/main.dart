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

  AsyncProcess asyncProcess = AsyncProcess(container);
  await asyncProcess.endFirst();

  Object application = container.getApplication();
  application = application as Widget;
  runApp(application);
}

// 自分なりに考えたことなので、誤っている可能性あり
class AsyncProcess {
  AsyncProcess(this.container);
  final DependencyContainer container;
  Future<void> endFirst() async {
    NotificationsManager.initialize();
    await container.getRepositoryListManager().setRepositories();
  }
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
        theme: ThemeData(primarySwatch: Colors.lightGreen));
  }
}
