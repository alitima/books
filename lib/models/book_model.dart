import 'package:cloud_firestore/cloud_firestore.dart';

final class BookModel {
  const BookModel({
    required this.author,
    required this.name,
    required this.genre,
    required this.language,
    required this.publicationYear,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      author: json['author'],
      name: json['name'],
      genre: json['genre'],
      language: json['language'],
      publicationYear: json['publication_year'],
    );
  }

  factory BookModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return BookModel.fromJson(doc.data());
  }

  final String author;
  final String name;
  final String genre;
  final String language;
  final int publicationYear;

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'name': name,
      'genre': genre,
      'language': language,
      'publication_year': publicationYear,
    };
  }
}
