import 'package:assessment/models/book_model.dart';
import 'package:dio/dio.dart';

class BookService {
  static Dio dio = Dio();

  static Future getAllBooks() async
  {
    try{
      Response res = await dio.get("https://librarysystemflutterteam.runasp.net/api/Book/GetBooks");
      BookModel.fromJson(res.data);
    } on DioException catch (dioEx) {
      throw dioEx;
    }catch (ex) {
      throw ex;
    }
  }
}