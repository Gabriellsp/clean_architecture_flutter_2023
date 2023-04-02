import 'package:clean_architecture_flutter_2023/features/domain/repositories/firebase_repository.dart';

class GoogleSignInUseCase {
  final FirebaseRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<void> call() async => repository.googleAuth();
}
