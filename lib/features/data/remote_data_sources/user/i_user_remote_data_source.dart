import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';

abstract class IUserRemoteDataSource {
  Stream<List<UserEntity>> getAllUsers();
}
