import 'package:dartz/dartz.dart';
import 'package:educational_kids_game/core/services/failure_service.dart';
import 'package:educational_kids_game/features/auth/domain/entity/auth_response_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/login_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/register_entity.dart';

abstract class AuthRepos {
  Future<Either<FailureService, AuthResponseModel>> loginRepos(
      LoginModel model);
  Future<Either<FailureService, AuthResponseModel>> registerRepos(
      RegisterModel model);
}
