import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Book {
  final String title;
  final String author;
  final String cover;
  final String price;
  final String category;
  Book({this.title, this.author, this.cover, this.price, this.category});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'], author: json['author'], cover: json['cover'], price: json['price'], category: json['name']);
  }
}

List<Book> parseBook(String responseBody) {
  final parse = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parse.map<Book>((json) => Book.fromJson(json)).toList();
}

Future<List<Book>> fetchBook(http.Client client) async {
  final response =
      await http.get('http://192.168.56.1/book_store/books-json.php');
  if (response.statusCode == 200) {
    return compute(parseBook, response.body); // run in Background
  } else {
    throw Exception('Failed to load');
  }
}
