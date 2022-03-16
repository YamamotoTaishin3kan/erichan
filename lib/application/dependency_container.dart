import 'package:erichan/user_auth/model/sign_in_screen_controller.dart';
import '../home_screen.dart';
import '../main.dart';

class DependencyInjector {
  final DependencyContainer _container = DependencyContainer();

  MyApp getApplication() {
    return _container.resolve<MyApp>();
  }
}

class DependencyContainer {
  DependencyContainer();
  final Map<Type, Object> _container = {};

  MyApp getApplication() {
    return resolve<MyApp>();
  }

  T resolve<T>() {
    if (_container.containsKey(T)) {
      return _container[T]! as T;
    } else {
      register<T>();
      return _container[T]! as T;
    }
  }

  void register<T>() {
    switch (T) {
      case MyApp:
        _container[T] = MyApp(resolve<SignInScreenController>());
        break;
      case SignInScreenController:
        _container[T] = SignInScreenController(resolve<HomeScreen>());
        break;
      case HomeScreen:
        _container[T] = const HomeScreen();
        break;
      default:
    }
  }
}
