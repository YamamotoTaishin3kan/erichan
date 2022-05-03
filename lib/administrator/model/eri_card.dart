import 'package:erichan/administrator/infrastructure/detail_dialog.dart';
import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/application/app_define.dart';
import 'package:flutter/material.dart';

class EriCard extends StatelessWidget {
  EriCard({Key? key, required this.info}) : super(key: key);
  final InfoBase info;
  final Color color = Palette.nextColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (_) => DetailDialog(info: info, color: color),
            );
          },
          child: EriCardBodyBuilder.create(info)),
    );
  }
}

class EriCardBodyBuilder {
  static Widget create(InfoBase info) {
    if (info is TaskInfo) {
      return TaskCardBody(info);
    } else if (info is AlbumInfo) {
      return AlbumCardBody(info);
    }
    return const Text("EriCardBodyBuilderError");
  }
}

class TaskCardBody extends StatelessWidget {
  const TaskCardBody(this.info, {Key? key}) : super(key: key);
  final TaskInfo info;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StandardText(info.title, fontSize: 20, color: Colors.white),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "残り　" + timeLeft(),
            textAlign: TextAlign.right,
            style:
                const StandardTextStyle(color: Color.fromARGB(255, 226, 15, 0)),
          )),
    ]);
  }

  String timeLeft() {
    Duration timeLeft = info.deadline.difference(DateTime.now());
    if (timeLeft.inDays > 0) {
      return daysLeft(timeLeft);
    } else {
      return hourLeft(timeLeft);
    }
  }

  String daysLeft(Duration timeLeft) {
    return timeLeft.inDays.toString() + "日";
  }

  String hourLeft(Duration timeLeft) {
    return timeLeft.inHours.toString() + "時間";
  }
}

class AlbumCardBody extends StatelessWidget {
  const AlbumCardBody(this.info, {Key? key}) : super(key: key);
  final AlbumInfo info;
  @override
  Widget build(BuildContext context) {
    return const Text("これは未実装アルバムです");
  }
}

class Palette {
  static Color _itemColor = Colors.red;
  static Color nextColor() {
    if (_itemColor == Colors.red) {
      _itemColor = Colors.orange;
    } else if (_itemColor == Colors.orange) {
      _itemColor = Colors.yellow;
    } else if (_itemColor == Colors.yellow) {
      _itemColor = Colors.greenAccent;
    } else if (_itemColor == Colors.greenAccent) {
      _itemColor = Colors.green;
    } else if (_itemColor == Colors.green) {
      _itemColor = Colors.blueAccent;
    } else if (_itemColor == Colors.blueAccent) {
      _itemColor = Colors.purple;
    } else if (_itemColor == Colors.purple) {
      _itemColor = Colors.pinkAccent;
    } else if (_itemColor == Colors.pinkAccent) {
      _itemColor = Colors.red;
    }
    return _itemColor;
  }
}
