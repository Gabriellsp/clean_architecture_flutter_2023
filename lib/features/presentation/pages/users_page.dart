import 'package:clean_architecture_flutter_2023/features/presentation/cubit/users/users_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, usersState) {
        if (usersState is UsersLoading) {
          return const ProgressIndicatorWidget(
            text: 'Carregando usários, favor aguardar ...',
          );
        } else if (usersState is UsersLoaded) {
          return Text('sucesso! ${usersState.users[0].email}');
        }
        return Text('error!');
      },
    );
  }
}
