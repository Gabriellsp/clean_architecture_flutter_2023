import 'package:clean_architecture_flutter_2023/features/data/models/user_model.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/user/i_user_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRemoteDataSourceImpl implements IUserRemoteDataSource {
  final FirebaseFirestore fireStore;

  UserRemoteDataSourceImpl({required this.fireStore});

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = fireStore.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }
}
