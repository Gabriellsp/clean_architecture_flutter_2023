import 'package:clean_architecture_flutter_2023/features/presentation/pages/users_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String uid;
  const HomePage({
    required this.uid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Usuários',
            )
          ]),
        ),
        body: const TabBarView(
          children: [
            UsersPage(),
          ],
        ),
      ),
    );
  }
}
