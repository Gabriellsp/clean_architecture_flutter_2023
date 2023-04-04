import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';

class SignInUseCase {
  final ILoginRepository loginRepository;

  SignInUseCase({required this.loginRepository});

  Future<void> signIn() async => loginRepository.googleAuth();
}
