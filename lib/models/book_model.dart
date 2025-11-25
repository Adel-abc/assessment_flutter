class BookModel {
  List<Book> books;
  BookModel({required this.books});

  factory BookModel.fromJson(List json)
  {
    List<Book> temp = json.map(
      (book){
      return(
        Book(
          bookURL: book['imageUrl'],
          price: book['price'],
          title: book['title'], 
          author: book['author'], 
          description: book['description'], 
          rate: book['rate']
        ));
    }).toList();

    return BookModel(books: temp);
  }
}

class Book{
  final String bookURL;
  final double price;
  final String title;
  final String author;
  final String description;
  final String rate;

  Book({required this.bookURL, required this.price, required this.title, required this.author, required this.description, required this.rate});

}