import 'package:erichan/administrator/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/app_define.dart';
import '../entities/task_info.dart';

class DetailDialog extends StatelessWidget {
  const DetailDialog({Key? key, required this.info, this.color = Colors.black})
      : super(key: key);

  final Item info;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: StandardText(info.title)),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      children: detailDialogBody(context),
    );
  }

  List<Widget> detailDialogBody(BuildContext context) {
    if (info is Task) {
      return taskDetail(context);
    } else if (info is Album) {
      return albumDetail();
    } else {
      return [const Text("detailDialogBodyError")];
    }
  }

  List<Widget> taskDetail(BuildContext context) {
    List<Widget> value = [
      Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text((info as Task).detail)),
      ),
      Center(
        child: SizedBox(
            width: 100,
            child: ElevatedButton(
              child: const Text('完了'),
              style: ElevatedButton.styleFrom(
                primary: color,
                onPrimary: Colors.white,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pop(context);
                Provider.of<Repository>(context).remove(info);
              },
            )),
      ),
    ];
    return value;
  }

  List<Widget> albumDetail() {
    List<Widget> value = [
      Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.extent(
                maxCrossAxisExtent: 100, children: (info as Album).pictures)),
      ),
      Center(
        child: SizedBox(
            width: 100,
            child: ElevatedButton(
              child: const Text('削除'),
              style: ElevatedButton.styleFrom(
                primary: color,
                onPrimary: Colors.red,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
            )),
      ),
    ];
    return value;
  }
}
