import 'package:equatable/equatable.dart';

class EngageUserEntity extends Equatable {
  final String? currentUidUser;
  final String? otherUidUser;

  const EngageUserEntity({
    this.currentUidUser,
    this.otherUidUser,
  });

  @override
  List<Object?> get props => [
        currentUidUser,
        otherUidUser,
      ];
}
