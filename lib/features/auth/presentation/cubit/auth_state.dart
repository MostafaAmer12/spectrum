part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthResponseModel model;

  const LoginSuccess(this.model);
}

class LoginFailure extends AuthState {
  final String errorMessage;

  const LoginFailure(this.errorMessage);
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final AuthResponseModel model;

  const RegisterSuccess(this.model);
}

class RegisterFailure extends AuthState {
  final String errorMessage;

  const RegisterFailure(this.errorMessage);
}
