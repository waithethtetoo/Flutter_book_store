// import 'dart:html';

import 'package:bookstore/book.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final Book book;

  BookDetail({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.network(
                  book.cover,
                  width: 14.0,
                )),
            SizedBox(height: 10.0),
            Text(
              book.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              book.author,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              book.price,
              style: TextStyle(fontSize: 16),
            ),
            Text(book.category, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
