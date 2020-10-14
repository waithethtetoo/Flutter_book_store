import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
                    child: Image.asset('assets/readBook.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Book Title'),
                        SizedBox(height: 8.0),
                        Text('Author'),
                      ],
                    ),
                  )
                ],
              ),
            ));
    return cards;
  }

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
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildCardCollection(10),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
