import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NewDocument extends StatelessWidget {
  const NewDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuillController quillController = QuillController.basic();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(child: QuillToolbar.basic(controller: quillController)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: QuillEditor.basic(
                    controller: quillController,
                    readOnly: false, // true for view only mode
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
