import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_flutter_2023/features/domain/usecases/sign_in_use_case.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  CredentialCubit({
    required this.signInUseCase,
  }) : super(CredentialInitial());

  Future<void> googleAuthSubmit() async {
    emit(CredentialLoading());
    try {
      await signInUseCase.call();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
