import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:erichan/administrator/infrastructure/createRepository.dart';
import 'package:erichan/administrator/model/administrator_structure.dart';
import 'package:erichan/administrator/model/body_tab_pair_list.dart';
import 'package:erichan/administrator/model/repository_list_manager.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:erichan/application/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Administrator extends StatelessWidget {
  const Administrator(this.body, {Key? key}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdministratorAppBar(),
      body: body,
    );
  }
}

class RepositoryManagerLifeCycle extends StatelessWidget {
  const RepositoryManagerLifeCycle(this.child, this.repositoryList, {Key? key})
      : super(key: key);
  final Widget child;
  final RepositoryListManager repositoryList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: repositoryList,
      child: child,
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
  const AdministratorBody({Key? key}) : super(key: key);

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
    setState(() => selectedPos = value!);
  }

  @override
  Widget build(BuildContext context) {
    // RepositoryListManagerが更新された場合ここが変わる
    BodyTabPairList bodyAndTab =
        BodyTabPairList(Provider.of<RepositoryListManager>(context));

    MapEntry<Widget, TabItem> pair = bodyAndTab.pairList[selectedPos];
    Widget body = pair.key;

    return Scaffold(
      body: body,
      bottomNavigationBar: CircularBottomNavigation(
        bodyAndTab.getTabItems(),
        controller: _navigationController,
        selectedCallback: changeRepositoryView,
      ),
    );
  }
}
