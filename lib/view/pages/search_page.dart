import 'package:books/constants/constants.dart';
import 'package:books/view/pages/result_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();

    formKey = GlobalKey<FormState>();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: SearchPageConstants.fieldHint,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return SearchPageConstants.fieldEmptyText;
                    } else if (!RegExp(r'^[A-ZА-ЯЁ]').hasMatch(value)) {
                      return SearchPageConstants
                          .fieldMustStartWithUpperCaseLetter;
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultPage(
                          searchValue: textEditingController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(SearchPageConstants.buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
