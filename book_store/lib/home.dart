import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'book.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu Button');
          },
        ),
      ),
      body: FutureBuilder<List<Book>>(
        future: fetchBook(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? BooksList(bookLst: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class BooksList extends StatelessWidget {
  final List<Book> bookLst;

  BooksList({Key key, this.bookLst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildCardCollection(bookLst.length),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  List<Card> _buildCardCollection(int count) {
    List<Card> cards = List.generate(
        count,
        (index) => Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.network(
                        bookLst[index].cover,
                        width: 14.0,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          bookLst[index].title,
                        ),
                        SizedBox(height: 4.0),
                        Text(bookLst[index].author),
                      ],
                    ),
                  )
                ],
              ),
            ));
    return cards;
  }
}
