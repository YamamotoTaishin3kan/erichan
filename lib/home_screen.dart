import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderables/reorderables.dart';

class Administrator extends StatelessWidget {
  const Administrator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AdministratorStructure());
  }
}

class AdministratorStructure extends StatefulWidget {
  const AdministratorStructure({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AdministratorStructure> {
  final double _iconSize = 90;
  late List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = <Widget>[
      Icon(Icons.filter_1, size: _iconSize),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget tile = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, tile);
      });
    }

    var wrap = ReorderableWrap(
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        children: _tiles,
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        wrap,
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.add_circle),
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                var newTile = Icon(Icons.filter_9_plus, size: _iconSize);
                setState(() {
                  _tiles.add(newTile);
                });
              },
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.remove_circle),
              color: Colors.teal,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                setState(() {
                  _tiles.removeAt(0);
                });
              },
            ),
          ],
        ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}

// class _HomePageState extends State<HomeScreen> {
//   final ImagePicker _picker = ImagePicker();
//   File? _file;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Picker'),
//       ),
//       body: Column(
//         children: [
//           if (_file != null)
//             Image.file(
//               _file!,
//               fit: BoxFit.cover,
//             ),
//           OutlinedButton(
//               onPressed: () async {
//                 final XFile? _image =
//                     await _picker.pickImage(source: ImageSource.gallery);
//                 _file = File(_image!.path);
//                 setState(() {});
//               },
//               child: const Text('画像を選択'))
//         ],
//       ),
//     );
//   }
// }
