import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/firebase/i_firebase_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_user_repository.dart';

class UserRepositoryImpl implements IUsersRepository {
  IFirebaseRemoteDataSource firebaseRemoteDataSource;
  UserRepositoryImpl({required this.firebaseRemoteDataSource});

  @override
  Stream<List<UserEntity>> getAllUsers() =>
      firebaseRemoteDataSource.getAllUsers();
}
