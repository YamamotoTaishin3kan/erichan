import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/administrator/model/administrator.dart';
import 'package:erichan/administrator/model/body_tab_pair_list.dart';
import 'package:erichan/administrator/model/repository.dart';
import 'package:erichan/administrator/model/repository_list_manager.dart';
import 'package:erichan/main.dart';
import 'package:erichan/user_auth/model/sign_in_screen_controller.dart';
import 'package:flutter/material.dart';

class DependencyContainer {
  DependencyContainer();
  final Map<Type, Object> _container = {};

  Widget getApplication() {
    return resolve<MyApp>();
  }

  RepositoryListManager getRepositoryListManager() {
    return resolve<RepositoryListManager>();
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
        _container[T] = Administrator(resolve<RepositoryManagerLifeCycle>());
        break;
      case AdministratorBody:
        _container[T] = const AdministratorBody();
        break;
      case RepositoryListManager:
        _container[T] = RepositoryListManager(resolve<FireStoreAdapter>());
        break;
      case FireStoreAdapter:
        _container[T] = FireStoreAdapter();
        break;
      case BodyTabPairList:
        _container[T] = BodyTabPairList(resolve<RepositoryListManager>());
        break;
      case RepositoryManagerLifeCycle:
        _container[T] = RepositoryManagerLifeCycle(
            resolve<AdministratorBody>(), resolve<RepositoryListManager>());
        break;
      default:
        assert(true);
    }
  }
}
