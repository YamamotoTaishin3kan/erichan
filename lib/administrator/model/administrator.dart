import 'package:erichan/administrator/model/administrator_life_cycle.dart';
import 'package:flutter/material.dart';
import 'administrator_structure.dart';

class Administrator extends StatelessWidget {
  const Administrator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AdministratorLifeCycle(child: AdministratorStructure());
  }
}
