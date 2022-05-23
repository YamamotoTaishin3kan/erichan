import 'package:erichan/administrator/application/administrator_facade.dart';
import 'package:erichan/administrator/model/administrator.dart';
import 'package:erichan/main.dart';
import 'package:erichan/user_auth/model/sign_in_screen_controller.dart';
import 'package:flutter/material.dart';

class DependencyContainer {
  DependencyContainer();
  final Map<Type, Object> _container = {};

  Widget getApplication() {
    return resolve<MyApp>();
  }

  T resolve<T>() {
    if (!_container.containsKey(T)) {
      register<T>();
    }
    return _container[T]! as T;
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
        _container[T] = AdministratorFacade.createAdministrator();
        break;
      default:
        assert(true);
    }
  }
}
