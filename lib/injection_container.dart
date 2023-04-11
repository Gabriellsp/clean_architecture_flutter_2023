import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/message/i_message_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/message/message_remote_data_source_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/user/user_remote_data_source_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/user/i_user_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/login/i_login_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/login/login_remote_data_source_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/repositories/login_repository_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/repositories/message_repository_impl.dart';
import 'package:clean_architecture_flutter_2023/features/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_login_repository.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_message_repository.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_user_repository.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/current_uid_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_all_users_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_chat_messages_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/is_authenticated_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/send_message_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/sign_in_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/chat/chat_cubit.dart';
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

  sl.registerFactory<ChatCubit>(
    () => ChatCubit(
      getChatMessagesUseCase: sl.call(),
      sendMessageUseCase: sl.call(),
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

  sl.registerLazySingleton<GetChatMessagesUseCase>(
    () => GetChatMessagesUseCase(
      repository: sl.call(),
    ),
  );

  sl.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(
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

  sl.registerLazySingleton<IMessageRepository>(
    () => MessageRepositoryImpl(
      messageRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<ILoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      fireStore: sl.call(),
      auth: sl.call(),
      googleSignIn: sl.call(),
    ),
  );

  sl.registerLazySingleton<IUserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      fireStore: sl.call(),
    ),
  );

  sl.registerLazySingleton<IMessageRemoteDataSource>(
    () => MessageRemoteDataSourceImpl(
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
