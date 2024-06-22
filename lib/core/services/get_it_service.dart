import 'package:dio/dio.dart';
import 'package:educational_kids_game/core/services/api_services.dart';
import 'package:educational_kids_game/features/auth/data/remote_data_source/remote_data_source.dart';
import 'package:educational_kids_game/features/auth/data/repos_impl/auth_repos_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItService() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<AuthReposImpl>(
    AuthReposImpl(
      AuthRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
  
}
