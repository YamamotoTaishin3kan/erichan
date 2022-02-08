import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Column(
          children: [
            Text(context.read<UserProfile>().userEmail),
            Text(context.read<UserProfile>().userPassword)
          ],
        ));
  }
}
