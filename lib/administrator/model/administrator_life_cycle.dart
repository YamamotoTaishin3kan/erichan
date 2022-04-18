import 'package:erichan/administrator/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdministratorLifeCycle extends StatelessWidget {
  const AdministratorLifeCycle({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Repository>(
        create: (context) => currentRepository, child: child);
  }
}
