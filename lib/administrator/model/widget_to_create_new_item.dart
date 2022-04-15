import 'package:erichan/administrator/infrastructure/create_new_item/day_and_time_picker.dart';
import 'package:erichan/administrator/infrastructure/create_new_item/item_details_input_form.dart';
import 'package:erichan/administrator/infrastructure/create_new_item/title_input_form.dart';
import 'package:flutter/material.dart';

class WidgetToCreateNewItem extends StatelessWidget {
  const WidgetToCreateNewItem({Key? key, this.color = Colors.black})
      : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(
        child: TitleInputForm(),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: ItemDetailsInputForm(),
        )),
        const Center(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: DayAndTimePicker(),
        )),
      ],
    );
  }
}
