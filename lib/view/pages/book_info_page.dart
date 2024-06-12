import 'package:books/constants/constants.dart';
import 'package:books/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.name)),
      body: ListView(
        children: BookInfoPageConstants.all.map((pageConstant) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 21),
                children: [
                  TextSpan(
                    text: '$pageConstant:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' ${_getBookInfo(pageConstant)}'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final buffer = StringBuffer();
          for (int i = 0; i < BookInfoPageConstants.all.length; i++) {
            final pageConstant = BookInfoPageConstants.all[i];
            buffer.write('$pageConstant:\n');
            buffer.write(_getBookInfo(pageConstant));
            if (i != BookInfoPageConstants.all.length - 1) {
              buffer.write('\n\n');
            }
          }
          Share.share(buffer.toString());
        },
        child: const Icon(Icons.share),
      ),
    );
  }

  Object _getBookInfo(String pageConstant) {
    return switch (pageConstant) {
      BookInfoPageConstants.name => book.name,
      BookInfoPageConstants.author => book.author,
      BookInfoPageConstants.genre => book.genre,
      BookInfoPageConstants.language => book.language,
      BookInfoPageConstants.publicationYear => book.publicationYear,
      _ => '',
    };
  }
}
