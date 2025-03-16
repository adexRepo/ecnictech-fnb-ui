import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ecnictech_fnb_ui/common/service/secure_http_request.dart';
import 'package:ecnictech_fnb_ui/features/auth/bloc/authentication_bloc.dart';
import 'package:ecnictech_fnb_ui/features/auth/datasource/authentication_remote_datasource.dart';
import 'package:ecnictech_fnb_ui/features/auth/models/user_info.dart';
import 'package:ecnictech_fnb_ui/features/auth/repository/authentication_repository.dart';
import 'package:ecnictech_fnb_ui/features/auth/usecase/login_usecase.dart';
import 'package:ecnictech_fnb_ui/features/auth/usecase/logout_usecase.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_bloc.dart';

final locator = GetIt.instance;
Future<void> initialzeContainer() async {
  locator.enableRegisteringMultipleInstancesOfOneType();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox('hiveBox');

  locator.registerFactory<Box>(() {
    return Hive.box('hiveBox');
  });

  Hive.registerAdapter(UserInfoAdapter());

  initialzeBlocs(locator);
  initialCommon(locator);
  initialzeUsecase(locator);
  initialzeRepository(locator);
  initialzeDatasource(locator);
}

void initialzeBlocs(GetIt container) {
  locator.registerFactory(() =>
      AuthenticationBloc(logInUseCase: locator(), logOutUseCase: locator()));
  locator.registerFactory(() => HomeBloc());
}

void initialzeUsecase(GetIt container) {
  locator.registerLazySingleton(() => LogInUseCase(locator()));
  locator.registerLazySingleton(() => LogOutUseCase(locator()));
}

void initialzeRepository(GetIt container) {
  locator.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(authenticationRemoteDataSource: locator()));
}

void initialzeDatasource(GetIt container) {
  locator.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(secureHttpRequest: locator()));
}

void initialCommon(GetIt container) {
  locator
      .registerLazySingleton<SecureHttpRequest>(() => SecureHttpRequestImpl());
}
