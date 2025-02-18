import 'package:get_it/get_it.dart';
import 'package:shoes_store/controller/cubit/shoes_cubit.dart';
import 'package:shoes_store/data/model/shoes_model.dart';
import 'package:shoes_store/data/repo/shoes_repo.dart';
import 'package:shoes_store/domain/repo/shoes_repo.dart';
import 'package:shoes_store/domain/usecases/get_shoes_list.dart';


// GetIt instance for DI
final sl = GetIt.instance;

/// Initializes all the dependencies
Future<void> init() async {
  // Register Data Source
  sl.registerLazySingleton<ShoeDataSource>(() => ShoeDataSourceImpl());

  // Register Repository and inject the data source
  sl.registerLazySingleton<ShoeRepository>(() => ShoeRepositoryImpl(dataSource: sl()));

  // Register UseCase and inject the repository
  sl.registerLazySingleton<GetShoesList>(() => GetShoesList(repository: sl()));

  // Register Cubit and inject the use case
  sl.registerFactory<ShoesCubit>(() => ShoesCubit(getShoesList: sl()));
}
