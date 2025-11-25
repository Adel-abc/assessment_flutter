import 'package:assessment/models/book_model.dart';
import 'package:assessment/services/book_service.dart';
import 'package:flutter/foundation.dart';

class BookProvider extends ChangeNotifier {
  BookModel? books;
  Future getAllBook() async { 
    books = await BookService.getAllBooks();
    notifyListeners();
  }
}