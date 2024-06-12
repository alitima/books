import 'package:books/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class ResultPageController {
  const ResultPageController();

  Future<List<BookModel>> fetchBooks(String searchValue) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('books')
        .where(
          'name',
          isGreaterThanOrEqualTo: searchValue,
          isLessThanOrEqualTo: '$searchValue\uf8ff',
        )
        .get();
    return querySnapshot.docs.map(BookModel.fromDoc).toList();
  }
}
