import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:educational_kids_game/core/services/failure_service.dart';
import 'package:educational_kids_game/features/auth/data/remote_data_source/remote_data_source.dart';
import 'package:educational_kids_game/features/auth/domain/entity/auth_response_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/login_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/register_entity.dart';
import 'package:educational_kids_game/features/auth/domain/repos/auth_repos.dart';

class AuthReposImpl extends AuthRepos {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthReposImpl(this.authRemoteDataSource);
  @override
  Future<Either<FailureService, AuthResponseModel>> loginRepos(
      LoginModel model) async {
    try {
      final result = await authRemoteDataSource.loginAuth(model);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioException(e));
      }
      print(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, AuthResponseModel>> registerRepos(
      RegisterModel model) async {
    try {
      final result = await authRemoteDataSource.registerAuth(model);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioException(e));
      }
      print(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
