import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/chat_page.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/initial_page.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        {
          return materialBuilder(widget: const InitialPage());
        }
      case "/login":
        {
          return materialBuilder(widget: const LoginPage());
        }
      case "/chat":
        {
          if (args is EngageUserEntity) {
            return materialBuilder(
              widget: ChatPage(
                engageUser: args,
              ),
            );
          } else {
            return materialBuilder(
              widget: const ErrorPage(),
            );
          }
        }
      default:
        return materialBuilder(widget: const ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(child: Text('Error Page')),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
