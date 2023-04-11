part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoading extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;
  const UsersLoaded({required this.users});
  @override
  List<Object> get props => [users];
}

class UsersFailure extends UsersState {
  @override
  List<Object> get props => [];
}
