import 'package:clean_architecture_flutter_2023/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/common.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/header_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            // BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            snackBarNetwork(
                msg: "Credenciais inválidas! Verifique os campos novamente ...",
                context: context);
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return Scaffold(
              body: loadingIndicatorProgressBar(),
            );
          }
          if (credentialState is CredentialSuccess) {
            // return BlocBuilder<AuthCubit, AuthState>(
            //   builder: (context, authState) {
            //     if (authState is Authenticated) {
            //       return HomePage(uid: authState.uid,);
            //     } else {
            //       print("Unauthenticsted");
            //       return _bodyWidget();
            //     }
            //   },
            // );
          }

          return _bodyWidget(context);
        },
      ),
    );
  }

  Widget _bodyWidget(context) => SingleChildScrollView(
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
      );
}
