import 'package:clean_architecture_flutter_2023/features/domain/usecases/current_uid_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/is_authenticated_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsAuthenticatedUseCase isAuthenticatedUseCase;
  final CurrentUidUseCase currentUidUseCase;
  AuthCubit(
      {required this.isAuthenticatedUseCase, required this.currentUidUseCase})
      : super(AuthInitial());

  void initializeApp() {
    var userIsAuthenticated = isAuthenticatedUseCase.call();
    try {
      if (userIsAuthenticated) {
        final uid = currentUidUseCase.getCurrentUid();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
