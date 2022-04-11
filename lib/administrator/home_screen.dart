import 'package:erichan/administrator/repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';
import 'chameleon_card.dart';

class Administrator extends StatelessWidget {
  const Administrator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Repository>(
        create: (context) {
          return Repository();
        },
        child: const AdministratorStructure());
  }
}

class AdministratorStructure extends StatelessWidget {
  const AdministratorStructure({Key? key}) : super(key: key);
  static int keynNumber = 0;

  @override
  Widget build(BuildContext context) {
    final Repository _repository = Provider.of<Repository>(context);

    void _onReorder(int oldIndex, int newIndex) =>
        _repository.changePriority(oldIndex, newIndex);

    Widget cards = ReorderableWrap(
      runSpacing: 10.0,
      padding: const EdgeInsets.all(10),
      children: _repository.items,
      onReorder: _onReorder,
    );

    Widget column = Column(
      children: <Widget>[cards],
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: column),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
        onPressed: () {
          keynNumber++;
          var newTile = ChameleonCard(
              key: ValueKey(keynNumber), text: keynNumber.toString());
          _repository.addNewItem(newTile);
        },
      ),
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
