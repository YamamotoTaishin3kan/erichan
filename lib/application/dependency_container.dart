import 'package:erichan/user_auth/model/sign_in_screen_controller.dart';
import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../main.dart';
import 'Screen_transition_animation.dart';

class DependencyInjector {
  final DependencyContainer _container = DependencyContainer();

  Widget getApplication() {
    return _container.resolve<MyApp>();
  }
}

class DependencyContainer {
  DependencyContainer();
  final Map<Type, Object> _container = {};

  Widget getApplication() {
    return resolve<MyApp>();
  }

  Widget resolve<T>() {
    if (_container.containsKey(T)) {
      return _container[T]! as Widget;
    } else {
      register<T>();
      return _container[T]! as Widget;
    }
  }

  void register<T>() {
    switch (T) {
      case MyApp:
        _container[T] = MyApp(resolve<SignInScreenController>());
        break;
      case SignInScreenController:
        _container[T] = SignInScreenController(resolve<Administrator>());
        break;
      case Administrator:
        _container[T] = const Administrator();
        break;
      default:
    }
  }
}
