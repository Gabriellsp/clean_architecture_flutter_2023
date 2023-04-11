import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/firebase/firebase_remote_data_source_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/firebase/i_firebase_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/login/i_login_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/login/login_remote_data_source_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/repositories/login_repository_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_user_repository.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/current_uid_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_all_users_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/is_authenticated_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/sign_in_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/users/users_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      isAuthenticatedUseCase: sl.call(),
      currentUidUseCase: sl.call(),
    ),
  );

  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
      signInUseCase: sl.call(),
    ),
  );

  sl.registerFactory<UsersCubit>(
    () => UsersCubit(
      getAllUsersUseCase: sl.call(),
    ),
  );

  sl.registerLazySingleton<IsAuthenticatedUseCase>(
    () => IsAuthenticatedUseCase(
      loginRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<CurrentUidUseCase>(
    () => CurrentUidUseCase(
      loginRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      loginRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<GetAllUsersUseCase>(
    () => GetAllUsersUseCase(
      repository: sl.call(),
    ),
  );

  sl.registerLazySingleton<ILoginRepository>(
    () => LoginRepositoryImpl(
      loginRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<IUsersRepository>(
    () => UserRepositoryImpl(
      firebaseRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<ILoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      fireStore: sl.call(),
      auth: sl.call(),
      googleSignIn: sl.call(),
    ),
  );

  sl.registerLazySingleton<IFirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      fireStore: sl.call(),
    ),
  );

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);
}
