import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_firebase_repository.dart';

class GoogleSignInUseCase {
  final IFirebaseRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<void> call() async => repository.googleAuth();
}
