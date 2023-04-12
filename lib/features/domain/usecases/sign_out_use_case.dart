import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';

class SignOutUseCase {
  final ILoginRepository loginRepository;

  SignOutUseCase({required this.loginRepository});

  Future<void> call() async => loginRepository.signOut();
}
