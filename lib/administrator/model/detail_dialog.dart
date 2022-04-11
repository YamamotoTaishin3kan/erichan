import 'package:flutter/material.dart';

import '../../application/app_define.dart';

class DetailDialog extends StatelessWidget {
  const DetailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Center(child: Text('うんこをする')),
      children: <Widget>[
        GestureDetector(
            child: Align(
              alignment: Alignment.centerRight,
              child: Card(
                  color: Colors.greenAccent,
                  child: Container(
                      margin: const EdgeInsets.all(4),
                      child: StandardText('完了'))),
            ),
            onTap: () {
              //カードを消す
            }),
      ],
    );
  }
}
