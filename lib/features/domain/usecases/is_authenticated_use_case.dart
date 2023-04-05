import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';

class IsAuthenticatedUseCase {
  final ILoginRepository loginRepository;

  IsAuthenticatedUseCase({required this.loginRepository});

  bool call() => loginRepository.userIsAuthenticated();
}
