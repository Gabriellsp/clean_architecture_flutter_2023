import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/google_sign_in_use_case.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final GoogleSignInUseCase googleSignInUseCase;
  CredentialCubit({
    required this.googleSignInUseCase,
  }) : super(CredentialInitial());

  Future<void> googleAuthSubmit() async {
    emit(CredentialLoading());
    try {
      await googleSignInUseCase.call();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
