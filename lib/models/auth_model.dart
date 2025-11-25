class AuthModel {
  final String message;
  final String status;
  AuthModel({required this.message, required this.status});

  factory AuthModel.fromJson(Map<String, dynamic> json)
  {
    return AuthModel(
      message: json['message'] ?? "null from api",
      status: json['statusCode'] ?? "null from api"
    );
  } 
}

class LoginModel{
    final String message;
    final String status;
    final AccountUser acc;
  LoginModel({required this.message, required this.status, required this.acc});


  factory LoginModel.fromJson(Map<String, dynamic> json)
  {
    return LoginModel(
      message: json['message'] ?? "null from api",
      status: json['statusCode'] ?? "null from api",
      acc: json['user']
    );
  }
}

class AccountUser{
  final String name;
  final String email;
  final String phone;
  final String password;

  AccountUser({required this.email, required this.name, required this.password, required this.phone});
}