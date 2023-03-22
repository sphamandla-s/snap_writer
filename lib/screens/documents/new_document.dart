import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../models/docs_view_model.dart';

class NewDocument extends StatefulWidget {
  const NewDocument({Key? key, required this.note, required this.isNew})
      : super(key: key);

  final bool isNew;
  final Map<String, Object?> note;

  @override
  State<NewDocument> createState() => _NewDocumentState();
}

class _NewDocumentState extends State<NewDocument> {
  QuillController quillController = QuillController.basic();
  TextEditingController _titleController = TextEditingController();
  late bool edit;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  void initState() {
    // TODO: implement initState
    edit = widget.isNew;
    super.initState();
    !widget.isNew ? loadExistingNote() : '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }

  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note['content'].toString());
    _titleController =
        TextEditingController(text: widget.note['title'].toString());
    quillController = QuillController(
        document: doc, selection: const TextSelection.collapsed(offset: 0));
  }

  void addNewNote() {
    DateTime date = DateTime.now();
    var createDate = dateFormat.parse(
        '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:00');
    String title = _titleController.text;
    String content = quillController.document.toPlainText();
    Provider.of<DocsProViewModel>(context, listen: false)
        .addNote(const Uuid().v4(), title, content, createDate);
  }

  void updateNote() {
    String title = _titleController.text;
    String content = quillController.document.toPlainText();
    Provider.of<DocsProViewModel>(context, listen: false).updateNote(
        widget.note['_id'].toString(),
        title,
        content,
        dateFormat.parse(
            '${widget.note['createdOn'].toString().split('T')[0]} ${widget.note['createdOn'].toString().split('T')[1].split(':00.')[0]}:00'));
  }

  void deleteNode() {
    Provider.of<DocsProViewModel>(context, listen: false)
        .deleteNote(widget.note['_id'].toString());
    Navigator.pop(context);
  }

  void changeIsNew() {
    setState(() {
      edit = !edit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: edit
            ? [
                IconButton(onPressed: () {}, icon: const Icon(Icons.lock)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
              ]
            : [
                IconButton(
                    onPressed: () {
                      changeIsNew();
                    },
                    icon: const Icon(Icons.update)),
                IconButton(
                    onPressed: () {
                      deleteNode();
                    },
                    icon: const Icon(Icons.delete)),
              ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.isNew ? addNewNote() : updateNote();
          Navigator.pop(context);
        },
        child: const Icon(Icons.save_alt_rounded),
      ),
      body: Column(
        children: [
          edit
              ? Card(
                  child: QuillToolbar.basic(
                    controller: quillController,
                    showDividers: true,
                    showFontFamily: false,
                    showFontSize: false,
                    showBoldButton: false,
                    showItalicButton: false,
                    showSmallButton: false,
                    showUnderLineButton: false,
                    showStrikeThrough: false,
                    showInlineCode: false,
                    showColorButton: false,
                    showBackgroundColorButton: false,
                    showClearFormat: false,
                    showAlignmentButtons: false,
                    showLeftAlignment: false,
                    showCenterAlignment: false,
                    showRightAlignment: false,
                    showJustifyAlignment: false,
                    showHeaderStyle: false,
                    showListNumbers: false,
                    showListBullets: false,
                    showListCheck: false,
                    showCodeBlock: false,
                    showQuote: false,
                    showIndent: false,
                    showLink: false,
                    showUndo: true,
                    showRedo: true,
                    multiRowsDisplay: false,
                    showDirection: false,
                    showSearchButton: true,
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buildTitle(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: QuillEditor.basic(
                  controller: quillController, readOnly: !edit ? true : false),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        controller: _titleController,
        style: const TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title....',
          hintStyle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
      );
}
