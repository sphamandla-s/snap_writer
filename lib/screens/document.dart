import 'package:docs/screens/documents/new_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../models/docs_view_model.dart';
import '../themes/my_themes.dart';
import 'documents/note_card.dart';
import 'documents/search_doc.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  late List<Map<String, Object?>> _noteList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allNotes();
  }

  allNotes() async {
    setState(() {
      isLoading = true;
    });

    _noteList = await Provider.of<DocsProViewModel>(context, listen: false)
        .getAllAllNotes;

    setState(() {
      isLoading = false;
    });
    print(_noteList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Notes',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
                  ),
                  IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: SearchNotes(noteList: _noteList));
                      },
                      icon: const Icon(FontAwesomeIcons.magnifyingGlass))
                ],
              ),
              Expanded(
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: setGridLayout(_noteList.length)),
                  itemCount: _noteList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NewDocument(note: _noteList[index], isNew: false,),
                              fullscreenDialog: true),
                        );
                      },
                      child: NoteCardWidget(
                        index: index,
                        note: _noteList[index],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NewDocument(note: {}, isNew: true,),
                      fullscreenDialog: true),
                );
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                FontAwesomeIcons.pen,
                color: MyThemes.lightIconColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  int setGridLayout(int num) {
    switch (num) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 2;
      default:
        return 2;
    }
  }
}
