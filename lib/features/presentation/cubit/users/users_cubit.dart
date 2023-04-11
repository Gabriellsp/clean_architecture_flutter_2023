// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_all_users_use_case.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetAllUsersUseCase _getAllUsersUseCase;
  UsersCubit({
    required GetAllUsersUseCase getAllUsersUseCase,
  })  : _getAllUsersUseCase = getAllUsersUseCase,
        super(UsersInitial());

  Future<void> getAllUsers() async {
    emit(UsersLoading());
    try {
      final streamResponse = _getAllUsersUseCase.call();
      streamResponse.listen((users) {
        emit(UsersLoaded(users: users));
      });
    } catch (_) {
      emit(UsersFailure());
    }
  }
}
