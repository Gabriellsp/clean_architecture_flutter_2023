import 'package:clean_architecture_flutter_2023/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/home_page.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (_, __) {},
      builder: (context, credentialState) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Authenticated) {
              return HomePage(uid: authState.uid);
            } else {
              return const LoginPage();
            }
          },
        );
      },
    );
  }
}
