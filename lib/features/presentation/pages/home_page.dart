import 'package:clean_architecture_flutter_2023/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/users_page.dart';
import 'package:clean_architecture_flutter_2023/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
                onPressed: () async {
                  Navigator.of(context).pushAndRemoveUntil(
                      OnGenerateRoute.route(
                          const RouteSettings(name: '/login')),
                      (route) => false);
                  await BlocProvider.of<AuthCubit>(context).signOut();
                },
              ),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Usuários',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            UsersPage(
              currentUid: uid,
            ),
          ],
        ),
      ),
    );
  }
}
