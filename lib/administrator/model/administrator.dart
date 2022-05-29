import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:erichan/administrator/infrastructure/createRepository.dart';
import 'package:erichan/administrator/model/administrator_structure.dart';
import 'package:erichan/administrator/model/repository_list_manager.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:erichan/application/palette.dart';
import 'package:flutter/material.dart';

class Administrator extends StatelessWidget {
  final RepositoryListManager repositoryList = RepositoryListManager();
  Administrator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdministratorAppBar(),
      body: AdministratorBody(),
    );
  }
}

class AdministratorAppBar extends AppBar {
  AdministratorAppBar({Key? key})
      : super(key: key, backgroundColor: Palette.getColor(), actions: [
          IconButton(
              onPressed: () => FirebaseAuthAdapter.signOut(),
              icon: const Icon(Icons.logout))
        ]);
}

class AdministratorBody extends StatefulWidget {
  AdministratorBody({Key? key}) : super(key: key);
  final RepositoryListManager repositoryList = RepositoryListManager();
  @override
  State<StatefulWidget> createState() => AdministratorBodyState();
}

class AdministratorBodyState extends State<AdministratorBody> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  void changeRepositoryView(int? value) {
    setState(() {
      assert(value != null);
      selectedPos = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget repositoryView;
    if (selectedPos == 0) {
      repositoryView = CreateRepository();
    } else {
      int repositoryPos = selectedPos - 1;
      repositoryView = widget.repositoryList
          .setsRepositoryToWidgetUnder(const RepositoryView(), repositoryPos);
    }

    TabItemsCreator tabItemsCreator =
        TabItemsCreator(widget.repositoryList.getReositoryNames());

    return Scaffold(
      body: repositoryView,
      bottomNavigationBar: CircularBottomNavigation(
        tabItemsCreator.getTabItemList(),
        controller: _navigationController,
        selectedCallback: changeRepositoryView,
      ),
    );
  }
}

class TabItemsCreator {
  TabItemsCreator(List<String> names) {
    for (String name in names) {
      items.add(TabItem(Icons.home, name, Palette.getColor(),
          labelStyle: const TextStyle(fontWeight: FontWeight.normal)));
    }
  }

  int selectedPos = 0;
  final List<TabItem> items = [
    TabItem(Icons.create, "Create", Palette.getColor(),
        labelStyle: const TextStyle(fontWeight: FontWeight.normal))
  ];

  List<TabItem> getTabItemList() {
    return items;
  }
}
