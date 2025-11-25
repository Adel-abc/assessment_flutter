import 'package:assessment/models/auth_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  static Dio dio = Dio();

  static Future<AuthModel> SignUp(String email, String password, String numberPhone, String name) async
  {
    try{
        Response res = await dio.post("https://librarysystemflutterteam.runasp.net/api/Registration/Signup",
         data: {
          "name": name,
          "email": email,
          "password": password,
          "phoneNumber": numberPhone
         });

         return AuthModel.fromJson(res.data);
    }on DioException catch (dioex) 
    {
       throw dioex;
    }
    catch (ex) 
    {
       throw ex;
    }
  }


  static Future<LoginModel> Login(String email, String password) async
  {
    try{  
      Response res = await dio.post("https://librarysystemflutterteam.runasp.net/api/Registration/SignIn",
      data: {
        "email": email,
        "password": password
      });

      return LoginModel.fromJson(res.data);
    }on DioException catch (dioex) 
    {
       throw dioex;
    }
    catch (ex) 
    {
       throw ex;
    }
  }


}