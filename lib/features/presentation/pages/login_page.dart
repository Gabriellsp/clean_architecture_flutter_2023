import 'package:clean_architecture_flutter_2023/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/pages/home_page.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/snackbar_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/header_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/button_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialFailure) {
            snackBarNetwork(
                message:
                    "Credenciais inválidas! Verifique os campos novamente ...",
                context: context);
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return const Scaffold(
              body: ProgressIndicatorWidget(),
            );
          }
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(
                    uid: authState.uid,
                  );
                } else {
                  return _bodyWidget(context: context);
                }
              },
            );
          }

          return _bodyWidget(context: context);
        },
      ),
    );
  }

  Widget _bodyWidget({required BuildContext context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const HeaderWidget(title: 'Login'),
              const SizedBox(
                height: 250,
              ),
              CustomButton(
                iconButton: FontAwesomeIcons.google,
                titleButton: "Login Google",
                onPressed: () {
                  BlocProvider.of<CredentialCubit>(context).googleAuthSubmit();
                },
              )
            ],
          ),
        ),
      );
}
