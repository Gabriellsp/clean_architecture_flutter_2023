import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_user_repository.dart';

class GetAllUsersUseCase {
  final IUsersRepository repository;
  GetAllUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.getAllUsers();
  }
}
