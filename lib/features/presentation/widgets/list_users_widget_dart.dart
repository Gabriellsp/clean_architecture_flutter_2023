import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ListUsersWidget extends StatelessWidget {
  final List<UserEntity> users;
  const ListUsersWidget({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (_, index) {
          var user = users[index];
          return Padding(
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
          );
        },
      ),
    );
  }
}
