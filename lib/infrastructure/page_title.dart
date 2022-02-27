import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({required this.titleName});
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        titleName,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
