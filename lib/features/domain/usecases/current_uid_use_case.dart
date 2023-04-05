import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';

class CurrentUidUseCase {
  final ILoginRepository loginRepository;

  CurrentUidUseCase({required this.loginRepository});

  String getCurrentUid() => loginRepository.getCurrentUId();
}
