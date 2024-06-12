import 'package:books/view/pages/search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    builder: (context, child) {
      return MediaQuery.withNoTextScaling(child: child!);
    },
    theme: ThemeData(useMaterial3: false),
    home: const SearchPage(),
  ));
}
