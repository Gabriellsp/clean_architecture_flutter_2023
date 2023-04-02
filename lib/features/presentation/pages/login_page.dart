import 'package:clean_architecture_flutter_2023/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/header_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/theme/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            children: [
              const HeaderWidget(title: 'Login'),
              CustomButton(
                iconButton: Icons.g_mobiledata,
                titleButton: "Login Google",
                onPressed: () {
                  BlocProvider.of<CredentialCubit>(context).googleAuthSubmit();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
