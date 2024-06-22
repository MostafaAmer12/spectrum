

import 'package:educational_kids_game/core/consts/const_text.dart';
import 'package:educational_kids_game/core/services/api_services.dart';
import 'package:educational_kids_game/features/auth/domain/entity/auth_response_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/login_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/register_entity.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> loginAuth(LoginModel entity);
  Future<AuthResponseModel> registerAuth(RegisterModel entity);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});
  @override
  Future<AuthResponseModel> loginAuth(LoginModel entity) async {
    final data = await apiService.postWithoutToken(
        endPoint: ConstText().loginUrl, body: entity.toJson());
    return AuthResponseModel.fromJson(data);
  }

  @override
  Future<AuthResponseModel> registerAuth(RegisterModel entity) async {
    final data = await apiService.postWithoutToken(
        endPoint: ConstText().registerUrl, body: entity.toJson());
    return AuthResponseModel.fromJson(data);
  }
}
