import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayAndTimePicker extends StatefulWidget {
  const DayAndTimePicker({Key? key}) : super(key: key);

  @override
  State<DayAndTimePicker> createState() => _DayAndTimePickerState();
}

class _DayAndTimePickerState extends State<DayAndTimePicker> {
  DateTime time = DateTime.now();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: child,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputDecorator(
        decoration: const InputDecoration(labelText: '〆切タイミング'),
        child: TextButton(
          onPressed: () => _showDialog(
            CupertinoDatePicker(
              initialDateTime: time,
              mode: CupertinoDatePickerMode.dateAndTime,
              use24hFormat: true,
              onDateTimeChanged: (DateTime newTime) {
                setState(() => time = newTime);
              },
            ),
          ),
          child: Text(
            '${time.month}月${time.day}日 ${time.hour}:${time.minute}',
            style: const TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}
