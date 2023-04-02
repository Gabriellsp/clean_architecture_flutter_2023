import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/firebase_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/firebase_remote_data_source_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/repositories/firebase_repository_impl.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/firebase_repository.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/google_sign_in_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
      googleSignInUseCase: sl.call(),
    ),
  );

  sl.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(
      repository: sl.call(),
    ),
  );

  sl.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(
      remoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      fireStore: sl.call(),
      auth: sl.call(),
      googleSignIn: sl.call(),
    ),
  );

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);
}
