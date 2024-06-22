import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String age;

  const RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["fullName"] = name;
    data["email"] = email;
    data["password"] = password;
    data["age"] = age;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      name,
      email,
      password,
      age,
    ];
  }
}
