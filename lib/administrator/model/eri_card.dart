import 'package:erichan/administrator/infrastructure/detail_dialog.dart';
import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/application/app_define.dart';
import 'package:erichan/application/palette.dart';
import 'package:flutter/material.dart';

class EriCard extends StatelessWidget {
  EriCard({Key? key, required this.info}) : super(key: key);
  final Item info;
  final Color color = Palette.getColor();

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
  static Widget create(Item info) {
    if (info is Task) {
      return TaskCardBody(info);
    } else if (info is Album) {
      return AlbumCardBody(info);
    }
    return const Text("EriCardBodyBuilderError");
  }
}

class TaskCardBody extends StatelessWidget {
  const TaskCardBody(this.info, {Key? key}) : super(key: key);
  final Task info;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 7 / 10,
              child: Center(
                child:
                    StandardText(info.title, fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(width: MediaQuery.of(context).size.width / 10),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width * 2 / 10,
            child: Text(
              info.deadline.getTimeLeft(),
              textAlign: TextAlign.right,
              style: const StandardTextStyle(
                  fontSize: 11, color: Color.fromARGB(255, 226, 15, 0)),
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumCardBody extends StatelessWidget {
  const AlbumCardBody(this.info, {Key? key}) : super(key: key);
  final Album info;
  @override
  Widget build(BuildContext context) {
    return const Text("これは未実装アルバムです");
  }
}
