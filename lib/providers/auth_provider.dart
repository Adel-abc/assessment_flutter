import 'package:assessment/models/auth_model.dart';
import 'package:assessment/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  LoginModel? accModel;
  AuthModel? authModel;
  AccountUser? acc;

  Future<void> signUp({required String name, required String email, required String phone, required String password}) async {
    authModel = await AuthService.SignUp(email, password, phone, name);
  }

   Future<void> logIn({required String email, required String password}) async {
    accModel = await AuthService.Login(email, password);
    acc = accModel?.acc;
  }
} 