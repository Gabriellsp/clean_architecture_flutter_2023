import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/i_login_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginRemoteDataSource remoteDataSource;
  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> googleAuth() async => remoteDataSource.googleAuth();
}
