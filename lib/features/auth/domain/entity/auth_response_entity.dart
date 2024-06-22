import 'package:equatable/equatable.dart';

class AuthResponseModel extends Equatable {
  final String? message;
  final String token;
  final String fullName;
  final String email;

  const AuthResponseModel({
    required this.message,
    required this.token,
    required this.fullName,
    required this.email,
  });
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        token: json["token"],
        message: json["message"]??'',
        fullName: json["fullName"],
        email: json["email"],
      );
  @override
  List<Object?> get props => [
        message,
        token,
        fullName,
        email,
      ];
}
