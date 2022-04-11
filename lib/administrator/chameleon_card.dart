import 'package:flutter/material.dart';
import '../application/app_define.dart';
import 'model/detail_dialog.dart';

class ChameleonCard extends StatelessWidget {
  const ChameleonCard({required Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: ElevatedButton(
            onPressed: () {
              showDialog<void>(
                  context: context,
                  builder: (_) {
                    return const DetailDialog();
                  });
            },
            style: ElevatedButton.styleFrom(
              elevation: 100,
            ),
            child: Column(
              children: [StandardText(text, fontSize: 20)],
            )));
  }
}
