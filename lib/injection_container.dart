import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:programming_hero_quiz/core/network/network_info.dart';
import 'package:programming_hero_quiz/core/network/rest_client_service.dart';
import 'package:programming_hero_quiz/features/main_menu/data/datasources/mainmenu_local_datasource.dart';
import 'package:programming_hero_quiz/features/main_menu/data/repositories/mainmenu_repository_impl.dart';
import 'package:programming_hero_quiz/features/main_menu/domain/repositories/mainmenu_repository.dart';
import 'package:programming_hero_quiz/features/main_menu/domain/usecases/get_highscore_usecase.dart';
import 'package:programming_hero_quiz/features/qa/data/datasources/qa_local_datasource.dart';
import 'package:programming_hero_quiz/features/qa/data/datasources/qa_remote_datasource.dart';
import 'package:programming_hero_quiz/features/qa/data/repositories/qa_repository_impl.dart';
import 'package:programming_hero_quiz/features/qa/domain/repositories/qa_repository.dart';
import 'package:programming_hero_quiz/features/qa/domain/usecases/get_questions_usecase.dart';
import 'package:programming_hero_quiz/features/qa/domain/usecases/save_score_usecase.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {
  //UseCases
  sl.registerLazySingleton(() => GetQuestionsUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveScoreUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetHighScoreUsecase(repository: sl()));

  //Repositories
  sl.registerLazySingleton<QARepository>(() => QARepositoryImpl(networkInfo: sl(), qaRemoteDataSource: sl(), qaLocalDataSource: sl()));
  sl.registerLazySingleton<MainMenuRepository>(() => MainMenuRepositoryImpl(localDataSource: sl()));

  //Data Sources
  sl.registerLazySingleton<QARemoteDataSource>(() => QARemoteDataSourceImpl(restClientService: sl()));
  sl.registerLazySingleton<QALocalDataSource>(() => QALocalDataSourceImpl());
  sl.registerLazySingleton<MainMenuLocalDataSource>(() => MainMenuLocalDataSourceImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //Intialize

  final client = ChopperClient(
    interceptors: [
      CurlInterceptor(),
      HttpLoggingInterceptor(),
    ],
  );

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => RestClientService.create(client));
}
