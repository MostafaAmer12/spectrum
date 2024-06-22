import 'package:educational_kids_game/core/consts/const_text.dart';
import 'package:educational_kids_game/core/services/cache_services.dart';
import 'package:educational_kids_game/features/auth/domain/entity/auth_response_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/login_entity.dart';
import 'package:educational_kids_game/features/auth/domain/entity/register_entity.dart';
import 'package:educational_kids_game/features/auth/domain/repos/auth_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of(context);
  final AuthRepos authRepos;
  AuthCubit(this.authRepos) : super(AuthInitial());
  Future<void> authLogin(LoginModel model) async {
    emit(LoginLoading());

    var result = await authRepos.loginRepos(model);
    result.fold((failure) {
      emit(LoginFailure(failure.errorMsg));
    }, (response) {
      emit(LoginSuccess(response));
      CacheService.setData(
        key: ConstText().token,
        value: response.token,
      );
      CacheService.setData(
        key: ConstText().name,
        value: response.fullName,
      );
      CacheService.setData(
        key: ConstText().email,
        value: response.email,
      );
    });
  }

  Future<void> authRegister(RegisterModel model) async {
    emit(RegisterLoading());

    var result = await authRepos.registerRepos(model);
    result.fold((failure) {
      emit(RegisterFailure(failure.errorMsg));
    }, (response) {
      emit(RegisterSuccess(response));
      CacheService.setData(
        key: ConstText().token,
        value: response.token,
      );
      CacheService.setData(
        key: ConstText().name,
        value: response.fullName,
      );
      CacheService.setData(
        key: ConstText().email,
        value: response.email,
      );
    });
  }
}
