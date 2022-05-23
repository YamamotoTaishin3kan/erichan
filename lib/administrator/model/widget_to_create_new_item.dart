import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/administrator/infrastructure/item_details_input_form.dart';
import 'package:erichan/administrator/infrastructure/day_and_time_picker.dart';
import 'package:erichan/administrator/infrastructure/title_input_form.dart';
import 'package:erichan/administrator/model/repository.dart';
import 'package:erichan/utilities/deadline.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetToCreateNewItem extends StatelessWidget {
  WidgetToCreateNewItem({Key? key, this.color = Colors.black})
      : super(key: key);

  void _pushed() {
    TaskInfo newInfo = TaskInfo(
        title: _titleInputForm.text,
        detail: _itemDetailsInputForm.text,
        deadline: Deadline(_dayAndTimePickerKey.currentState?.time ?? today),
        docID: "FireStoreDon'tKnow");
    localRepository.addNewInfo(newInfo);
  }

  final Color color;
  final TitleInputForm _titleInputForm = TitleInputForm();
  final ItemDetailsInputForm _itemDetailsInputForm = ItemDetailsInputForm();
  late GlobalObjectKey<DayAndTimePickerState> _dayAndTimePickerKey;

  @override
  Widget build(BuildContext context) {
    ConfirmButton confirmButton = ConfirmButton(onPressed: _pushed);

    _dayAndTimePickerKey = GlobalObjectKey<DayAndTimePickerState>(context);
    DayAndTimePicker dayAndTimePicker =
        DayAndTimePicker(key: _dayAndTimePickerKey);

    return SimpleDialog(
      title: Center(
        child: _titleInputForm,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: _itemDetailsInputForm,
        )),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: dayAndTimePicker,
        )),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: confirmButton,
          ),
        )
      ],
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 100,
          child: ElevatedButton(
            child: const Text('追加', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: const Color.fromARGB(255, 34, 34, 34),
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              onPressed();
              Navigator.pop(context);
            },
          )),
    );
  }
}
