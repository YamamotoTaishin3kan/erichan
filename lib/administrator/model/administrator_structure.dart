import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/administrator/model/repository.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:erichan/application/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';
import 'eri_card.dart';
import 'widget_to_create_new_item.dart';

class RepositoryView extends StatelessWidget {
  const RepositoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    void _onReorder(int oldIndex, int newIndex) =>
        repository.changePriority(oldIndex, newIndex);

    Widget cards = ReorderableWrap(
      runSpacing: 10.0,
      padding: const EdgeInsets.all(10),
      children: repository.infos
          .map((cardInfo) =>
              EriCard(key: ValueKey(cardInfo.title), info: cardInfo))
          .toList(),
      onReorder: _onReorder,
    );

    Widget column = Column(children: <Widget>[cards]);

    return Scaffold(
        body: SingleChildScrollView(child: column),
        floatingActionButton: const CreateNewItemButton());
  }
}

class CreateNewItemButton extends StatelessWidget {
  const CreateNewItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: key,
      backgroundColor: Palette.getColor(),
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog<void>(
          context: context,
          // contextでrepositoryを渡せないため、渡す必要がある
          builder: (_) => WidgetToCreateNewItem(
              repository: Provider.of<Repository>(context)),
        );
      },
    );
  }
}
