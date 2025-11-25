import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  final String userName;
  const BooksPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HI, $userName",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      
    );
  }
}