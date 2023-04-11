import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';
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
          return _listUsersWidget(
            users: usersState.users,
          );
        }
        return Text('error!');
      },
    );
  }

  Widget _listUsersWidget({required List<UserEntity> users}) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,
      ),
      itemCount: users.length,
      itemBuilder: (_, index) {
        var user = users[index];
        var listName = user.name.split(" ");
        var name = '${listName.first} ${listName.last}';
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      (user.profileUrl),
                    ),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Flexible(
              child: Text(name),
            ),
          ],
        );
      },
    );
  }
}
