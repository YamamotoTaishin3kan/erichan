import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/administrator/model/repository.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';
import 'eri_card.dart';
import 'widget_to_create_new_item.dart';

class AdministratorStructure extends StatelessWidget {
  const AdministratorStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) =>
        localRepository.changePriority(oldIndex, newIndex);

    Widget cards = ReorderableWrap(
      runSpacing: 10.0,
      padding: const EdgeInsets.all(10),
      children: Provider.of<Repository>(context)
          .infos
          .map((cardInfo) =>
              EriCard(key: ValueKey(cardInfo.title), info: cardInfo))
          .toList(),
      onReorder: _onReorder,
    );

    Widget column = Column(children: <Widget>[cards]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
            onPressed: () => FirebaseAuthAdapter.signOut(),
            icon: const Icon(Icons.logout))
      ]),
      body: SingleChildScrollView(child: column),
      floatingActionButton: const CreateNewItemButton(),
    );
  }
}

class CreateNewItemButton extends StatelessWidget {
  const CreateNewItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: key,
      backgroundColor: Colors.amber,
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (_) => WidgetToCreateNewItem(),
        );
      },
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
