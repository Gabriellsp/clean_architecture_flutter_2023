import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/firebase_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;
  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> googleAuth() async => remoteDataSource.googleAuth();
}
