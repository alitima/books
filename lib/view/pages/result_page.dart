import 'package:books/constants/constants.dart';
import 'package:books/controllers/result_page_controller.dart';
import 'package:books/view/pages/book_info_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.searchValue});

  final String searchValue;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final ResultPageController controller;

  @override
  void initState() {
    super.initState();

    controller = const ResultPageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: controller.fetchBooks(widget.searchValue),
        builder: (context, snapshot) {
          return switch (snapshot.connectionState) {
            ConnectionState.waiting => const Center(
                child: CircularProgressIndicator(),
              ),
            ConnectionState.done => ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final book = snapshot.data![index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookInfoPage(book: book),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          book.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('автор: ${book.author}'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            _ => const Center(child: Text(ResultPageConstants.error)),
          };
        },
      ),
    );
  }
}
